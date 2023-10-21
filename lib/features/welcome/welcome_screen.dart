import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class WelcomeScreen extends StatelessWidget {
  static final ButtonStyle _buttonSkin = ElevatedButton.styleFrom(
    fixedSize: const Size(double.maxFinite, 40),
    backgroundColor: const Color.fromRGBO(128, 0, 32, 100),
    foregroundColor: const Color.fromRGBO(255, 255, 255, 1),
    elevation: 12,
  );

  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      decoration: const BoxDecoration(
          gradient: LinearGradient(
        begin: Alignment.bottomCenter,
        end: Alignment.topCenter,
        colors: [
          Color.fromRGBO(222, 11, 43, 1),
          Color.fromRGBO(222, 11, 43, 100),
          Color.fromRGBO(222, 11, 43, 1),
        ],
        tileMode: TileMode.decal,
      )),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Expanded(flex: 2, child: Container(color: Colors.transparent)),
          Expanded(
            flex: 6,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Column(
                  children: [
                    const Image(
                        image: AssetImage(
                      './assets/images/app_icon.png',
                    )),
                    Text(
                      'menetrendapp'.toUpperCase(),
                      style: const TextStyle(
                        fontSize: 32,
                        color: Colors.black,
                        decoration: TextDecoration.none,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ],
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ElevatedButton(
                        style: _buttonSkin,
                        onPressed: () => context.go('/login'),
                        child: const Text('Login',
                            style: TextStyle(fontSize: 18))),
                    ElevatedButton(
                        style: _buttonSkin,
                        onPressed: () => context.go('/signup'),
                        child: const Text(
                          'Sign up',
                          style: TextStyle(fontSize: 18),
                        )),
                  ],
                ),
              ],
            ),
          ),
          Expanded(flex: 2, child: Container(color: Colors.transparent)),
        ],
      ),
    ));
  }
}
