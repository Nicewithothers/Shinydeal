import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:menetrend_app/features/newpassword/dom/newpass_form.dart';

class FirebaseNewPassRepository extends NewPassRepo {
  @override
  Future<void> reqNewPass({required NewPassForm newPassForm}) async => await FirebaseAuth.instance.sendPasswordResetEmail(email: newPassForm.email);
}

final newPassProvider = Provider<NewPassRepo>((ref) => FirebaseNewPassRepository());