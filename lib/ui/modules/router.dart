import 'package:flutter/material.dart';
import 'package:new_hotel_app/ui/pages/home.dart';
import 'package:new_hotel_app/ui/pages/loginpage.dart';
import 'package:new_hotel_app/ui/pages/homepage.dart';
import 'package:new_hotel_app/ui/pages/hoteldetailpage.dart';
import 'package:new_hotel_app/ui/pages/mappage.dart';
import 'package:new_hotel_app/ui/pages/addhotelpage.dart';
import 'package:new_hotel_app/ui/pages/signuppage.dart';

class RouterK {
  static Route generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case 'LoginPage':
        return MaterialPageRoute(builder: (context) => const LoginPage());
      case 'HotelDetailPage':
        return MaterialPageRoute(builder: (context) => const HotelDetailPage());
      case 'AddHotelPage':
        return MaterialPageRoute(builder: (context) => const AddHotelPage());
      case 'HomePage':
        return MaterialPageRoute(builder: (context) =>  HomePage());
      case 'MapPage':
        return MaterialPageRoute(builder: (context) => const MapPage());
      case 'SignUpPage':
        return MaterialPageRoute(builder: (context) => const SignUpPage());
      case 'Home':
        return MaterialPageRoute(builder: (context) => const Home());
      default:
        return MaterialPageRoute(builder: (_) {
          return Scaffold(
            body: Center(
              child: Text('No route defined for ${settings.name}'),
            ),
          );
        });
    }
  }
}
