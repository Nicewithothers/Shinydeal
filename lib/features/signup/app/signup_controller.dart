import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:menetrend_app/features/auth/app/auth_controller.dart';
import 'package:menetrend_app/features/core/model/user.dart';
import 'package:menetrend_app/features/signup/dom/signup_form.dart';
import 'package:menetrend_app/features/signup/infrastructure/fb_signup_repository.dart';

class SignupController extends Notifier<SignupForm> {
  @override
  SignupForm build() {
    return SignupForm(
      email: '',
      username: '',
      password: '',
      rePassword: '');
  }

  void updateEmail(String email) => state = state.copyWith(email: email);
  void updateUsername(String username) => state = state.copyWith(username: username);
  void updatePassword(String password) => state = state.copyWith(password: password);
  void updateRePassword(String repassword) => state = state.copyWith(rePassword: repassword);

  Future<User> signUp() async {
    if (state.isFormValid) {
      final user = await ref.read(signupProvider).signUp(
        signupForm: state
        );
      await ref.read(authCtrlProvider.notifier).signInUser(
        email: state.email,
        password: state.password
        );
      return user;
    } else {
      throw Exception('Form invalid. Try again!');
    }
  }
}

final signupCtrlProvider = NotifierProvider<SignupController, SignupForm>(() => SignupController());