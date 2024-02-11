import 'dart:async';
import 'dart:typed_data';
import 'package:Shinydeal/features/profile/infrastructure/providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AvatarController extends AsyncNotifier<ImageProvider<Object>> {
  @override
  Future<ImageProvider<Object>> build() async => await ref.watch(avatarRepoProvider).getAvatar();

  Future<void> saveAvatar(Uint8List bytes) async {
    await ref.watch(avatarRepoProvider).saveAvatar(bytes);
    state = await AsyncValue.guard(() => ref.read(avatarRepoProvider).getAvatar());
  }
}

final avatarCtrlProvider = AsyncNotifierProvider<AvatarController, ImageProvider<Object>>(() => AvatarController());
