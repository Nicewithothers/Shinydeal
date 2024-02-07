import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:menetrend_app/features/auth/app/auth_controller.dart';
import 'package:menetrend_app/features/core/model/user.dart';
import 'package:menetrend_app/features/login/dom/login_form.dart';
import 'package:menetrend_app/features/login/infrastructure/fb_login_rep.dart';

class LoginController extends Notifier<LoginForm> {
  @override
  LoginForm build() {
    return LoginForm(email: '', password: '');
  }

  void updateEmail(String email) => state = state.copyWith(email: email);
  void updatePassword(String password) => state = state.copyWith(password: password);

  Future<User> signIn() async {
    if (state.isFormValid) {
      final user = await ref.read(signinProvider).signIn(loginForm: state);
      await ref.read(authCtrlProvider.notifier).signInUser(email: state.email, password: state.password);
      return user;
    } else {
      throw Exception('Form invalid. Try again!');
    }
  }
}

final signinCtrlProvider = NotifierProvider<LoginController, LoginForm>(() => LoginController());