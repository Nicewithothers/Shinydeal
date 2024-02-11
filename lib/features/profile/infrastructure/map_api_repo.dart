import 'package:Shinydeal/features/profile/domain/address.dart';
import 'package:dio/dio.dart';
import 'package:latlong2/latlong.dart';

class MapApiRepo extends AddressRepo {
  MapApiRepo({required this.dio,});
  final Dio dio;

  Uri _mapLink({
    required String city,
    required String street,
    required String houseNumber,
  }) => Uri.parse('https://nominatim.openstreetmap.org/search?format=json&counrty=Hungary&city=$city&street=$street&houseNumber=$houseNumber');

  @override
  Future<LatLng> getAddress({required String city, required String street, required String houseNumber}) async {
    try {
      final response = await dio.getUri(_mapLink(
        city: city,
        street: street,
        houseNumber: houseNumber,
      ));
      if (response.statusCode == 200 && response.data.length > 0) {
          return LatLng(
            double.parse(response.data[0]['lat']),
            double.parse(response.data[0]['lon']),
          );
        } else {
          return const LatLng(0, 0);
        }
      } catch (e) {
      return const LatLng(0, 0);
    }
  }
}
