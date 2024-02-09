import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key});

  @override
  State<StatefulWidget> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Color?> _colorAnimation;
  late Animatable<Color?> _background;

  @override
  void initState() {
    super.initState();
    _background = TweenSequence<Color?>([
      TweenSequenceItem(
        weight: 1.0,
        tween: ColorTween(begin: Colors.red, end: Colors.blue),
      ),
      TweenSequenceItem(
        weight: 1.0,
        tween: ColorTween(begin: Colors.blue, end: Colors.green),
      ),
      TweenSequenceItem(
        weight: 1.0,
        tween: ColorTween(begin: Colors.green, end: Colors.yellow),
      ),
      TweenSequenceItem(
        weight: 1.0,
        tween: ColorTween(begin: Colors.yellow, end: Colors.red),
      ),
    ]);

    _controller = AnimationController(duration: const Duration(seconds: 15), vsync: this)
          ..forward()
          ..repeat();
    _colorAnimation = _background.animate(_controller);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final ButtonStyle _buttonSkin = ElevatedButton.styleFrom(
      fixedSize: const Size(double.maxFinite, 40),
      backgroundColor: const Color.fromRGBO(128, 0, 32, 100),
      foregroundColor: const Color.fromRGBO(255, 255, 255, 1),
      elevation: 12,
    );
    return Scaffold(
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
                      AnimatedBuilder(
                        animation: _controller,
                        builder: (context, child) {
                          return Image(
                            image: const AssetImage('./assets/images/app_icon.png'),
                            color: _colorAnimation.value,
                          );
                        },
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
                      const SizedBox(height: 50),
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
      ),
    );
  }
}
