import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:Shinydeal/features/auth/dom/auth_repository.dart';
import 'package:Shinydeal/features/auth/infrastruct/auth_service.dart';

class AuthController extends Notifier<AuthState> {
  StreamSubscription<AuthState>? _authSubscription;

  Future<void> signInUser({required String email, required String password,}) async => await ref.watch(authProvider).signInUser(email: email, password: password);
  Future<void> signOutUser() async => await ref.watch(authProvider).signOutUser();
  
  @override
  AuthState build() {
    ref.onDispose(() => _authSubscription?.cancel());
    _authSubscription = ref.watch(authProvider).stateWatch().listen((authState) => state = authState);
    return const Unknown();
  }
}

final authCtrlProvider = NotifierProvider<AuthController,AuthState> (() => AuthController());