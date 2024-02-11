import 'package:Shinydeal/features/profile/domain/address.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';

class AddressCard extends StatelessWidget {
  const AddressCard({super.key,required this.address});
  final Address address;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: [
          ListTile(
            title: Text(address.city),
            subtitle: Text('${address.street} ${address.houseNumber}'),
          ),
          SizedBox(
            height: 200,
            child: IgnorePointer(
              child: FlutterMap(
                mapController: MapController(),
                options: MapOptions(
                  initialCenter: address.coordinates,
                ),
                children: [
                  TileLayer(
                    urlTemplate:
                        'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
                    userAgentPackageName: 'com.nicewithothers.Shinydeal',
                  ),
                  MarkerLayer(
                    markers: [
                      Marker(
                        point: address.coordinates,
                        child: const Icon(Icons.location_on),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
