class SignupForm {
  SignupForm({
    required this.email,
    required this.username,
    required this.password,
    required this.rePassword
});

  String email;
  String username;
  String password;
  String rePassword;

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
