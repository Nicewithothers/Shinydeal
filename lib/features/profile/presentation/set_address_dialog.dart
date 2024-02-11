import 'package:Shinydeal/features/profile/domain/address.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:latlong2/latlong.dart';

class SetAddressDialog extends StatefulWidget {
  const SetAddressDialog({super.key});

  @override
  State<SetAddressDialog> createState() => _AddAddressDialogState();
}

class _AddAddressDialogState extends State<SetAddressDialog> {
  final _cityTextEditingController = TextEditingController();
  final _streetTextEditingController = TextEditingController();
  final _houseNumberTextEditingController = TextEditingController();

  void _add() {
    context.pop(
      Address(
        city: _cityTextEditingController.text,
        street: _streetTextEditingController.text,
        houseNumber: _houseNumberTextEditingController.text,
        coordinates: const LatLng(0, 0),
      ),
    );
  }

  @override
  void dispose() {
    _cityTextEditingController.dispose();
    _streetTextEditingController.dispose();
    _houseNumberTextEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Set new address'),
      actions: [
        TextButton(
          onPressed: context.pop,
          child: const Text('Cancel'),
        ),
        TextButton(
          onPressed: _add,
          child: const Text('Add'),
        ),
      ],
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          TextField(
            controller: _cityTextEditingController,
            decoration: const InputDecoration(
              labelText: 'City',
            ),
          ),
          TextField(
            controller: _streetTextEditingController,
            decoration: const InputDecoration(
              labelText: 'Street',
            ),
          ),
          TextField(
            controller: _houseNumberTextEditingController,
            decoration: const InputDecoration(
              labelText: 'House number',
            ),
          ),
        ],
      ),
    );
  }
}
