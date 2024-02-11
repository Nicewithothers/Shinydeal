import 'dart:io';
import 'dart:typed_data';
import 'package:Shinydeal/features/profile/domain/avatar_repo.dart';
import 'package:flutter/material.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';

class ProfpicRepository extends ProfpicRepo {
  Future<String> get _avatarPath async => joinAll([(await getApplicationDocumentsDirectory()).path,'avatar.png']);

  @override
  Future<ImageProvider<Object>> getAvatar() async {
    final file = File(await _avatarPath);
    switch (file.existsSync()) {
      case true:
        return FileImage(file);
      case false:
        return const AssetImage('unknown_avatar.png');
    }
  }

  @override
  Future<void> saveAvatar(Uint8List bytes) async => await File(await _avatarPath).writeAsBytes(bytes, flush: true);
}
