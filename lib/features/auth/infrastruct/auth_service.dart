import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:menetrend_app/features/auth/dom/auth_repository.dart';
import 'package:menetrend_app/features/core/model/user.dart' as data;

class FirebaseAuthRepository extends AuthRepository {
  @override
  Future<void> createUser({required String email, required String password}) async {
    await FirebaseAuth.instance.createUserWithEmailAndPassword(email: email, password: password);
  }

  @override
  Future<void> signInUser({required String email, required String password}) async => await FirebaseAuth.instance.signInWithEmailAndPassword(email: email, password: password);

  @override
  Stream<AuthState> stateWatch() => FirebaseAuth.instance.userChanges().map((user) => (user == null) ? const Unverified() : Verified(user: data.User(uid: user.uid, name: user.displayName ?? 'Unknown', email: user.email ?? 'Unkwown')));

  @override
  Future<void> signOutUser() => FirebaseAuth.instance.signOut();
}

final authProvider = Provider<AuthRepository>((ref) => FirebaseAuthRepository());