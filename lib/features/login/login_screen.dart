import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:menetrend_app/features/login/username_field.dart';
import 'package:menetrend_app/features/login/password_field.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Menetrendek_app'),
      ),
      body: Column(
        children: [
          const Icon(
            Icons.tram_outlined,
            size: 64,
            color: Colors.yellowAccent
          ),
          const UsernameTextField(),
          const PasswordTextField(),
          ElevatedButton(
            onPressed: () {
              context.go('/querymenu');
            },
            child: const Text('Login'),
          ),
        ],
      ),
    );
  }
}
