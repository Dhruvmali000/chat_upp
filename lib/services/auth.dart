// ignore_for_file: non_constant_identifier_names

import 'package:chat_upp/services/database.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthMethods {
  final FirebaseAuth auth = FirebaseAuth.instance;

  getCurrentUser() async {
    return auth.currentUser;
  }

  signInWithGoogle(BuildContext context, dynamic firebaseAuth) async {
    final FirebaseAuth = firebaseAuth.instance;
    final GoogleSignIn googleSignIn = GoogleSignIn();

    final GoogleSignInAccount? googleSignInAccount =
        await googleSignIn.signIn();

    final GoogleSignInAuthentication googleSignInAuthentication =
        await googleSignInAccount!.authentication;
    final AuthCredential credential = GoogleAuthProvider.credential(
      idToken: googleSignInAuthentication.idToken,
      accessToken: googleSignInAuthentication.accessToken,
    );

    UserCredential result = await FirebaseAuth.signInWithCredential(credential);

    User? userDetails = result.user;

    if (result != null) {
      Map<String, dynamic> userInfoMap = {
        "Name": userDetails!.displayName,
        "Email": userDetails.email,
        "Image": userDetails.photoURL,
        "UserId": userDetails.uid,
      };

      await DatabaseMethods()
          .addUser(userInfoMap, userDetails.uid)
          .then((value) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          backgroundColor: Colors.green,
          content: Text(
            "Sign in successful",
            style: TextStyle(
                color: Colors.black,
                fontSize: 22.0,
                fontWeight: FontWeight.bold),
          ),
        ));
      });
    }
  }
}
