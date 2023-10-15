import 'package:flutter/material.dart';

class PasswordTextField extends StatelessWidget {
  const PasswordTextField({super.key});

  @override
  Widget build(BuildContext context) {
    return const TextField(
      decoration: InputDecoration(
        prefixIcon: Icon(Icons.key),
        border: OutlineInputBorder(),
        label: Text('Password'),
      ),
      obscureText: true,
    );
  }
}
