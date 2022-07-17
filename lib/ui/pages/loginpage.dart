import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:new_hotel_app/generated/l10n.dart';
import 'package:new_hotel_app/services/flutter_services.dart';
import 'package:new_hotel_app/ui/constants/assets.dart';
import 'package:new_hotel_app/ui/constants/colors.dart';
import 'package:new_hotel_app/ui/constants/styles.dart';
import 'package:new_hotel_app/ui/modules/utils.dart';
import 'package:new_hotel_app/ui/modules/responsive.dart';
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
                  S.of(context).Language,
                  style: StyleApp.welcome,
                ),
              ),
              IconButton(
                onPressed: () {
                  var currentLang = Localizations.localeOf(context);
                  var locale = Locale(
                      (currentLang == const Locale('en')) ? 'vi' : 'en', '');
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
                const Spacer(
                  flex: 6,
                ), //0.015
                Flexible(
                  child: Stack(
                    alignment: Alignment.bottomCenter,
                    children: [
                      Image.asset(
                        'assets/images/1x/logo.png',
                        height: size.height * 0.15,
                      ),
                      Image.asset(
                        'assets/images/1x/buildings.png',
                        height: size.height * 0.12,
                      )
                    ],
                  ),
                  flex: 10,
                ),
                const Spacer(
                  flex: 6,
                ),
                Flexible(
                  child: Text(
                    S.of(context).Welcome,
                    style: StyleApp.welcome,
                  ),
                  flex: 4,
                ),
                Flexible(
                  child: Text(
                    S.of(context).Alive,
                    style: StyleApp.alive,
                  ),
                  flex: 3,
                ),
                const Spacer(
                  flex: 3,
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
                  flex: 6,
                ),
                const Spacer(
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
                  flex: 6,
                ),
                const Spacer(
                  flex: 2,
                ),
                Flexible(
                  child: Container(
                    child: Row(
                      children: [
                        Flexible(
                          child: ElevatedButton(
                            child: Text(
                              S.of(context).Signi,
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
                const Spacer(
                  flex: 1,
                ),
                Flexible(
                  child: Center(
                    child: Text(
                      S.of(context).Or,
                      style: StyleApp.alive,
                    ),
                  ),
                  flex: 3,
                ),
                const Spacer(
                  flex: 1,
                ),
                Flexible(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(width: size.width * 0.08),
                      Flexible(
                        flex: 5,
                        fit: FlexFit.tight,
                        child: ElevatedButton(
                          child: Image.asset(
                            'assets/images/1x/google.jpg',
                            height: 18,
                          ),
                          onPressed: GoogleSignInProvider().signInWithGoogle,
                          style: ElevatedButton.styleFrom(
                              minimumSize: const Size(0, 53),
                              primary: ColorApp.white,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8.0))),
                        ),
                      ),
                      const Spacer(
                        flex: 1,
                      ),
                      Flexible(
                        flex: 5,
                        fit: FlexFit.tight,
                        child: ElevatedButton(
                          child: SvgPicture.asset(Assets.facebook),
                          onPressed:
                              FacebookSignInProvider().signInWithFacebook,
                          style: ElevatedButton.styleFrom(
                              minimumSize: const Size(0, 53),
                              primary: ColorApp.white,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8.0))),
                        ),
                      ),
                      SizedBox(width: size.width * 0.08),
                    ],
                  ),
                  flex: 6,
                ),
                const Spacer(
                  flex: 1,
                ),
                Flexible(
                  child: Center(
                      child: GestureDetector(
                    child: RichText(
                      text: TextSpan(
                          text: S.of(context).Don,
                          style: StyleApp.alive,
                          children: [
                            TextSpan(
                                text: S.of(context).Signu,
                                style: StyleApp.signup)
                          ]),
                    ),
                    onTap: () {
                      Navigator.pushNamed(context, "SignUpPage");
                    },
                  )),
                  flex: 3,
                ),
                const Spacer(
                  flex: 2,
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
                  S.of(context).Language,
                  style: StyleApp.welcome,
                ),
              ),
              IconButton(
                onPressed: () {
                  var currentLang = Localizations.localeOf(context);
                  var locale = Locale(
                      (currentLang == const Locale('en')) ? 'vi' : 'en', '');
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
                  child: Stack(
                    alignment: Alignment.bottomCenter,
                    children: [
                      Image.asset(
                        'assets/images/1x/logo.png',
                        height: size.height * 0.15,
                      ),
                      Image.asset(
                        'assets/images/1x/buildings.png',
                        height: size.height * 0.12,
                      )
                    ],
                  ),
                  flex: 1,
                  fit: FlexFit.tight,
                ),
                Flexible(
                  child: Column(
                    children: [
                      const Spacer(
                        flex: 6,
                      ), //0.015
                      const Spacer(
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
                      const Spacer(
                        flex: 3,
                      ),
                      Flexible(
                        child: Container(
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
                      const Spacer(
                        flex: 1,
                      ),
                      Flexible(
                        child: Container(
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
                      const Spacer(
                        flex: 2,
                      ),
                      Flexible(
                        child: Container(
                          child: Row(
                            children: [
                              Flexible(
                                child: ElevatedButton(
                                  child: Text(
                                    S.of(context).Signi,
                                    style: StyleApp.buttonSignIn,
                                  ),
                                  style: ElevatedButton.styleFrom(
                                      minimumSize: const Size(0, 53),
                                      primary: ColorApp.blue,
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(8.0))),
                                  onPressed: signInEmailPass,
                                ),
                                flex: 1,
                                fit: FlexFit.tight,
                              )
                            ],
                          ),
                          padding: EdgeInsets.only(
                              left: size.width * 0.08,
                              right: size.width * 0.08),
                        ),
                        flex: 6,
                      ),
                      const Spacer(
                        flex: 1,
                      ),
                      Flexible(
                        child: Center(
                          child: Text(
                            S.of(context).Or,
                            style: StyleApp.alive,
                          ),
                        ),
                        flex: 6,
                      ),
                      const Spacer(
                        flex: 1,
                      ),
                      Flexible(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SizedBox(width: size.width * 0.08),
                            Flexible(
                              flex: 5,
                              fit: FlexFit.tight,
                              child: ElevatedButton(
                                child: Image.asset(
                                  'assets/images/1x/google.jpg',
                                  height: 18,
                                ),
                                onPressed:
                                    GoogleSignInProvider().signInWithGoogle,
                                style: ElevatedButton.styleFrom(
                                    minimumSize: const Size(0, 53),
                                    primary: ColorApp.white,
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(8.0))),
                              ),
                            ),
                            const Spacer(
                              flex: 1,
                            ),
                            Flexible(
                              flex: 5,
                              fit: FlexFit.tight,
                              child: ElevatedButton(
                                child: SvgPicture.asset(Assets.facebook),
                                onPressed:
                                    FacebookSignInProvider().signInWithFacebook,
                                style: ElevatedButton.styleFrom(
                                    minimumSize: const Size(0, 53),
                                    primary: ColorApp.white,
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(8.0))),
                              ),
                            ),
                            SizedBox(width: size.width * 0.08),
                          ],
                        ),
                        flex: 6,
                      ),
                      const Spacer(
                        flex: 1,
                      ),
                      Flexible(
                        child: Center(
                            child: GestureDetector(
                          child: RichText(
                            text: TextSpan(
                                text: S.of(context).Don,
                                style: StyleApp.alive,
                                children: [
                                  TextSpan(
                                      text: S.of(context).Signu,
                                      style: StyleApp.signup)
                                ]),
                          ),
                          onTap: () {
                            Navigator.pushNamed(context, "SignUpPage");
                          },
                        )),
                        flex: 6,
                      ),
                      const Spacer(
                        flex: 2,
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
                  S.of(context).Language,
                  style: StyleApp.welcome,
                ),
              ),
              IconButton(
                onPressed: () {
                  var currentLang = Localizations.localeOf(context);
                  var locale = Locale(
                      (currentLang == const Locale('en')) ? 'vi' : 'en', '');
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
                  child: Stack(
                    alignment: Alignment.bottomCenter,
                    children: [
                      Image.asset(
                        'assets/images/1x/logo.png',
                        height: size.height * 0.15,
                      ),
                      Image.asset(
                        'assets/images/1x/buildings.png',
                        height: size.height * 0.12,
                      )
                    ],
                  ),
                  flex: 1,
                  fit: FlexFit.tight,
                ),
                Flexible(
                  child: Column(
                    children: [
                      const Spacer(
                        flex: 6,
                      ), //0.015
                      const Spacer(
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
                      const Spacer(
                        flex: 3,
                      ),
                      Flexible(
                        child: Container(
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
                      const Spacer(
                        flex: 1,
                      ),
                      Flexible(
                        child: Container(
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
                      const Spacer(
                        flex: 2,
                      ),
                      Flexible(
                        child: Container(
                          child: Row(
                            children: [
                              Flexible(
                                child: ElevatedButton(
                                  child: Text(
                                    S.of(context).Signi,
                                    style: StyleApp.buttonSignIn,
                                  ),
                                  style: ElevatedButton.styleFrom(
                                      minimumSize: const Size(0, 53),
                                      primary: ColorApp.blue,
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(8.0))),
                                  onPressed: signInEmailPass,
                                ),
                                flex: 1,
                                fit: FlexFit.tight,
                              )
                            ],
                          ),
                          padding: EdgeInsets.only(
                              left: size.width * 0.08,
                              right: size.width * 0.08),
                        ),
                        flex: 6,
                      ),
                      const Spacer(
                        flex: 1,
                      ),
                      Flexible(
                        child: Center(
                          child: Text(
                            S.of(context).Or,
                            style: StyleApp.alive,
                          ),
                        ),
                        flex: 6,
                      ),
                      const Spacer(
                        flex: 1,
                      ),
                      Flexible(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SizedBox(width: size.width * 0.08),
                            Flexible(
                              flex: 5,
                              fit: FlexFit.tight,
                              child: ElevatedButton(
                                child: Image.asset(
                                  'assets/images/1x/google.jpg',
                                  height: 18,
                                ),
                                onPressed:
                                    GoogleSignInProvider().signInWithGoogle,
                                style: ElevatedButton.styleFrom(
                                    minimumSize: const Size(0, 53),
                                    primary: ColorApp.white,
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(8.0))),
                              ),
                            ),
                            const Spacer(
                              flex: 1,
                            ),
                            Flexible(
                              flex: 5,
                              fit: FlexFit.tight,
                              child: ElevatedButton(
                                child: SvgPicture.asset(Assets.facebook),
                                onPressed:
                                    FacebookSignInProvider().signInWithFacebook,
                                style: ElevatedButton.styleFrom(
                                    minimumSize: const Size(0, 53),
                                    primary: ColorApp.white,
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(8.0))),
                              ),
                            ),
                            SizedBox(width: size.width * 0.08),
                          ],
                        ),
                        flex: 6,
                      ),
                      const Spacer(
                        flex: 1,
                      ),
                      Flexible(
                        child: Center(
                            child: GestureDetector(
                          child: RichText(
                            text: TextSpan(
                                text: S.of(context).Don,
                                style: StyleApp.alive,
                                children: [
                                  TextSpan(
                                      text: S.of(context).Signu,
                                      style: StyleApp.signup)
                                ]),
                          ),
                          onTap: () {
                            Navigator.pushNamed(context, "SignUpPage");
                          },
                        )),
                        flex: 6,
                      ),
                      const Spacer(
                        flex: 2,
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

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void getCurrentUser() {
    final user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      final name = user.displayName;
      final email = user.email;
      final photoUrl = user.photoURL;
      final emailVerified = user.emailVerified;
      final uid = user.uid;
      print(
          'name: $name\nemail: $email\nphotoUrl: $photoUrl\nemail: $emailVerified\nuid: $uid');
    }
  }

  @override
  void initState() {
    super.initState();
  }

  Future<void> signInEmailPass() async {
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: _emailController.text.trim(),
          password: _passwordController.text.trim());
    } catch (e) {
      String result;
      result = e.toString();
      final snackBar = SnackBar(
        content: Text(e.toString()),
      );
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
      final res = await Connectivity().checkConnectivity();
      showConnectivitySnackBar(res);
    }
  }

  void showConnectivitySnackBar(ConnectivityResult result) {
    final hasInternet = result != ConnectivityResult.none;
    final message = hasInternet
        ? "You have again ${result.toString()}"
        : "You have no internet";
    final color = hasInternet ? Colors.green : Colors.red;
    Utils.showTopSnackBar(context, message, color);
  }
}
/*

*/
