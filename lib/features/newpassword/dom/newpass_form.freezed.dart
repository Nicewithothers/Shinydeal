// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'newpass_form.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$NewPassForm {
  String get email => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $NewPassFormCopyWith<NewPassForm> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NewPassFormCopyWith<$Res> {
  factory $NewPassFormCopyWith(
          NewPassForm value, $Res Function(NewPassForm) then) =
      _$NewPassFormCopyWithImpl<$Res, NewPassForm>;
  @useResult
  $Res call({String email});
}

/// @nodoc
class _$NewPassFormCopyWithImpl<$Res, $Val extends NewPassForm>
    implements $NewPassFormCopyWith<$Res> {
  _$NewPassFormCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? email = null,
  }) {
    return _then(_value.copyWith(
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$NewPassFormImplCopyWith<$Res>
    implements $NewPassFormCopyWith<$Res> {
  factory _$$NewPassFormImplCopyWith(
          _$NewPassFormImpl value, $Res Function(_$NewPassFormImpl) then) =
      __$$NewPassFormImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String email});
}

/// @nodoc
class __$$NewPassFormImplCopyWithImpl<$Res>
    extends _$NewPassFormCopyWithImpl<$Res, _$NewPassFormImpl>
    implements _$$NewPassFormImplCopyWith<$Res> {
  __$$NewPassFormImplCopyWithImpl(
      _$NewPassFormImpl _value, $Res Function(_$NewPassFormImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? email = null,
  }) {
    return _then(_$NewPassFormImpl(
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$NewPassFormImpl extends _NewPassForm {
  _$NewPassFormImpl({required this.email}) : super._();

  @override
  final String email;

  @override
  String toString() {
    return 'NewPassForm(email: $email)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$NewPassFormImpl &&
            (identical(other.email, email) || other.email == email));
  }

  @override
  int get hashCode => Object.hash(runtimeType, email);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$NewPassFormImplCopyWith<_$NewPassFormImpl> get copyWith =>
      __$$NewPassFormImplCopyWithImpl<_$NewPassFormImpl>(this, _$identity);
}

abstract class _NewPassForm extends NewPassForm {
  factory _NewPassForm({required final String email}) = _$NewPassFormImpl;
  _NewPassForm._() : super._();

  @override
  String get email;
  @override
  @JsonKey(ignore: true)
  _$$NewPassFormImplCopyWith<_$NewPassFormImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
