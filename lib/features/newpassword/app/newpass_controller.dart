import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:menetrend_app/features/newpassword/dom/newpass_form.dart';
import 'package:menetrend_app/features/newpassword/infrastructure/fb_newpass_rep.dart';

class NewPassController extends Notifier<NewPassForm> {
  @override
  NewPassForm build() {
    return NewPassForm(email: '');
  }

  void updateEmail(String email) => state = state.copyWith(email: email);

  Future<void> reqNewPass() async => state.isFormValid ? await ref.read(newPassProvider).reqNewPass(newPassForm: state) : throw Exception('Form invalid. Try again!');
}

final newPassCtrlProvider = NotifierProvider<NewPassController, NewPassForm>(() => NewPassController());