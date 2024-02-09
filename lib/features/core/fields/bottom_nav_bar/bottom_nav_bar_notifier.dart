import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:menetrend_app/features/core/fields/bottom_nav_bar/bottom_nav_states.dart';

class BottomNavBarNotifier extends StateNotifier<BottomNavBarStates> {
  BottomNavBarNotifier(): super(const BottomNavBarStates());
  
  void onChanged(int index) => state = state.copyWith(index: index);
}

final botnavProvider = StateNotifierProvider<BottomNavBarNotifier, BottomNavBarStates>((ref) => BottomNavBarNotifier());