import 'package:freezed_annotation/freezed_annotation.dart';

part 'newpass_form.freezed.dart';

@freezed
class NewPassForm with _$NewPassForm {
  const NewPassForm._();
  factory NewPassForm({required String email}) = _NewPassForm;

  String? get emailErrorText => email.isEmpty ? "Email is missing!" : null;

  bool get isFormValid => email.isNotEmpty;
}

abstract class NewPassRepo {
  Future<void> reqNewPass({required NewPassForm newPassForm});
}