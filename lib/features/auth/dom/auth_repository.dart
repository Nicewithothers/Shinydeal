import 'package:menetrend_app/features/core/model/user.dart';

abstract class AuthRepository {
  Stream<AuthState> stateWatch();
  Future<void> createUser({
    required String email,
    required String password,
  });
  Future<void> signInUser({
    required String email,
    required String password,
  });
  Future<void> signOutUser();
}

class AuthState {
  const AuthState();
}

class Verified extends AuthState {
  const Verified({required this.user});
  final User user;
}

class Unverified extends AuthState {
  const Unverified();
}

class Unknown extends AuthState {
  const Unknown();
}