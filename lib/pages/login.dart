import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:google_sign_in/google_sign_in.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  late GoogleSignInAccount _userObj;
  GoogleSignIn _googleSignIn = GoogleSignIn();
  Future<void> _handleSignIn() async {
    try {
      await _googleSignIn.signIn().then((userData) => setState(() {
            _userObj = userData!;
            print(_userObj);
            Navigator.pushNamed(context, '/home');
          }));
    } catch (error) {
      print(error);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: HexColor('#083985'),
      body: Container(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(
              'assets/callpro-logo.png',
              width: 270.0,
              height: 60.0,
            ),
            ElevatedButton(
              onPressed: () => _handleSignIn(),
              child: Image.asset(
                'assets/google-login.png',
                width: 255.0,
                height: 55.0,
              ),
            )
          ],
        ),
      ),
    );
  }
}
