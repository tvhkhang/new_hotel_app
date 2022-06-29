import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
// import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class GoogleSignInProvider extends ChangeNotifier {
  final googleSignIn = GoogleSignIn();
  GoogleSignInAccount? _user;

  GoogleSignInAccount? get user => _user;

  Future googleLogin() async {
    final googleUser = await googleSignIn.signIn();
    if (googleUser == null) return;
    _user = googleUser;
    final googleAuth = await googleUser.authentication;
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );
    await FirebaseAuth.instance.signInWithCredential(credential);
    notifyListeners();
  }
}
//
// class FacebookSignInProvider extends ChangeNotifier {
//   final _auth = FirebaseAuth.instance;
//   final _facebooklogin = FacebookLogin();
//
//   Future facebookLogin() async {
//     final result = await _facebooklogin.logIn(['email']);
//
//     if (result.status == FacebookLoginStatus.success) {
//       final credential =
//           FacebookAuthProvider.credential(result.accessToken!.token);
//       await FirebaseAuth.instance.signInWithCredential(credential);
//     }
//     notifyListeners();
//   }
// }
