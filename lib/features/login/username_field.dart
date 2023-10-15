import 'package:flutter/material.dart';

class UsernameTextField extends StatefulWidget {
  const UsernameTextField({super.key});

  @override
  State<UsernameTextField> createState() => _UsernameFieldState();
}

class _UsernameFieldState extends State<UsernameTextField> {
  String? _errorText;

  void _validator(String value) {
    setState(() => _errorText = value.isEmpty ? 'Username is missing!' : null);
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      onChanged: _validator,
      decoration: InputDecoration(
        prefixIcon: const Icon(Icons.person),
        border: const OutlineInputBorder(),
        label: const Text('Username'),
        errorText: _errorText,
      ),
    );
  }
}
