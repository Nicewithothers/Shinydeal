import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:menetrend_app/features/core/fields/email_field.dart';
import 'package:menetrend_app/features/core/fields/username_field.dart';
import 'package:menetrend_app/features/core/fields/password_field.dart';
import 'package:menetrend_app/features/signup/app/signup_controller.dart';

class SignupScreen extends ConsumerWidget {
  const SignupScreen({super.key});

  Future<void> _signUp(WidgetRef ref) async {
    final router = GoRouter.of(ref.context);
    final scaffoldMessenger = ScaffoldMessenger.of(ref.context);
    final signupCtrl = ref.read(signupCtrlProvider.notifier);
    try {
      final user = await signupCtrl.signUp();
      scaffoldMessenger.showMaterialBanner(
        MaterialBanner(
          actions: [
             TextButton(
              onPressed: () => scaffoldMessenger.removeCurrentMaterialBanner(),
              child: const Text('Dismiss')
            )
          ],
          content: Text('Signed in as ${user.email}!')
          )
      );
      router.go('/jewelleryorder');
    } catch (error) {
      scaffoldMessenger.showMaterialBanner(
        MaterialBanner(
          actions: [
             TextButton(
              onPressed: () => scaffoldMessenger.removeCurrentMaterialBanner(),
              child: const Text('Retry')
            )
          ],
          content: const Text('Failed to sign up! Try again!')
          )
      );
    }
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final signupForm = ref.watch(signupCtrlProvider);
    return Scaffold(
        resizeToAvoidBottomInset: false,
        body: Container(
          decoration: const BoxDecoration(
              gradient: LinearGradient(
            begin: Alignment.bottomCenter,
            end: Alignment.topCenter,
            colors: [
              Color.fromRGBO(70, 70, 70, 1),
              Color.fromRGBO(110, 110, 110, 1),
              Color.fromRGBO(70, 70, 70, 1),
            ],
            tileMode: TileMode.decal,
          )),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(flex: 2, child: Container(color: Colors.transparent)),
              Expanded(
                  flex: 6,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        children: [
                          const SizedBox(height: 50),
                          const Text('Register',
                              style: TextStyle(
                                  fontSize: 48,
                                  fontWeight: FontWeight.w700,
                                  color: Colors.white)),
                          const SizedBox(height: 100),
                          EmailTextField(
                            valueChanged: ref.read(signupCtrlProvider.notifier).updateEmail,
                            errorText: signupForm.emailErrorText,
                          ),
                          const SizedBox(height: 10),
                          UsernameTextField(
                            valueChanged: ref.read(signupCtrlProvider.notifier).updateUsername,
                            errorText: signupForm.usernameErrorText,
                          ),
                          const SizedBox(height: 10),
                          PasswordTextField(
                            valueChanged: ref.read(signupCtrlProvider.notifier).updatePassword,
                            errorText: signupForm.passwordErrorText,
                          ),
                          const SizedBox(height: 10),
                          PasswordTextField(
                            valueChanged: ref.read(signupCtrlProvider.notifier).updateRePassword,
                            errorText: signupForm.rePasswordErrorText,
                            label: 'Re-Password'),
                          const SizedBox(height: 150),
                          ElevatedButton(
                            onPressed: !signupForm.isFormValid ? null : () => _signUp(ref),
                            style: ElevatedButton.styleFrom(
                              fixedSize: const Size(double.maxFinite, 40),
                              backgroundColor:
                                  const Color.fromRGBO(128, 0, 32, 100),
                              foregroundColor:
                                  const Color.fromRGBO(255, 255, 255, 1),
                              elevation: 12,
                            ),
                            child: const Text('Register'),
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          const Divider(
                            color: Colors.black,
                            thickness: 0.5,
                          ),
                          TextButton(
                              onPressed: () => context.go('/login'),
                              style: const ButtonStyle(
                                  foregroundColor: MaterialStatePropertyAll(
                                      Color.fromRGBO(255, 255, 255, 1))),
                              child: const Text(
                                  "Already have an account? Log in!")),
                        ],
                      ),
                    ],
                  )),
              Expanded(flex: 2, child: Container(color: Colors.transparent)),
            ],
          ),
        ));
  }
}