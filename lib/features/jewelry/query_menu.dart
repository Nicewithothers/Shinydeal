import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class QueryMenuScreen extends StatelessWidget {
  const QueryMenuScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ElevatedButton(
        onPressed: () => context.go('/'),
        child: const Text('Back'),
      )
    );
  }
}