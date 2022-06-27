import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:new_hotel_app/ui/modules/route_name.dart';
import 'package:new_hotel_app/ui/modules/router.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
bool shouldUseFirestoreEmulator = false;
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  FirebaseAuth.instance.signOut();
  runApp(const MyApp());
}
class MyApp extends StatelessWidget
{
  const MyApp({Key? key}) :super (key:key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: RouteName.loginPage,
      onGenerateRoute: RouterK.generateRoute,
    );
  }
}