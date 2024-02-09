import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:menetrend_app/features/core/fields/email_field.dart';
import 'package:menetrend_app/features/newpassword/app/newpass_controller.dart';

class NewPasswordScreen extends ConsumerWidget {
  const NewPasswordScreen({super.key});

    Future<void> _reqNewPass(WidgetRef ref) async {
    final router = GoRouter.of(ref.context);
    final newPassCtrl = ref.read(newPassCtrlProvider.notifier);
    try {
      await newPassCtrl.reqNewPass();
      showDialog(
        context: ref.context,
        builder: (context) {
          return AlertDialog(
            content: const Text("Password recovery email sent! Check your inbox!"),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: const Text("OK"))
            ],
            icon: const Icon(Icons.check)
          );
        }
        );
      router.go('/login');
    } catch (error) {
      showDialog(
        context: ref.context,
        builder: (context) {
          return AlertDialog(
            content: const Text("Failed to send email! Try again!"),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: const Text("Retry"))
            ],
            icon: const Icon(Icons.warning)
          );
        }
        );
    }
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final newPassForm = ref.watch(newPassCtrlProvider);
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
                          const Text('New Password',
                              style: TextStyle(
                                  fontSize: 48,
                                  fontWeight: FontWeight.w700,
                                  color: Colors.white)),
                          const SizedBox(height: 100),
                          EmailTextField(
                            errorText: newPassForm.emailErrorText,
                            valueChanged: ref.read(newPassCtrlProvider.notifier).updateEmail,
                          ),
                          const SizedBox(height: 50),
                          ElevatedButton(
                            onPressed: () => _reqNewPass(ref),
                            style: ElevatedButton.styleFrom(
                              fixedSize: const Size(double.maxFinite, 40),
                              backgroundColor:
                                  const Color.fromRGBO(128, 0, 32, 100),
                              foregroundColor:
                                  const Color.fromRGBO(255, 255, 255, 1),
                              elevation: 12,
                            ),
                            child: Text('Request'.toUpperCase()),
                          ),
                          TextButton(
                              onPressed: () => context.go('/login'),
                              style: const ButtonStyle(
                                  foregroundColor: MaterialStatePropertyAll(
                                      Color.fromRGBO(255, 255, 255, 1))),
                              child: const Text("Back")),
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
