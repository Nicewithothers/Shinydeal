import 'package:menetrend_app/features/core/model/user.dart';
import 'package:menetrend_app/features/signup/core/signup_form.dart';

abstract class SignupRepo{
  Future<User> signUp({required SignupForm signupForm});
}