import 'package:flutter/material.dart';

class UsernameTextField extends StatelessWidget {
  const UsernameTextField({super.key, this.errorText, this.valueChanged});

  static final OutlineInputBorder _fieldSkin = OutlineInputBorder(
      borderRadius: BorderRadius.circular(20.0),
      borderSide: const BorderSide(color: Color.fromRGBO(0, 0, 0, 1)));
  final String? errorText;
  final ValueChanged<String>? valueChanged;

  @override
  Widget build(BuildContext context) {
    return TextField(
      onChanged: valueChanged,
      decoration: InputDecoration(
        prefixIcon: const Icon(Icons.person),
        prefixIconColor: Colors.black,
        border: _fieldSkin,
        enabledBorder: _fieldSkin,
        focusedBorder: _fieldSkin,
        label: const Text('Username'),
        labelStyle: const TextStyle(color: Colors.black),
        errorText: errorText,
      ),
    );
  }
}
