import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:menetrend_app/features/auth/app/auth_controller.dart';
import 'package:menetrend_app/features/auth/dom/auth_repository.dart';
import 'package:menetrend_app/features/login/presentation/login_screen.dart';
import 'package:menetrend_app/features/newpassword/newpassword_screen.dart';
import 'package:menetrend_app/features/jewellery_order/presentation/jewellery_order_screen.dart';
import 'package:menetrend_app/features/profile/presentation/profile_screen.dart';
import 'package:menetrend_app/features/signup/presentation/signup_screen.dart';
import 'package:menetrend_app/features/welcome/welcome_screen.dart';

final _gkey = GlobalKey<NavigatorState>();

final routerProv = Provider<GoRouter>((ref) {
  final authState = ref.watch(authCtrlProvider);
  String? redirecting(BuildContext context, GoRouterState state) {
    switch (authState) {
      case Verified():
        return (state.uri.toString() == '/login' || state.uri.toString() == '/signup') ? null : '/jewelleryorder';
      case Unverified():
        return (state.uri.toString() == '/login' || state.uri.toString() == '/signup') ? null : '/login';
      default:
        return null;
    }
  }
  
  return GoRouter(
    navigatorKey: _gkey,
    initialLocation: '/',
    redirect: (context, state) => redirecting(context, state),
    routes: [
      GoRoute(
      path: '/',
      builder: (context, state) => const WelcomeScreen(),
    ),
    GoRoute(
      path: '/login',
      builder: (context, state) => const LoginScreen(),
    ),
    GoRoute(
      path: '/signup',
      builder: (context, state) => const SignupScreen(),
    ),
    GoRoute(
      path: '/jewelleryorder',
      builder: (context, state) => const JewelleryOrderScreen(),
    ),
    GoRoute(
      path: '/newpassword',
      builder: (context, state) => const NewPasswordScreen(),
    ),
    GoRoute(
      path: '/profile',
      builder: (context, state) => const ProfileScreen(),
    ),
    ]
  );
});