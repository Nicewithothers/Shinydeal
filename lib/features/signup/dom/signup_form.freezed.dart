// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'signup_form.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$SignupForm {
  String get email => throw _privateConstructorUsedError;
  String get username => throw _privateConstructorUsedError;
  String get password => throw _privateConstructorUsedError;
  String get rePassword => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $SignupFormCopyWith<SignupForm> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SignupFormCopyWith<$Res> {
  factory $SignupFormCopyWith(
          SignupForm value, $Res Function(SignupForm) then) =
      _$SignupFormCopyWithImpl<$Res, SignupForm>;
  @useResult
  $Res call(
      {String email, String username, String password, String rePassword});
}

/// @nodoc
class _$SignupFormCopyWithImpl<$Res, $Val extends SignupForm>
    implements $SignupFormCopyWith<$Res> {
  _$SignupFormCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? email = null,
    Object? username = null,
    Object? password = null,
    Object? rePassword = null,
  }) {
    return _then(_value.copyWith(
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      username: null == username
          ? _value.username
          : username // ignore: cast_nullable_to_non_nullable
              as String,
      password: null == password
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String,
      rePassword: null == rePassword
          ? _value.rePassword
          : rePassword // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SignupFormImplCopyWith<$Res>
    implements $SignupFormCopyWith<$Res> {
  factory _$$SignupFormImplCopyWith(
          _$SignupFormImpl value, $Res Function(_$SignupFormImpl) then) =
      __$$SignupFormImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String email, String username, String password, String rePassword});
}

/// @nodoc
class __$$SignupFormImplCopyWithImpl<$Res>
    extends _$SignupFormCopyWithImpl<$Res, _$SignupFormImpl>
    implements _$$SignupFormImplCopyWith<$Res> {
  __$$SignupFormImplCopyWithImpl(
      _$SignupFormImpl _value, $Res Function(_$SignupFormImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? email = null,
    Object? username = null,
    Object? password = null,
    Object? rePassword = null,
  }) {
    return _then(_$SignupFormImpl(
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      username: null == username
          ? _value.username
          : username // ignore: cast_nullable_to_non_nullable
              as String,
      password: null == password
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String,
      rePassword: null == rePassword
          ? _value.rePassword
          : rePassword // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$SignupFormImpl extends _SignupForm {
  _$SignupFormImpl(
      {required this.email,
      required this.username,
      required this.password,
      required this.rePassword})
      : super._();

  @override
  final String email;
  @override
  final String username;
  @override
  final String password;
  @override
  final String rePassword;

  @override
  String toString() {
    return 'SignupForm(email: $email, username: $username, password: $password, rePassword: $rePassword)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SignupFormImpl &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.username, username) ||
                other.username == username) &&
            (identical(other.password, password) ||
                other.password == password) &&
            (identical(other.rePassword, rePassword) ||
                other.rePassword == rePassword));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, email, username, password, rePassword);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SignupFormImplCopyWith<_$SignupFormImpl> get copyWith =>
      __$$SignupFormImplCopyWithImpl<_$SignupFormImpl>(this, _$identity);
}

abstract class _SignupForm extends SignupForm {
  factory _SignupForm(
      {required final String email,
      required final String username,
      required final String password,
      required final String rePassword}) = _$SignupFormImpl;
  _SignupForm._() : super._();

  @override
  String get email;
  @override
  String get username;
  @override
  String get password;
  @override
  String get rePassword;
  @override
  @JsonKey(ignore: true)
  _$$SignupFormImplCopyWith<_$SignupFormImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
