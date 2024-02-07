import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:menetrend_app/features/core/fields/email_field.dart';
import 'package:menetrend_app/features/core/fields/password_field.dart';
import 'package:menetrend_app/features/login/app/login_controller.dart';

class LoginScreen extends ConsumerWidget {
  const LoginScreen({super.key});

    Future<void> _signIn(WidgetRef ref) async {
    final router = GoRouter.of(ref.context);
    final scaffoldMessenger = ScaffoldMessenger.of(ref.context);
    final signupCtrl = ref.read(signinCtrlProvider.notifier);
    try {
      final user = await signupCtrl.signIn();
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
    final loginForm = ref.watch(signinCtrlProvider);
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
                          const Text('Login',
                              style: TextStyle(
                                  fontSize: 48,
                                  fontWeight: FontWeight.w700,
                                  color: Colors.white)),
                          const SizedBox(height: 100),
                          EmailTextField(
                            errorText: loginForm.emailErrorText,
                            valueChanged: ref.read(signinCtrlProvider.notifier).updateEmail,
                          ),
                          const SizedBox(height: 10),
                          PasswordTextField(
                            errorText: loginForm.passwordErrorText,
                            valueChanged: ref.read(signinCtrlProvider.notifier).updatePassword,
                          ),
                          const SizedBox(height: 50),
                          ElevatedButton(
                            onPressed: () => _signIn(ref),
                            style: ElevatedButton.styleFrom(
                              fixedSize: const Size(double.maxFinite, 40),
                              backgroundColor:
                                  const Color.fromRGBO(128, 0, 32, 100),
                              foregroundColor:
                                  const Color.fromRGBO(255, 255, 255, 1),
                              elevation: 12,
                            ),
                            child: Text('Login'.toUpperCase()),
                          ),
                          TextButton(
                              onPressed: () => context.go('/newpassword'),
                              style: const ButtonStyle(
                                  foregroundColor: MaterialStatePropertyAll(
                                      Color.fromRGBO(255, 255, 255, 1))),
                              child: const Text("Forgot your password?")),
                        ],
                      ),
                      Column(
                        children: [
                          const Divider(
                            color: Colors.black,
                            thickness: 0.5,
                          ),
                          TextButton(
                              onPressed: () => context.go('/signup'),
                              style: const ButtonStyle(
                                  foregroundColor: MaterialStatePropertyAll(
                                      Color.fromRGBO(255, 255, 255, 1))),
                              child: const Text(
                                  "Don't have an account? Sign up!")),
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
