import 'package:Shinydeal/features/core/model/user.dart';
import 'package:Shinydeal/features/signup/dom/signup_form.dart';

abstract class SignupRepo{
  Future<User> signUp({required SignupForm signupForm});
}