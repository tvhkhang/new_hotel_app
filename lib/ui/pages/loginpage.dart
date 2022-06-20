import 'package:flutter/material.dart';
import 'package:new_hotel_app/ui/constants/colors.dart';
import 'package:new_hotel_app/ui/constants/styles.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPage();

}

class _LoginPage extends State<LoginPage> {
  @override
  final _emailController=TextEditingController();
  final _passwordController=TextEditingController();
  void initState() {
    // TODO: implement initState
    super.initState();

  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        color: ColorApp.backgroundApp,
        alignment: Alignment.center,
        child: Column(
          children: [
            Container(
              child: SizedBox(
                height: 101,
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
                height: 91,
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
              child: TextFormField(
                controller: _emailController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Email',
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
