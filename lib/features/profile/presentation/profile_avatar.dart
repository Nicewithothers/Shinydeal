import 'package:Shinydeal/features/profile/application/avatar_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';

class ProfileAvatar extends ConsumerWidget {
  const ProfileAvatar({super.key});

  Future<void> _onTap(BuildContext context, WidgetRef ref) async {
    final avatarCtrl = ref.read(avatarCtrlProvider.notifier);
    final messenger = ScaffoldMessenger.of(context);
    final ImagePicker picker = ImagePicker();
    final XFile? image = await picker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      final bytes = await image.readAsBytes();
      await avatarCtrl.saveAvatar(bytes);
      messenger.showMaterialBanner(
        MaterialBanner(
          actions: [
             TextButton(
              onPressed: () => messenger.removeCurrentMaterialBanner(),
              child: const Text('OK')
            )
          ],
          content: const Text('Profile updated!')
          )
      );
    }
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final avatarValue = ref.watch(avatarCtrlProvider);
    return GestureDetector(
      child: CircleAvatar(
        radius: 65,
        backgroundImage: switch (avatarValue) {
          AsyncData(:final value) => value,
          _ => null,
        },
        child: switch (avatarValue) {
          AsyncLoading() => const CircularProgressIndicator(),
          AsyncError() => const Icon(Icons.error),
          _ => null,
        },
      ),
      onTap: () => _onTap(context, ref),
    );
  }
}
