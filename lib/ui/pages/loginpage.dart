import 'package:flutter/material.dart';
import 'package:new_hotel_app/services/flutter_services.dart';
import 'package:new_hotel_app/ui/constants/colors.dart';
import 'package:new_hotel_app/ui/constants/styles.dart';
import 'dart:math';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:new_hotel_app/ui/pages/homepage.dart';
import 'package:new_hotel_app/ui/widgets/textformfield.dart';
import 'package:google_sign_in/google_sign_in.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPage();
}

class _LoginPage extends State<LoginPage> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  var _stateEye = true;
  Future<void> SignInEmailPass() async {
    await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: _emailController.text.trim(),
        password: _passwordController.text.trim());
    await FirebaseAuth.instance.authStateChanges().listen((User? user) {
      if (user == null) {
        Navigator.pop(this.context);
      } else {
        Navigator.pushNamed(this.context, 'HomePage');
      }
    });
  }
  Future<void> SignInGmail() async {
  }
  Future<void> SignInFacebook() async {
  }
  void getCurrentUser()
  {
    final user = FirebaseAuth.instance.currentUser;
    if (user !=null)
      {
        final name=user.displayName;
        final email=user.email;
        final photoUrl=user.photoURL;
        final emailVerified=user.emailVerified;
        final uid=user.uid;
        print('name: $name\nemail: $email\nphotoUrl: $photoUrl\nemail: $emailVerified\nuid: $uid');
      }
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
    final size = MediaQuery.of(context).size;
    final size_inset = MediaQuery.of(context).viewInsets;

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
                      onPressed: SignInEmailPass,
                    ),
                    flex: 1,
                    fit: FlexFit.tight,
                  )
                ],
              ),
              padding: EdgeInsets.only(
                  left: size.width * 0.08, right: size.width * 0.08),
            ),
            SizedBox(height: size.height*0.05,),
            Center(
              child: Text("Or sign in with",style: StyleApp.alive,
              ),
            ),
            SizedBox(height: size.height*0.02,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(width: size.width*0.08),
                Flexible(
                  fit: FlexFit.tight,
                  child: ElevatedButton(
                    child: Image.asset('assets/images/1x/google.jpg',height: 18,),
                    onPressed: SignInGmail,
                    style: ElevatedButton.styleFrom(
                        minimumSize: const Size(0, 53),
                        primary: ColorApp.white,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8.0))),
                  ),
                ),
                SizedBox(width: size.width*0.08),
                Flexible(
                  fit:FlexFit.tight,
                  child: ElevatedButton(
                    child: Image.asset('assets/images/1x/Facebook.png'),
                    onPressed: getCurrentUser,
                    style: ElevatedButton.styleFrom(
                        minimumSize: const Size(0, 53),
                        primary: ColorApp.white,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8.0))),
                  ),
                ),
                SizedBox(width: size.width*0.08),
              ],
            ),
            SizedBox(height: size.height*0.05,),
            Center(
              child: GestureDetector(
                child: RichText(
                  text: TextSpan(text: 'Don\'t have an account? ',style: StyleApp.alive,
                    children: [
                      TextSpan(text: 'Sign up here',style: StyleApp.signup)]
                  ),
                ),
                onTap:(){
                  Navigator.pushNamed(context, "SignUpPage");
                },
              )
            ),
          ],
        ),
      ),
    );
  }
}
