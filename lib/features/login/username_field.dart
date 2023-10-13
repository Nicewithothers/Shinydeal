import 'package:flutter/material.dart';

class UsernameTextField extends StatefulWidget{
  const UsernameTextField({super.key});
  
  @override
  State<UsernameTextField> createState() =>  _UsernameFieldState();
}

class _UsernameFieldState extends State<UsernameTextField>{
  String? _errorText;

  void _validator(String value){
    setState(() {
      _errorText = value.isEmpty ? 'Username is missing!' : null;
    });
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      onChanged: _validator,
      decoration: InputDecoration(
        label: const Text('Username'),
        icon: const Icon(Icons.person),
        errorText: _errorText,
      ),
      obscureText: true,
    );
  }
}