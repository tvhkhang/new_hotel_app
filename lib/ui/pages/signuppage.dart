import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:new_hotel_app/ui/constants/assets.dart';
import 'package:new_hotel_app/ui/constants/colors.dart';
import 'package:new_hotel_app/ui/constants/styles.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:new_hotel_app/ui/modules/utils.dart';
import 'package:new_hotel_app/ui/modules/responsive.dart';
import 'package:new_hotel_app/ui/widgets/buttons.dart';
import 'package:new_hotel_app/ui/widgets/textformfield.dart';
import 'package:new_hotel_app/generated/l10n.dart';

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
      error = " ";
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('The password provided is too weak.')));
      } else if (e.code == 'email-already-in-use') {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text('The account already exists for that email.')));
      }
      stateSignUp = false;
    }
    if (_password2Controller != _passwordController) {
      error = 'Password and confirm password must same';
    }
    final res = await Connectivity().checkConnectivity();
    showConnectivitySnackBar(res);
    if (stateSignUp) Navigator.pop(context);
  }

  void showConnectivitySnackBar(ConnectivityResult result) {
    final hasInternet = result != ConnectivityResult.none;
    final message = hasInternet
        ? "You have again ${result.toString()}"
        : "You have no internet";
    final color = hasInternet ? Colors.green : Colors.red;
    Utils.showTopSnackBar(context, message, color);
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
    return Responsive(
      mobile: GestureDetector(
        onTap: () {
          FocusScopeNode currentFocus = FocusScope.of(context);
          if (!currentFocus.hasPrimaryFocus) {
            currentFocus.unfocus();
          }
        },
        child: Scaffold(
          appBar: AppBar(
            elevation: 0,
            leading: IconButton(
              icon: SvgPicture.asset(
                Assets.arrowLeft,
                color: ColorApp.black,
              ),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
            actions: [
              IconButton(
                onPressed: () {
                  Get.changeTheme(
                      Get.isDarkMode ? ThemeData.light() : ThemeData.dark());
                },
                icon: SvgPicture.asset(
                  Assets.darkIcon,
                ),
              ),
              Center(
                child: Text(
                  "${S.of(context).Language}",
                  style: StyleApp.welcome,
                ),
              ),
              IconButton(
                onPressed: () {
                  var currentLang = Localizations.localeOf(context);
                  var locale =
                      Locale((currentLang == Locale('en')) ? 'vi' : 'en', '');
                  Get.updateLocale(locale);
                },
                icon: SvgPicture.asset(Assets.language),
              ),
            ],
          ),
          resizeToAvoidBottomInset: false,
          body: Container(
            height: size.height,
            width: size.width,
            alignment: Alignment.center,
            child: Column(
              children: [
                Spacer(
                  flex: 5,
                ),
                Flexible(
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
                  flex: 8,
                ),
                Spacer(
                  flex: 2,
                ),
                Flexible(
                  child: Text(
                    S.of(context).Welcome,
                    style: StyleApp.welcome,
                  ),
                  flex: 2,
                ),
                Flexible(
                  child: Text(
                    S.of(context).Alive,
                    style: StyleApp.alive,
                  ),
                  flex: 2,
                ),
                const Spacer(
                  flex: 2,
                ),
                Flexible(
                  child: Container(
                    padding: EdgeInsets.only(
                        left: size.width * 0.08, right: size.width * 0.08),
                    child: TextForm(
                      controller: _emailController,
                      text: S.of(context).Email,
                    ),
                  ),
                  flex: 4,
                ),
                Spacer(
                  flex: 1,
                ),
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
                        labelText: S.of(context).Password,
                        labelStyle: StyleApp.alive,
                        suffixIcon: IconButton(
                          icon: SvgPicture.asset(
                              !_stateEye ? Assets.eyeOpen : Assets.eyeClose),
                          onPressed: () {
                            setState(() {
                              _stateEye = !_stateEye;
                            });
                          },
                        ),
                      ),
                    ),
                  ),
                  flex: 4,
                ),
                Spacer(
                  flex: 1,
                ),
                Flexible(
                  child: Container(
                    padding: EdgeInsets.only(
                        left: size.width * 0.08, right: size.width * 0.08),
                    child: TextFormField(
                      obscureText: _stateEye,
                      controller: _password2Controller,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8)),
                        labelText: S.of(context).Repassword,
                        labelStyle: StyleApp.alive,
                        suffixIcon: IconButton(
                          icon: SvgPicture.asset(
                              !_stateEye ? Assets.eyeOpen : Assets.eyeClose),
                          onPressed: () {
                            setState(() {
                              _stateEye = !_stateEye;
                            });
                          },
                        ),
                      ),
                    ),
                  ),
                  flex: 4,
                ),
                Spacer(
                  flex: 1,
                ),
                Flexible(
                  child: Container(
                    child: Row(
                      children: [
                        ButtonFlexible(
                            onPressed: SignUp,
                            text: S.of(context).Signup,
                            color: ColorApp.blue,
                            flex: 1,
                            style: StyleApp.buttonSignIn),
                      ],
                    ),
                    padding: EdgeInsets.only(
                        left: size.width * 0.08, right: size.width * 0.08),
                  ),
                  flex: 4,
                ),
                Spacer(
                  flex: 1,
                ),
                Flexible(
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
      ),
      tablet: GestureDetector(
        onTap: () {
          FocusScopeNode currentFocus = FocusScope.of(context);
          if (!currentFocus.hasPrimaryFocus) {
            currentFocus.unfocus();
          }
        },
        child: Scaffold(
          appBar: AppBar(
            elevation: 0,
            actions: [
              IconButton(
                onPressed: () {
                  Get.changeTheme(
                      Get.isDarkMode ? ThemeData.light() : ThemeData.dark());
                },
                icon: SvgPicture.asset(
                  Assets.darkIcon,
                ),
              ),
              Center(
                child: Text(
                  "${S.of(context).Language}",
                  style: StyleApp.welcome,
                ),
              ),
              IconButton(
                onPressed: () {
                  var currentLang = Localizations.localeOf(context);
                  var locale =
                      Locale((currentLang == Locale('en')) ? 'vi' : 'en', '');
                  Get.updateLocale(locale);
                },
                icon: SvgPicture.asset(Assets.language),
              ),
            ],
          ),
          resizeToAvoidBottomInset: false,
          body: Container(
            height: size.height,
            width: size.width,
            alignment: Alignment.center,
            child: Row(
              children: [
                Flexible(
                    child: Container(
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
                    flex: 1,
                    fit: FlexFit.tight),
                Flexible(
                  child: Column(
                    children: [
                      Spacer(
                        flex: 6,
                      ),
                      Flexible(
                        child: Text(
                          S.of(context).Welcome,
                          style: StyleApp.welcome,
                        ),
                        flex: 6,
                      ),
                      Flexible(
                        child: Text(
                          S.of(context).Alive,
                          style: StyleApp.alive,
                        ),
                        flex: 6,
                      ),
                      Spacer(
                        flex: 3,
                      ),
                      Flexible(
                        child: Padding(
                          padding: EdgeInsets.only(
                              left: size.width * 0.08,
                              right: size.width * 0.08),
                          child: TextForm(
                            controller: _emailController,
                            text: S.of(context).Email,
                          ),
                        ),
                        flex: 6,
                      ),
                      Spacer(
                        flex: 1,
                      ),
                      Flexible(
                        child: Padding(
                          padding: EdgeInsets.only(
                              left: size.width * 0.08,
                              right: size.width * 0.08),
                          child: TextFormField(
                            obscureText: _stateEye,
                            controller: _passwordController,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(8)),
                              labelText: S.of(context).Password,
                              labelStyle: StyleApp.alive,
                              suffixIcon: IconButton(
                                icon: SvgPicture.asset(!_stateEye
                                    ? Assets.eyeOpen
                                    : Assets.eyeClose),
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
                      Spacer(
                        flex: 1,
                      ),
                      Flexible(
                        child: Padding(
                          padding: EdgeInsets.only(
                              left: size.width * 0.08,
                              right: size.width * 0.08),
                          child: TextFormField(
                            obscureText: _stateEye,
                            controller: _password2Controller,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(8)),
                              labelText: S.of(context).Repassword,
                              labelStyle: StyleApp.alive,
                              suffixIcon: IconButton(
                                icon: SvgPicture.asset(!_stateEye
                                    ? Assets.eyeOpen
                                    : Assets.eyeClose),
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
                      Spacer(
                        flex: 2,
                      ),
                      Flexible(
                        child: Padding(
                          child: Row(
                            children: [
                              ButtonFlexible(
                                  onPressed: SignUp,
                                  text: S.of(context).Signup,
                                  color: ColorApp.blue,
                                  flex: 1,
                                  style: StyleApp.buttonSignIn),
                            ],
                          ),
                          padding: EdgeInsets.only(
                              left: size.width * 0.08,
                              right: size.width * 0.08),
                        ),
                        flex: 6,
                      ),
                      Spacer(
                        flex: 1,
                      ),
                      Flexible(
                        child: Center(
                            child: Text(
                          error,
                          style: StyleApp.error,
                        )),
                      )
                    ],
                  ),
                  flex: 1,
                  fit: FlexFit.tight,
                ),
              ],
            ),
          ),
        ),
      ),
      desktop: GestureDetector(
        onTap: () {
          FocusScopeNode currentFocus = FocusScope.of(context);
          if (!currentFocus.hasPrimaryFocus) {
            currentFocus.unfocus();
          }
        },
        child: Scaffold(
          appBar: AppBar(
            elevation: 0,
            actions: [
              IconButton(
                onPressed: () {
                  Get.changeTheme(
                      Get.isDarkMode ? ThemeData.light() : ThemeData.dark());
                },
                icon: SvgPicture.asset(
                  Assets.darkIcon,
                ),
              ),
              Center(
                child: Text(
                  "${S.of(context).Language}",
                  style: StyleApp.welcome,
                ),
              ),
              IconButton(
                onPressed: () {
                  var currentLang = Localizations.localeOf(context);
                  var locale =
                      Locale((currentLang == Locale('en')) ? 'vi' : 'en', '');
                  Get.updateLocale(locale);
                },
                icon: SvgPicture.asset(Assets.language),
              ),
            ],
          ),
          resizeToAvoidBottomInset: false,
          body: Container(
            height: size.height,
            width: size.width,
            alignment: Alignment.center,
            child: Row(
              children: [
                Flexible(
                    child: Container(
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
                    flex: 1,
                    fit: FlexFit.tight),
                Flexible(
                  child: Column(
                    children: [
                      Spacer(
                        flex: 6,
                      ),
                      Flexible(
                        child: Text(
                          S.of(context).Welcome,
                          style: StyleApp.welcome,
                        ),
                        flex: 6,
                      ),
                      Flexible(
                        child: Text(
                          S.of(context).Alive,
                          style: StyleApp.alive,
                        ),
                        flex: 6,
                      ),
                      Spacer(
                        flex: 3,
                      ),
                      Flexible(
                        child: Padding(
                          padding: EdgeInsets.only(
                              left: size.width * 0.08,
                              right: size.width * 0.08),
                          child: TextForm(
                            controller: _emailController,
                            text: S.of(context).Email,
                          ),
                        ),
                        flex: 6,
                      ),
                      Spacer(
                        flex: 1,
                      ),
                      Flexible(
                        child: Padding(
                          padding: EdgeInsets.only(
                              left: size.width * 0.08,
                              right: size.width * 0.08),
                          child: TextFormField(
                            obscureText: _stateEye,
                            controller: _passwordController,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(8)),
                              labelText: S.of(context).Password,
                              labelStyle: StyleApp.alive,
                              suffixIcon: IconButton(
                                icon: SvgPicture.asset(!_stateEye
                                    ? Assets.eyeOpen
                                    : Assets.eyeClose),
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
                      Spacer(
                        flex: 1,
                      ),
                      Flexible(
                        child: Padding(
                          padding: EdgeInsets.only(
                              left: size.width * 0.08,
                              right: size.width * 0.08),
                          child: TextFormField(
                            obscureText: _stateEye,
                            controller: _password2Controller,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(8)),
                              labelText: S.of(context).Repassword,
                              labelStyle: StyleApp.alive,
                              suffixIcon: IconButton(
                                icon: SvgPicture.asset(!_stateEye
                                    ? Assets.eyeOpen
                                    : Assets.eyeClose),
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
                      Spacer(
                        flex: 2,
                      ),
                      Flexible(
                        child: Padding(
                          child: Row(
                            children: [
                              ButtonFlexible(
                                  onPressed: SignUp,
                                  text: S.of(context).Signup,
                                  color: ColorApp.blue,
                                  flex: 1,
                                  style: StyleApp.buttonSignIn),
                            ],
                          ),
                          padding: EdgeInsets.only(
                              left: size.width * 0.08,
                              right: size.width * 0.08),
                        ),
                        flex: 6,
                      ),
                      Spacer(
                        flex: 1,
                      ),
                      Flexible(
                        child: Center(
                            child: Text(
                          error,
                          style: StyleApp.error,
                        )),
                      )
                    ],
                  ),
                  flex: 1,
                  fit: FlexFit.tight,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
