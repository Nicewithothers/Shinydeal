import 'dart:async';

import 'package:Shinydeal/features/auth/app/auth_controller.dart';
import 'package:Shinydeal/features/auth/dom/auth_repository.dart';
import 'package:Shinydeal/features/profile/domain/address.dart';
import 'package:Shinydeal/features/profile/domain/user_profile.dart';
import 'package:Shinydeal/features/profile/infrastructure/providers.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';


class ProfileController extends AsyncNotifier<UserProfile> {
  @override
  Future<UserProfile> build() async {
    final profileRepo = ref.watch(profileRepoProvider);
    final user = ref.watch(authCtrlProvider);
    return switch (user) {
      Verified(:final user) => await profileRepo.getUserProfile(user.uid),
      Unknown() || Unverified() => UserProfile(uid: '', phone: '', address: Address(
        city: '',
        street: '',
        houseNumber: '',
        )
      ),
    };
  }

  Future<void> updateProfile(UserProfile profile) async {
    final profileRepo= ref.watch(profileRepoProvider);
    state = await AsyncValue.guard(() => profileRepo.updateUserProfile(profile));
  }

  Future<void> setAddress(Address address) async {
    switch (state) {
      case AsyncData(:final value):
        final coordinates = await ref.read(addressProvider).getAddress(
              city: address.city,
              street: address.street,
              houseNumber: address.houseNumber,
            );
        final updatedProfile = value.copyWith(address: address.copyWith(coordinates: coordinates));
        return updateProfile(updatedProfile);
      default:
        throw StateError('Failed to set address!');
    }
  }
}

final profileCtrlProvider = AsyncNotifierProvider<ProfileController, UserProfile>(() => ProfileController());
