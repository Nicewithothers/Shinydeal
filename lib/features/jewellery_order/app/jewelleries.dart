import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:menetrend_app/features/jewellery_order/dom/jewellery.dart';

final jewelleryProvider = Provider<List<Jewellery>>((ref) => [
  const Jewellery(
    name: 'Diamond Ring',
    price: 300,
    picture: 'assets/jewelleries/jewellery_diamondring.png',
    accessory: Accessory.ring,
    type: Type.diamond,
    ),
  const Jewellery(
    name: 'Gold Bracelet',
    price: 175,
    picture: 'assets/jewelleries/jewellery_goldbracelet.png',
    accessory: Accessory.bracelet,
    type: Type.gold,
    ),
  const Jewellery(
    name: 'Platinum Necklace',
    price: 550,
    picture: 'assets/jewelleries/jewellery_platinumnecklace.png',
    accessory: Accessory.necklace,
    type: Type.platinum,
    ),
  const Jewellery(
    name: 'Silver Earring',
    price: 550,
    picture: 'assets/jewelleries/jewellery_silverearring.png',
    accessory: Accessory.earring,
    type: Type.silver,
    ),
]);