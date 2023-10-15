import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:menetrend_app/features/login/username_field.dart';
import 'package:menetrend_app/features/login/password_field.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(flex: 2, child: Container(color: Colors.transparent)),
          Expanded(
              flex: 6,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const UsernameTextField(),
                  const SizedBox(height: 50),
                  const PasswordTextField(),
                  ElevatedButton(
                    onPressed: () => context.go('/querymenu'),
                    child: const Text('Login'),
                  ),
                ],
              )),
          Expanded(flex: 2, child: Container(color: Colors.transparent)),
        ],
      ),
    );
  }
}
