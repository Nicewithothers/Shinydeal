// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'jewellery.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$Jewellery {
  String get name => throw _privateConstructorUsedError;
  double get price => throw _privateConstructorUsedError;
  String get picture => throw _privateConstructorUsedError;
  Accessory get accessory => throw _privateConstructorUsedError;
  Type get type => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $JewelleryCopyWith<Jewellery> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $JewelleryCopyWith<$Res> {
  factory $JewelleryCopyWith(Jewellery value, $Res Function(Jewellery) then) =
      _$JewelleryCopyWithImpl<$Res, Jewellery>;
  @useResult
  $Res call(
      {String name,
      double price,
      String picture,
      Accessory accessory,
      Type type});
}

/// @nodoc
class _$JewelleryCopyWithImpl<$Res, $Val extends Jewellery>
    implements $JewelleryCopyWith<$Res> {
  _$JewelleryCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? price = null,
    Object? picture = null,
    Object? accessory = null,
    Object? type = null,
  }) {
    return _then(_value.copyWith(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      price: null == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as double,
      picture: null == picture
          ? _value.picture
          : picture // ignore: cast_nullable_to_non_nullable
              as String,
      accessory: null == accessory
          ? _value.accessory
          : accessory // ignore: cast_nullable_to_non_nullable
              as Accessory,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as Type,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$JewelleryImplCopyWith<$Res>
    implements $JewelleryCopyWith<$Res> {
  factory _$$JewelleryImplCopyWith(
          _$JewelleryImpl value, $Res Function(_$JewelleryImpl) then) =
      __$$JewelleryImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String name,
      double price,
      String picture,
      Accessory accessory,
      Type type});
}

/// @nodoc
class __$$JewelleryImplCopyWithImpl<$Res>
    extends _$JewelleryCopyWithImpl<$Res, _$JewelleryImpl>
    implements _$$JewelleryImplCopyWith<$Res> {
  __$$JewelleryImplCopyWithImpl(
      _$JewelleryImpl _value, $Res Function(_$JewelleryImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? price = null,
    Object? picture = null,
    Object? accessory = null,
    Object? type = null,
  }) {
    return _then(_$JewelleryImpl(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      price: null == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as double,
      picture: null == picture
          ? _value.picture
          : picture // ignore: cast_nullable_to_non_nullable
              as String,
      accessory: null == accessory
          ? _value.accessory
          : accessory // ignore: cast_nullable_to_non_nullable
              as Accessory,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as Type,
    ));
  }
}

/// @nodoc

class _$JewelleryImpl implements _Jewellery {
  const _$JewelleryImpl(
      {required this.name,
      required this.price,
      required this.picture,
      required this.accessory,
      required this.type});

  @override
  final String name;
  @override
  final double price;
  @override
  final String picture;
  @override
  final Accessory accessory;
  @override
  final Type type;

  @override
  String toString() {
    return 'Jewellery(name: $name, price: $price, picture: $picture, accessory: $accessory, type: $type)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$JewelleryImpl &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.price, price) || other.price == price) &&
            (identical(other.picture, picture) || other.picture == picture) &&
            (identical(other.accessory, accessory) ||
                other.accessory == accessory) &&
            (identical(other.type, type) || other.type == type));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, name, price, picture, accessory, type);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$JewelleryImplCopyWith<_$JewelleryImpl> get copyWith =>
      __$$JewelleryImplCopyWithImpl<_$JewelleryImpl>(this, _$identity);
}

abstract class _Jewellery implements Jewellery {
  const factory _Jewellery(
      {required final String name,
      required final double price,
      required final String picture,
      required final Accessory accessory,
      required final Type type}) = _$JewelleryImpl;

  @override
  String get name;
  @override
  double get price;
  @override
  String get picture;
  @override
  Accessory get accessory;
  @override
  Type get type;
  @override
  @JsonKey(ignore: true)
  _$$JewelleryImplCopyWith<_$JewelleryImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
