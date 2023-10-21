import 'package:flutter/material.dart';

class UsernameTextField extends StatefulWidget {
  const UsernameTextField({super.key});

  @override
  State<UsernameTextField> createState() => _UsernameFieldState();
}

class _UsernameFieldState extends State<UsernameTextField> {
  String? _errorText;
  static final OutlineInputBorder _fieldSkin = OutlineInputBorder(
    borderRadius: BorderRadius.circular(20.0),
    borderSide: const BorderSide(color: Color.fromRGBO(0, 0, 0, 1))
  );

  void _validator(String value) {
    setState(() => _errorText = value.isEmpty ? 'Username is missing!' : null);
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      onChanged: _validator,
      decoration: InputDecoration(
        prefixIcon: const Icon(Icons.person),
        prefixIconColor: Colors.black,
        border: _fieldSkin,
        enabledBorder: _fieldSkin,
        focusedBorder: _fieldSkin,
        label: const Text('Username'),
        labelStyle: const TextStyle(color: Colors.black),
        errorText: _errorText,
      ),
    );
  }
}
