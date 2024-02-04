import 'package:freezed_annotation/freezed_annotation.dart';

part 'jewellery.freezed.dart';

enum Accessory {necklace, ring, bracelet, earring}
enum Type {silver, gold, platinum, diamond}

@freezed
class Jewellery with _$Jewellery {
  const factory Jewellery({
    required String name,
    required double price,
    required String picture,
    required Accessory accessory,
    required Type type,
  }) = _Jewellery;
}