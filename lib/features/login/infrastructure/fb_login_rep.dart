import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:menetrend_app/features/core/model/user.dart' as data;
import 'package:menetrend_app/features/login/dom/login_form.dart';
import 'package:menetrend_app/features/login/dom/login_rep.dart';

class FirebaseLoginRep extends LoginRepo {
  @override
  Future<data.User> signIn({required LoginForm loginForm}) async {
    final cred = await FirebaseAuth.instance.signInWithEmailAndPassword(email: loginForm.email, password: loginForm.password);
    return data.User(
      uid: cred.user!.uid,
      name: cred.user!.displayName ?? "Unknown",
      email: loginForm.email,
    );
  }
}

final signinProvider = Provider<FirebaseLoginRep>((ref) => FirebaseLoginRep());