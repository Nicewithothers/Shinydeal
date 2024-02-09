import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:menetrend_app/features/auth/app/auth_controller.dart';
import 'package:menetrend_app/features/auth/dom/auth_repository.dart';
import 'package:menetrend_app/features/core/fields/bottom_nav_bar/bottom_nav_bar_notifier.dart';
import 'package:menetrend_app/features/jewellery_order/presentation/jewellery_order_screen.dart';
import 'package:menetrend_app/features/profile/presentation/profile_screen.dart';

class BottomNavBar extends ConsumerStatefulWidget {
  const BottomNavBar({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends ConsumerState<BottomNavBar> {
  @override
  Widget build(BuildContext context) {
    final authState = ref.watch(authCtrlProvider);
    final pos = ref.watch(botnavProvider);
    final List<Widget> _pages = [
      const JewelleryOrderScreen(),
      const ProfileScreen(),
      const InkWell()
    ];

    return Scaffold(
      body: Center(child: _pages[pos.index]),
      bottomNavigationBar: BottomNavigationBar(
      items: [
        if (authState case Verified()) ...[
          const BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Order',
          ),
          const BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
          const BottomNavigationBarItem(
            icon: Icon(Icons.logout),
            label: 'Logout',
          ),
        ] else ...[
          const BottomNavigationBarItem(
            icon: Icon(Icons.device_unknown),
            label: 'Unknown1',
          ),
          const BottomNavigationBarItem(
            icon: Icon(Icons.battery_unknown),
            label: 'Unknown2',
          ),
        ]
      ],
      currentIndex: pos.index == 2 ? 0 : pos.index,
      selectedItemColor: Colors.orange,
      onTap: (value) {
        if (value == 2) ref.read(authCtrlProvider.notifier).signOutUser();
        ref.read(botnavProvider.notifier).onChanged(value);
        },
      ),
    );
  }
}