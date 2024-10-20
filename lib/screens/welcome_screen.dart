import 'dart:developer' show log;

import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';

import '../components/rounded_button.dart';
import '../constants.dart';
import 'login_screen.dart';
import 'registration_screen.dart';

class WelcomeScreen extends StatefulWidget {
  static const String id = 'welcome_screen';
  const WelcomeScreen({super.key});

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late Animation animation;

  @override
  void initState() {
    super.initState();
    controller =
        AnimationController(duration: const Duration(seconds: 1), vsync: this);

    // animation = CurvedAnimation(parent: controller, curve: Curves.decelerate);
    animation = ColorTween(begin: Colors.blueGrey, end: Colors.white)
        .animate(controller);

    controller.forward();

    // animation.addStatusListener(
    //   (status) {
    //     log(status.toString());
    //     if (status == AnimationStatus.completed) {
    //       controller.reverse(from: 1);
    //     } else if (status == AnimationStatus.dismissed) {
    //       controller.forward();
    //     }
    //   },
    // );

    controller.addListener(
      () {
        setState(() {
          // log(controller.value.toString());
        });
      },
    );

    log('initState() of WelcomeScreen called');
  }

  @override
  void deactivate() {
    super.deactivate();
    log('deactivate of WelcomeScreen() called');
  }

  // @override
  // void dispose() {
  //   controller.dispose();
  //   super.dispose();
  // }

  @override
  Widget build(BuildContext context) {
    log('build() of WelcomeScreen() called');
    return Scaffold(
      // backgroundColor: Colors.white,
      // backgroundColor: Colors.red.withOpacity(controller?.value ?? 1),
      backgroundColor: animation.value,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Row(
              children: <Widget>[
                Hero(
                  tag: 'logo',
                  child: Container(
                    height: 60.0,
                    child: Image.asset('images/logo.png'),
                  ),
                ),
                AnimatedTextKit(
                  animatedTexts: [
                    TypewriterAnimatedText('Flash Chat',
                        textStyle: kLogoTextStyle),
                  ],
                )
              ],
            ),
            const SizedBox(
              height: 48.0,
            ),
            RoundedButton(
              color: Colors.lightBlueAccent,
              title: 'Log In',
              onPressed: () => Navigator.pushNamed(context, LoginScreen.id),
            ),
            RoundedButton(
              color: Colors.blueAccent,
              title: 'Register',
              onPressed: () =>
                  Navigator.pushNamed(context, RegistrationScreen.id),
            ),
          ],
        ),
      ),
    );
  }
}
