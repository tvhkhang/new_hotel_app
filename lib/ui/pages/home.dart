import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:new_hotel_app/ui/pages/homepage.dart';
import 'package:new_hotel_app/ui/pages/loginpage.dart';
class Home extends StatefulWidget
{
  const Home({Key? key}) : super(key: key);
  @override
  State<Home> createState()=> _Home();
}
class _Home extends State<Home>
{
  @override 
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context,snapshot)
        {
          if (snapshot.connectionState==ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator(),);
          }
          else if (snapshot.hasData)
            {
              return HomePage();
            }
          else if (snapshot.hasError)
            {
              return Center(child: Text('Something Went Wrong'),);
            }
          else {
            return LoginPage();
          }

        },
    );
  }
}