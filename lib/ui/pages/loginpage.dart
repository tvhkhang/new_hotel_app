import 'package:flutter/material.dart';
import 'package:new_hotel_app/ui/constants/colors.dart';
import 'package:new_hotel_app/ui/constants/styles.dart';
import 'dart:math';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:new_hotel_app/ui/widgets/textformfield.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPage();
}

class _LoginPage extends State<LoginPage> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  var _stateEye = true;
  Future SignIn() async {
    await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: _emailController.text.trim(),
        password: _passwordController.text.trim());
  }

  @override
  void initState() {
    // TODO: implement initState
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
    final size = MediaQuery
        .of(context)
        .size;
    final size_inset = MediaQuery
        .of(context)
        .viewInsets;

    return Scaffold(
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
                height: size.height * 0.03,
              ),
            ),
            Container(
              child: Row(
                children: [
                  Flexible(
                    child: ElevatedButton(
                      child: Text(
                        'Sign in',
                        style: StyleApp.buttonSignIn,
                      ),
                      style: ElevatedButton.styleFrom(
                          minimumSize: const Size(0, 53),
                          primary: ColorApp.blue,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8.0))),
                      onPressed:
                        SignIn,
                    ),
                    flex: 1,
                    fit: FlexFit.tight,
                  )
                ],
              ),
              padding: EdgeInsets.only(
                  left: size.width * 0.08, right: size.width * 0.08),
            )
          ],
        ),
      ),
    );
  }
}
