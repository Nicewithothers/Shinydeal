import 'package:flutter/material.dart';

class PasswordTextField extends StatelessWidget {
  const PasswordTextField({
    super.key,
    this.valueChanged,
    this.errorText,
    this.label = 'Password'
    });

  static final OutlineInputBorder _fieldSkin = OutlineInputBorder(
      borderRadius: BorderRadius.circular(20.0),
      borderSide: const BorderSide(color: Color.fromRGBO(0, 0, 0, 1)));
  final ValueChanged<String>? valueChanged;
  final String? errorText;
  final String label;

  @override
  Widget build(BuildContext context) {
    return TextField(
      onChanged: valueChanged,
      decoration: InputDecoration(
          prefixIcon: const Icon(Icons.key),
          prefixIconColor: const Color.fromRGBO(0, 0, 0, 1),
          border: _fieldSkin,
          enabledBorder: _fieldSkin,
          focusedBorder: _fieldSkin,
          label: Text(label),
          labelStyle: const TextStyle(color: Colors.black),
          errorText: errorText),
      obscureText: true,
    );
  }
}
