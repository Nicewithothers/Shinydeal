import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:latlong2/latlong.dart';

part 'address.freezed.dart';
part 'address.g.dart';

@freezed
class Address with _$Address {
  const factory Address({
    required String city,
    required String street,
    required String houseNumber,
    @Default(LatLng(0, 0)) LatLng coordinates,
  }) = _Address;

  factory Address.fromJson(Map<String, dynamic> json) =>
      _$AddressFromJson(json);
}

abstract class AddressRepo {
  Future<LatLng> getAddress({
    required String city,
    required String street,
    required String houseNumber,
  });
}