import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:menetrend_app/features/login/login_screen.dart';
import 'package:menetrend_app/features/querymenu/query_menu.dart';

void main(){
  runApp(const MainApp());
}

final _router = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => LoginScreen()
      ),
    GoRoute(
      path: '/querymenu',
      builder: (context, state) => QueryMenuScreen(),
    ),
  ],
);

class MainApp extends StatelessWidget{
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
        home: LoginScreen(),
    );
  }
}

