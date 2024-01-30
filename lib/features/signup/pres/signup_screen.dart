import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:menetrend_app/features/core/fields/email_field.dart';
import 'package:menetrend_app/features/core/fields/username_field.dart';
import 'package:menetrend_app/features/core/fields/password_field.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({super.key});

  @override
  Widget build(BuildContext context) {
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
                          const EmailTextField(),
                          const SizedBox(height: 10),
                          const UsernameTextField(),
                          const SizedBox(height: 10),
                          const PasswordTextField(),
                          const SizedBox(height: 10),
                          const PasswordTextField(label: 'Re-Password'),
                          const SizedBox(height: 150),
                          ElevatedButton(
                            onPressed: () => context.go('/querymenu'),
                            style: ElevatedButton.styleFrom(
                              fixedSize: const Size(double.maxFinite, 40),
                              backgroundColor:
                                  const Color.fromRGBO(128, 0, 32, 100),
                              foregroundColor:
                                  const Color.fromRGBO(255, 255, 255, 1),
                              elevation: 12,
                            ),
                            child: Text('Register'.toUpperCase()),
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
