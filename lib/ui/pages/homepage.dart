import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:new_hotel_app/ui/constants/colors.dart';
import 'package:new_hotel_app/ui/constants/infohotel.dart';
import 'package:new_hotel_app/ui/constants/styles.dart';
import 'package:new_hotel_app/ui/modules/responsive.dart';
import 'package:new_hotel_app/ui/widgets/cards.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePage();
}

class _HomePage extends State<HomePage> {
  @override
  void initState() {
    super.initState();
  }
  String getId()
  {
    return FirebaseAuth.instance.currentUser!.uid;
  }
  @override
  Widget build(BuildContext context) {
    return Responsive(
        mobile: Scaffold(
          body:Center(
            child: Text('Mobile - Sign in with id ${getId()}',style: StyleApp.alive,),
          ),
        ),
        tablet: Container(
          color: ColorApp.black,
        ),
        desktop: Container(
          color: ColorApp.grey,
        ));
  }
}
