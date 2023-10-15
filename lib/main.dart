import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:menetrend_app/features/login/login_screen.dart';
import 'package:menetrend_app/features/querymenu/query_menu.dart';
import 'package:menetrend_app/features/welcome/welcome_screen.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(statusBarColor: Colors.transparent));
  runApp(const MainApp());
}

final _router = GoRouter(
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
      builder: (context, state) => const QueryMenuScreen(),
    ),
    GoRoute(
      path: '/querymenu',
      builder: (context, state) => const QueryMenuScreen(),
    ),
    GoRoute(
      path: '/newpassword',
      builder: (context, state) => const QueryMenuScreen(),
    ),
  ],
);

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: _router,
      theme: ThemeData(
          textTheme: GoogleFonts.manropeTextTheme(Theme.of(context).textTheme)),
      debugShowCheckedModeBanner: false,
    );
  }
}
