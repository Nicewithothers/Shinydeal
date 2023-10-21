import 'package:flutter/material.dart';

class PasswordTextField extends StatelessWidget {
  const PasswordTextField({super.key});

  static final OutlineInputBorder _fieldSkin = OutlineInputBorder(
    borderRadius: BorderRadius.circular(20.0),
    borderSide: const BorderSide(color: Color.fromRGBO(0, 0, 0, 1))
  );

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        prefixIcon: const Icon(Icons.key),
        prefixIconColor: const Color.fromRGBO(0, 0, 0, 1),
        border: _fieldSkin,
        enabledBorder: _fieldSkin,
        focusedBorder: _fieldSkin,
        label: const Text('Password'),
        labelStyle: const TextStyle(color: Colors.black)
      ),
      obscureText: true,
    );
  }
}
