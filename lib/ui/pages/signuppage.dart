import 'package:flutter/material.dart';
import 'package:new_hotel_app/ui/constants/colors.dart';
import 'package:new_hotel_app/ui/constants/styles.dart';
import 'dart:math';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:new_hotel_app/ui/widgets/textformfield.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  State<SignUpPage> createState() => _SignUpPage();
}

class _SignUpPage extends State<SignUpPage> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _password2Controller = TextEditingController();
  var _stateEye = true;
  var stateSignUp = true;
  var error = " ";

  Future<void> signUp() async {
    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: _emailController.text, password: _passwordController.text);
      stateSignUp = true;
      error = " ";
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        print('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        print('The account already exists for that email.');
      }
      stateSignUp = false;
    }
    if (_password2Controller != _passwordController) {
      error = 'Password and confirm password must same';
    }
    if (stateSignUp) Navigator.pop(context);
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final sizeInset = MediaQuery.of(context).viewInsets;

    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        height: size.height,
        width: size.width,
        color: ColorApp.backgroundApp,
        alignment: Alignment.center,
        child: Column(
          children: [
            SizedBox(
              height: max(size.height * 0.1 - sizeInset.bottom, 0),
            ),
            Stack(
              alignment: Alignment.bottomCenter,
              children: [
                Image.asset(
                  'assets/images/1x/logo.png',
                  height: 127,
                ),
                Image.asset(
                  'assets/images/1x/buildings.png',
                  height: 100,
                ),
              ],
            ),
            SizedBox(
              height: size.height * 0.1,
            ),
            const Text(
              'Welcome to Condotel!',
              style: StyleApp.welcome,
            ),
            const Text(
              'Alive with your style of living!',
              style: StyleApp.alive,
            ),
            SizedBox(
              height: size.height * 0.05,
            ),
            Container(
              padding: EdgeInsets.only(
                  left: size.width * 0.08, right: size.width * 0.08),
              child: TextFormField(
                autovalidateMode: AutovalidateMode.onUserInteraction,
                validator: (input) =>
                    RegExp(r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$')
                            .hasMatch(input!)
                        ? null
                        : 'Check Your Email',
                keyboardType: TextInputType.multiline,
                maxLines: null,
                controller: _emailController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  label: Text('Email'),
                  labelStyle: StyleApp.alive,
                ),
              ),
            ),
            SizedBox(
              height: size.height * 0.015,
            ),
            Container(
              padding: EdgeInsets.only(
                  left: size.width * 0.08, right: size.width * 0.08),
              child: TextFormField(
                autovalidateMode: AutovalidateMode.onUserInteraction,
                validator: (input) =>
                    RegExp(r'^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]{8,}$')
                            .hasMatch(input!)
                        ? null
                        : 'Check Your Password',
                obscureText: _stateEye,
                controller: _passwordController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8)),
                  labelText: 'Password',
                  labelStyle: StyleApp.alive,
                  suffixIcon: IconButton(
                    icon: Image.asset(!_stateEye
                        ? 'assets/images/1x/eye.png'
                        : 'assets/images/1x/eye-slash.png'),
                    onPressed: () {
                      setState(() {
                        _stateEye = !_stateEye;
                      });
                    },
                  ),
                ),
              ),
            ),
            SizedBox(
              height: size.height * 0.015,
            ),
            Container(
              padding: EdgeInsets.only(
                  left: size.width * 0.08, right: size.width * 0.08),
              child: TextFormField(
                autovalidateMode: AutovalidateMode.onUserInteraction,
                validator: (input) =>
                    RegExp(r'^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]{8,}$')
                                .hasMatch(input!) &&
                            input == _passwordController.text
                        ? null
                        : 'Check Your Confirm Password',
                obscureText: _stateEye,
                controller: _password2Controller,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8)),
                  labelText: 'Confirm Password',
                  labelStyle: StyleApp.alive,
                  suffixIcon: IconButton(
                    icon: Image.asset(!_stateEye
                        ? 'assets/images/1x/eye.png'
                        : 'assets/images/1x/eye-slash.png'),
                    onPressed: () {
                      setState(() {
                        _stateEye = !_stateEye;
                      });
                    },
                  ),
                ),
              ),
            ),
            SizedBox(
              height: size.height * 0.03,
            ),
            Container(
              child: Row(
                children: [
                  Flexible(
                    child: ElevatedButton(
                      child: const Text(
                        'Sign up',
                        style: StyleApp.buttonSignIn,
                      ),
                      style: ElevatedButton.styleFrom(
                          minimumSize: const Size(0, 53),
                          primary: ColorApp.blue,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8.0))),
                      onPressed: signUp,
                    ),
                    flex: 1,
                    fit: FlexFit.tight,
                  )
                ],
              ),
              padding: EdgeInsets.only(
                  left: size.width * 0.08, right: size.width * 0.08),
            ),
            SizedBox(
              height: size.height * 0.015,
            ),
            Center(
              child: Text(
                error,
                style: StyleApp.error,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
