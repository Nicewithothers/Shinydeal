import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:menetrend_app/features/core/model/user.dart';

part 'login_form.freezed.dart';

@freezed
class LoginForm with _$LoginForm {
  const LoginForm._();

  factory LoginForm({
    required String email,
    required String password,
}) = _LoginForm;

  String? get emailErrorText => email.isEmpty ? "Email is missing!" : null;
  String? get passwordErrorText => password.isEmpty ? 'Password is missing!' : null;

  bool get isFormValid => email.isNotEmpty && password.isNotEmpty;
}

abstract class LoginRepo{
  Future<User> signIn({required LoginForm loginForm});
}