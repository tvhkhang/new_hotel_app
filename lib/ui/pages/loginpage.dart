import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget
{
  const LoginPage({Key? key}) : super(key : key);
  @override
  State<LoginPage> createState()=> _LoginPage();
}
class _LoginPage extends State<LoginPage>
{
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: Row(
        children: [
          Center(
            child: Stack(
              children: [
                Container(
                  child: Image.asset('assets/images/1x/logo.png',height: 127,),
                ),
                Container(
                  child: Image.asset('assets/images/1x/buildings.png',height: 100,),
                ),
              ],
            ),
            padding: EdgeInsets.only(top: 101),
          )
        ],
      ),
    );
}
}