import 'package:freezed_annotation/freezed_annotation.dart';

part 'signup_form.freezed.dart';

@freezed
class SignupForm with _$SignupForm {
  const SignupForm._();

  factory SignupForm({
    required String email,
    required String username,
    required String password,
    required String rePassword
}) = _SignupForm;

  String? get emailErrorText => email.isEmpty ? 'Email is missing!' : null;
  String? get usernameErrorText => username.isEmpty ? 'Username is missing!' : null;
  String? get passwordErrorText => password.isEmpty ? 'Password is missing!' : null;
  String? get rePasswordErrorText => rePassword.isEmpty ? 'RePassword is missing!': password != rePassword ? "Passwords don't match!" : null;

  bool get isFormValid =>
    email.isNotEmpty &&
    username.isNotEmpty &&
    password.isNotEmpty &&
    rePassword.isNotEmpty &&
    password == rePassword;
}
