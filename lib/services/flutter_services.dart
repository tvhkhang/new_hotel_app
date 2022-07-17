import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class GoogleSignInProvider extends ChangeNotifier {
  Future<UserCredential> signInWithGoogle() async {
    final GoogleSignInAccount? googleUser = await GoogleSignIn(
            clientId:
                "577782014414-mvdme6bj7pc79jqgcr8tjq7o25ba8t0m.apps.googleusercontent.com")
        .signIn();
    final GoogleSignInAuthentication? googleAuth =
        await googleUser?.authentication;
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );
    notifyListeners();
    return await FirebaseAuth.instance.signInWithCredential(credential);
  }
}

class FacebookSignInProvider extends ChangeNotifier {
  Future<UserCredential> signInWithFacebook() async {
    final LoginResult loginResult = await FacebookAuth.instance.login();
    final OAuthCredential facebookAuthCredential =
        FacebookAuthProvider.credential(loginResult.accessToken!.token);
    notifyListeners();
    return FirebaseAuth.instance.signInWithCredential(facebookAuthCredential);
  }
}
