import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:menetrend_app/features/login/login_screen.dart';
import 'package:menetrend_app/features/newpassword/newpassword_screen.dart';
import 'package:menetrend_app/features/jewelry/query_menu.dart';
import 'package:menetrend_app/features/signup/pres/signup_screen.dart';
import 'package:menetrend_app/features/welcome/welcome_screen.dart';

final _gkey = GlobalKey<NavigatorState>();

void redirect() {
  
}

final routerProv = Provider<GoRouter>((ref) {
  return GoRouter(
    navigatorKey: _gkey,
    initialLocation: '/',
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
      path: '/querymenu',
      builder: (context, state) => const QueryMenuScreen(),
    ),
    GoRoute(
      path: '/newpassword',
      builder: (context, state) => const NewPasswordScreen(),
    ),]
  );
});