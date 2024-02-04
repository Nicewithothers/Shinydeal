import 'package:flutter_riverpod/flutter_riverpod.dart';

class CoreController extends StateNotifier<int> {
  CoreController(super.state);

  void setPosition(int value) {
    state = value;
  }
}

final coreCtrlProvider = StateNotifierProvider<CoreController,int>((ref) => CoreController(0));