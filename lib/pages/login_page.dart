import 'package:chat_upp/services/auth.dart';
import 'package:flutter/material.dart';

class Loginpage extends StatefulWidget {
  const Loginpage({super.key});

  @override
  State<Loginpage> createState() => _LoginpageState();
}

class _LoginpageState extends State<Loginpage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: EdgeInsets.only(top: 40.0, left: 20.0),
        child: Column(
          children: [
            SizedBox(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height / 2,
                child: Image.asset("images/log.png")),
            SizedBox(
              height: 10.0,
            ),
            Padding(
              padding: const EdgeInsets.only(right: 20.0, left: 20.0),
              child: Text(
                "Enjoy the new experiance of chatting with globle friends",
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 22.0,
                    fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(
              height: 30.0,
            ),
            Padding(
              padding: const EdgeInsets.only(right: 20.0, left: 20.0),
              child: Text(
                "Connect people around the world for free",
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: Colors.black54,
                    fontSize: 16.0,
                    fontWeight: FontWeight.w500),
              ),
            ),
            SizedBox(
              height: 30.0,
            ),
            GestureDetector(
              onTap: () {
                AuthMethods().signInWithGoogle(context, () {});
              },
              child: Container(
                margin: EdgeInsets.only(right: 30.0, left: 30.0),
                child: Material(
                  elevation: 5.0,
                  borderRadius: BorderRadius.circular(20),
                  child: Container(
                    height: 70.0,
                    padding: EdgeInsets.only(
                        right: 5.0, left: 30.0, top: 8.0, bottom: 5.0),
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                      color: Color(0xff703eff),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          "images/G.png",
                          height: 50,
                          width: 50,
                          fit: BoxFit.cover,
                        ),
                        SizedBox(
                          width: 20.0,
                        ),
                        Text(
                          "Sign in with Google",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 22.0,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
