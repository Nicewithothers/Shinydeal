import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:Shinydeal/features/core/model/user.dart' as data;
import 'package:Shinydeal/features/signup/dom/signup_form.dart';
import 'package:Shinydeal/features/signup/dom/signup_rep.dart';

class FirebaseSignupRepository extends SignupRepo {
  @override
  Future<data.User> signUp({required SignupForm signupForm}) async {
    final cred = await FirebaseAuth.instance.createUserWithEmailAndPassword(
      email: signupForm.email,
      password: signupForm.password,
      );
    await cred.user!.updateDisplayName(signupForm.username);
    return data.User(
      uid: cred.user!.uid,
      name: signupForm.username,
      email: signupForm.email,
    );
  }
}

final signupProvider = Provider<SignupRepo>((ref) => FirebaseSignupRepository());