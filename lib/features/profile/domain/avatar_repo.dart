import 'dart:typed_data';
import 'package:flutter/material.dart';

abstract class ProfpicRepo {
  Future<ImageProvider<Object>> getAvatar();
  Future<void> saveAvatar(Uint8List bytes);
}
