import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      decoration: const BoxDecoration(
          gradient: LinearGradient(
        begin: Alignment.bottomLeft,
        end: Alignment.topRight,
        colors: [Colors.lightBlue, Colors.orange],
      )),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Expanded(flex: 2, child: Container(color: Colors.transparent)),
          Expanded(
            flex: 6,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  children: [
                    const Image(
                        image: AssetImage(
                      'images/app_icon.png',
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
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    FilledButton(
                        style: FilledButton.styleFrom(
                            backgroundColor:
                                const Color.fromRGBO(128, 0, 32, 100)),
                        onPressed: () => context.go('/login'),
                        child: Text('Login'.toUpperCase())),
                    FilledButton(
                        style: FilledButton.styleFrom(
                            backgroundColor:
                                const Color.fromRGBO(128, 0, 32, 100)),
                        onPressed: () => context.go('/signup'),
                        child: Text('sign up'.toUpperCase())),
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
