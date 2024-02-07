import 'package:menetrend_app/features/core/model/user.dart';
import 'package:menetrend_app/features/login/dom/login_form.dart';

abstract class LoginRepo{
  Future<User> signIn({required LoginForm loginForm});
}