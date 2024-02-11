import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:Shinydeal/features/core/fields/email_field.dart';
import 'package:Shinydeal/features/newpassword/app/newpass_controller.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class NewPasswordScreen extends ConsumerWidget {
  const NewPasswordScreen({super.key});

    Future<void> _reqNewPass(WidgetRef ref) async {
    final _locale = AppLocalizations.of(ref.context);
    final router = GoRouter.of(ref.context);
    final newPassCtrl = ref.read(newPassCtrlProvider.notifier);
    try {
      await newPassCtrl.reqNewPass();
      showDialog(
        context: ref.context,
        builder: (context) {
          return AlertDialog(
            content: Text(_locale!.newPasswordSuccess),
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
            content: Text(_locale!.newPasswordError),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: Text(_locale.retryButton))
            ],
            icon: const Icon(Icons.warning)
          );
        }
        );
    }
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final _locale = AppLocalizations.of(ref.context);
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
                          Text(_locale!.newPassword,
                              style: const TextStyle(
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
                              child: Text(_locale.popRedirect)),
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
