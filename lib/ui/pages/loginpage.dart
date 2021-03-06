import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:new_hotel_app/services/flutter_services.dart';
import 'package:new_hotel_app/ui/constants/colors.dart';
import 'package:new_hotel_app/ui/constants/styles.dart';
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
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

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
              const Spacer(flex: 6,),//0.015
              Flexible(
                child: Stack(
                  alignment: Alignment.bottomCenter,
                  children: [
                    Image.asset(
                      'assets/images/1x/logo.png',
                      height: size.height*0.15,
                    ),
                    Image.asset(
                      'assets/images/1x/buildings.png',
                      height: size.height*0.12,
                    )
                  ],
                ),
                flex: 10,
              ),
              const Spacer(flex: 6,),
              Flexible(
                child: Text(
                  'Welcome to Condotel!',
                  style: StyleApp.welcome,
                ),
                flex: 2,
              ),
              Flexible(
                child: Text(
                  'Alive with your style of living!',
                  style: StyleApp.alive,
                ),
                flex: 2,
              ),
              const Spacer(flex: 3,),
              Flexible(
                child: Container(
                  padding: EdgeInsets.only(
                      left: size.width * 0.08, right: size.width * 0.08),
                  child: TextForm(
                    controller: _emailController,
                    text: 'Email',
                  ),
                ),
                flex: 6,
              ),
              const Spacer(flex: 1,),
              Flexible(
                child: Container(
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
                flex: 6,
              ),
              const Spacer(flex: 2,),
              Flexible(
                child: Container(
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
                          onPressed: signInEmailPass,
                        ),
                        flex: 1,
                        fit: FlexFit.tight,
                      )
                    ],
                  ),
                  padding: EdgeInsets.only(
                      left: size.width * 0.08, right: size.width * 0.08),
                ),
                flex: 6,
              ),
              const Spacer(flex: 1,),
              Flexible(
                child: Center(
                  child: Text("Or sign in with",style: StyleApp.alive,
                  ),
                ),
                flex: 2,
              ),
              const Spacer(flex: 1,),
              Flexible(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(width: size.width*0.08),
                    Flexible(
                      flex: 5,
                      fit: FlexFit.tight,
                      child: ElevatedButton(
                        child: Image.asset('assets/images/1x/google.jpg',height: 18,),
                        onPressed: signInGmail,
                        style: ElevatedButton.styleFrom(
                            minimumSize: const Size(0, 53),
                            primary: ColorApp.white,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8.0))),
                      ),
                    ),
                    const Spacer(flex: 1,),
                    Flexible(
                      flex: 5,
                      fit:FlexFit.tight,
                      child: ElevatedButton(
                        child: Image.asset('assets/images/1x/Facebook.png'),
                        onPressed: FacebookSignInProvider().signInWithFacebook,
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
                flex: 6,
              ),
              const Spacer(flex: 1,),
              Flexible(
                child: Center(
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
                flex: 2,
              ),
              const Spacer(flex: 2,)
            ],
          ),
        ),
      ),
    );
  }
  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
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
  Future<void> signInEmailPass() async {
    await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: _emailController.text.trim(),
        password: _passwordController.text.trim());
  }

  Future<void> signInFacebook() async {
    // FacebookSignInProvider().facebookLogin();
  }

  Future<void> signInGmail() async {
    GoogleSignInProvider().signInWithGoogle();
  }
}
