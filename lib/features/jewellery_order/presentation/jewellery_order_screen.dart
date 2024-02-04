import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:menetrend_app/features/jewellery_order/app/jewelleries.dart';
import 'package:menetrend_app/features/core/fields/bottom_nav_bar.dart';

class JewelleryOrderScreen extends ConsumerWidget {
  const JewelleryOrderScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Jewellery order'),
      ),
      body: ElevatedButton(
        onPressed: () => context.go('/'),
        child: const Text('Back'),
      ),
      bottomNavigationBar: const BottomNavBar(),
    );
  }
}