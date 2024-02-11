import 'package:Shinydeal/features/auth/app/auth_controller.dart';
import 'package:Shinydeal/features/auth/dom/auth_repository.dart';
import 'package:Shinydeal/features/core/model/user.dart';
import 'package:Shinydeal/features/profile/application/profile_controller.dart';
import 'package:Shinydeal/features/profile/domain/address.dart';
import 'package:Shinydeal/features/profile/domain/user_profile.dart';
import 'package:Shinydeal/features/profile/presentation/address_card.dart';
import 'package:Shinydeal/features/profile/presentation/profile_avatar.dart';
import 'package:Shinydeal/features/profile/presentation/set_address_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class ProfileScreen extends ConsumerWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final authState = ref.watch(authCtrlProvider);

    return Scaffold(
      appBar: AppBar(),
      body: switch (authState) {
        Verified(:final user) => _ProfileScreen(user: user),
        Unverified() => const _Unverified(),
        Unknown() => const Center(
            child: CircularProgressIndicator(),
          ),
      },
    );
  }
}

class _ProfileScreen extends ConsumerWidget {
  const _ProfileScreen({required this.user});
  final User user;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final userValue = ref.watch(profileCtrlProvider);
    return switch (userValue) {
      AsyncError() => const Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Can not load your profile'),
            ],
          ),
        ),
      AsyncData(:final value) => _ProfileListing(
          user: user,
          userProfile: value,
        ),
      _ => const Center(
          child: CircularProgressIndicator(),
        ),
    };
  }
}

class _ProfileListing extends ConsumerStatefulWidget {
  const _ProfileListing({required this.user, required this.userProfile});
  final User user;
  final UserProfile userProfile;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _ProfileListingState();
}

class _ProfileListingState extends ConsumerState<_ProfileListing> {
  late final TextEditingController _phoneTEC;

  Future<void> _updateProfile() async {
    final messenger = ScaffoldMessenger.of(context);
    await ref.read(profileCtrlProvider.notifier).updateProfile(
          widget.userProfile.copyWith(
            phone: _phoneTEC.text,
          ),
        );
    messenger.showMaterialBanner(MaterialBanner(
      actions: [
        TextButton(
            onPressed: () => messenger.removeCurrentMaterialBanner(),
            child: const Text('OK'))
      ],
      content: const Text('Profile Saved'),
    ));
  }

  Future<void> _setAddress() async {
    final address = await showDialog<Address>(
      context: context,
      builder: (context) => const SetAddressDialog(),
    );
    if (address != null) {
      ref.read(profileCtrlProvider.notifier).setAddress(address);
    }
  }

  @override
  void initState() {
    super.initState();
    _phoneTEC = TextEditingController(text: widget.userProfile.phone);
  }

  @override
  void didUpdateWidget(covariant _ProfileListing oldWidget) {
    super.didUpdateWidget(oldWidget);
    _phoneTEC.text = widget.userProfile.phone ?? '';
  }

  @override
  void dispose() {
    _phoneTEC.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          Column(
            children: [
              const ProfileAvatar(),
              Text(widget.user.name),
            ],
          ),
          Flexible(
            flex: 2,
            child: TextField(
              controller: _phoneTEC,
              decoration: const InputDecoration(
                labelText: 'Phone',
              ),
            ),
          ),
          const Divider(),
          Row(
            children: [
              const Expanded(
                child: Text('Addresses'),
              ),
              IconButton(
                onPressed: _setAddress,
                icon: const Icon(Icons.add),
              ),
            ],
          ),
          Expanded(
            child: _Address(
              userProfile: widget.userProfile,
            ),
          ),
          ElevatedButton(
            onPressed: _updateProfile,
            child: const Text('Update'),
          ),
        ],
      ),
    );
  }
}

class _Address extends StatelessWidget {
  const _Address({required this.userProfile});
  final UserProfile userProfile;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (context, index) {
        final address = userProfile.address;
        return AddressCard(address: address);
      },
    );
  }
}

class _Unverified extends StatelessWidget {
  const _Unverified();

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const Text('You are not logged in'),
        ElevatedButton(
          onPressed: () {
            context.go('/sign-up');
          },
          child: const Text('Sign up'),
        ),
        ElevatedButton(
          onPressed: () {
            context.go('/');
          },
          child: const Text('Login'),
        ),
      ],
    );
  }
}
