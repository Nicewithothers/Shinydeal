import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:menetrend_app/features/auth/app/auth_controller.dart';
import 'package:menetrend_app/features/auth/dom/auth_repository.dart';
import 'package:menetrend_app/features/core/infrastructure/core_provider.dart';

class BottomNavBar extends ConsumerStatefulWidget {
  const BottomNavBar({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends ConsumerState<BottomNavBar> {
  @override
  Widget build(BuildContext context) {
    final authState = ref.watch(authCtrlProvider);
    final pos = ref.watch(coreCtrlProvider);

    void _onTapped(int index) {
      ref.read(coreCtrlProvider.notifier).setPosition(index);
      if (authState case Verified()) {
        switch (index) {
          case 0:
            context.go('/jewelleryordermenu');
          case 1:
            context.go('/profile');
          case 2:
            ref.read(authCtrlProvider.notifier).signOutUser();
            context.go('/');
          default:
        }
      } else if (authState case Unverified()) {
        switch (index) {
          case 0:
            context.go('/login');
          case 1:
            context.go('/signup');
          case 2:
            context.go('/newpassword');
          default:
        }
      }
    }

    return BottomNavigationBar(
      items: [
        if (authState case Verified(:final user)) ...[
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
        ] else if (authState case Unverified()) ...[
          const BottomNavigationBarItem(
            icon: Icon(Icons.login),
            label: 'Login',
          ),
          const BottomNavigationBarItem(
            icon: Icon(Icons.app_registration),
            label: 'Register',
          ),
          const BottomNavigationBarItem(
            icon: Icon(Icons.key),
            label: 'Re-Password',
          ),
        ] else ...[
          const BottomNavigationBarItem(
            icon: Icon(Icons.device_unknown),
            label: 'Unknown',
          ),
        ]
      ],
      currentIndex: pos,
      selectedItemColor: Colors.orange,
      onTap:(value) => _onTapped(value),
    );
  }
}
