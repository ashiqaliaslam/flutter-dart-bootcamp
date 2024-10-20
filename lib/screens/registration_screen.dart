import 'dart:developer' show log;

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../components/rounded_button.dart';
import '../constants.dart';
import 'chat_screen.dart';

class RegistrationScreen extends StatefulWidget {
  static const String id = 'registration_screen';

  const RegistrationScreen({super.key});

  @override
  State<RegistrationScreen> createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  final _auth = FirebaseAuth.instance;

  // String email;
  // String password;
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  static Future<User?> registerUsingEmailAndPassword(
      {required String email, required String password}) async {
    FirebaseAuth auth = FirebaseAuth.instance;
    // User? user;

    try {
      UserCredential newUser = await auth.createUserWithEmailAndPassword(
          email: email, password: password);
      // user = newUser.user;
      return newUser.user;
    } catch (e) {
      log(e.toString());
    }
    return null;
  }

  @override
  void initState() {
    super.initState();
    log('initState of RegistrationScreen() called');
  }

  @override
  void deactivate() {
    super.deactivate();
    log('deactivate of RegistrationScreen()');
  }

  @override
  void dispose() {
    super.dispose();
    _emailController.dispose();
    _passwordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    log('build() of RegistrationScreen() called');
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Hero(
              tag: 'logo',
              child: Container(
                height: 200.0,
                child: Image.asset('images/logo.png'),
              ),
            ),
            const SizedBox(
              height: 48.0,
            ),
            TextField(
              textAlign: TextAlign.center,
              keyboardType: TextInputType.emailAddress,
              onChanged: (value) {
                _emailController.text = value;
              },
              decoration:
                  kTextFieldDecoration.copyWith(hintText: 'Enter your email'),
            ),
            const SizedBox(
              height: 8.0,
            ),
            TextField(
              textAlign: TextAlign.center,
              obscureText: true,
              onChanged: (value) {
                _passwordController.text = value;
              },
              decoration: kTextFieldDecoration.copyWith(
                  hintText: 'Enter your password'),
            ),
            const SizedBox(
              height: 24.0,
            ),
            RoundedButton(
              color: Colors.blueAccent,
              title: 'Register',
              onPressed: () async {
                log(_emailController.toString());
                log(_passwordController.toString());
                try {
                  final newUser = await _auth.createUserWithEmailAndPassword(
                      email: _emailController.text,
                      password: _passwordController.text);
                  if (newUser != null) {
                    Navigator.pushNamed(context, ChatScreen.id);
                  }
                } catch (e) {
                  log(e.toString());
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
