import 'package:flutter/material.dart';
import 'package:new_hotel_app/ui/modules/route_name.dart';
import 'package:new_hotel_app/ui/modules/router.dart';
void main() {
  runApp(const MyApp());
}
class MyApp extends StatelessWidget
{
  const MyApp({Key? key}) :super (key:key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: RouteName.homePage,
      onGenerateRoute: RouterK.generateRoute,
    );
  }
}