// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'address.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AddressImpl _$$AddressImplFromJson(Map<String, dynamic> json) =>
    _$AddressImpl(
      city: json['city'] as String,
      street: json['street'] as String,
      houseNumber: json['houseNumber'] as String,
      coordinates: json['coordinates'] == null
          ? const LatLng(0, 0)
          : LatLng.fromJson(json['coordinates'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$AddressImplToJson(_$AddressImpl instance) =>
    <String, dynamic>{
      'city': instance.city,
      'street': instance.street,
      'houseNumber': instance.houseNumber,
      'coordinates': instance.coordinates,
    };
