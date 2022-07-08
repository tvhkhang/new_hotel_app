import 'package:flutter/material.dart';
import 'package:new_hotel_app/ui/constants/colors.dart';
import 'package:new_hotel_app/ui/constants/styles.dart';
import 'dart:math';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:new_hotel_app/ui/widgets/buttons.dart';
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

  Future<void> SignUp() async {
    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: _emailController.text, password: _passwordController.text);
      stateSignUp = true;
      error=" ";
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
    final size_inset = MediaQuery.of(context).viewInsets;

    return GestureDetector(
      onTap: () {
        FocusScopeNode currentFocus = FocusScope.of(context);
        if (!currentFocus.hasPrimaryFocus) {
          currentFocus.unfocus();
        }
      },
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Container(
          height: size.height,
          width: size.width,
          color: ColorApp.backgroundApp,
          alignment: Alignment.center,
          child: Column(
            children: [
              Container(
                child: SizedBox(
                  height: max(size.height * 0.1 - size_inset.bottom, 0),
                ),
              ),
              Container(
                child: Stack(
                  alignment: Alignment.bottomCenter,
                  children: [
                    Image.asset(
                      'assets/images/1x/logo.png',
                      height: 127,
                    ),
                    Container(
                      child: Image.asset(
                        'assets/images/1x/buildings.png',
                        height: 100,
                      ),
                    )
                  ],
                ),
              ),
              Container(
                child: SizedBox(
                  height: size.height * 0.1,
                ),
              ),
              Container(
                child: Text(
                  'Welcome to Condotel!',
                  style: StyleApp.welcome,
                ),
              ),
              Container(
                child: Text(
                  'Alive with your style of living!',
                  style: StyleApp.alive,
                ),
              ),
              Container(
                child: SizedBox(
                  height: size.height * 0.05,
                ),
              ),
              Container(
                padding: EdgeInsets.only(
                    left: size.width * 0.08, right: size.width * 0.08),
                child: TextForm(
                  controller: _emailController,
                  text: 'Email',
                ),
              ),
              Container(
                child: SizedBox(
                  height: size.height * 0.015,
                ),
              ),
              Container(
                padding: EdgeInsets.only(
                    left: size.width * 0.08, right: size.width * 0.08),
                child: TextFormField(
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
              Container(
                child: SizedBox(
                  height: size.height * 0.015,
                ),
              ),
              Container(
                padding: EdgeInsets.only(
                    left: size.width * 0.08, right: size.width * 0.08),
                child: TextFormField(
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
              Container(
                child: SizedBox(
                  height: size.height * 0.03,
                ),
              ),
              Container(
                child: Row(
                  children: [
                    ButtonFlexible(onPressed: SignUp, text: 'Sign up', color: ColorApp.blue, flex: 1, style: StyleApp.buttonSignIn),
                  ],
                ),
                padding: EdgeInsets.only(
                    left: size.width * 0.08, right: size.width * 0.08),
              ),
              Container(
                child: SizedBox(
                  height: size.height * 0.015,
                ),
              ),
              Container(
                child: Center(
                    child: Text(
                  error,
                  style: StyleApp.error,
                )),
              )
            ],
          ),
        ),
      ),
    );
  }
}
