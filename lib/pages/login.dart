import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:http/http.dart' as http;

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  Future<dynamic> getData(id) async {
    //odoo end user iig gmail iin haigaa 200 baival tsaash shidne
    print('iishee orson');
    final response =
        await http.get(Uri.parse("http://localhost:8001/api/v1/user/${id}"));
    if (response.statusCode == 200) {
      print(jsonDecode(response.body));
      Navigator.pushNamed(context, '/home');
    } else {
      print('User olsongui');
    }
  }

  late GoogleSignInAccount _userObj;
  late String id;
  GoogleSignIn _googleSignIn = GoogleSignIn();
  Future<void> _handleSignIn() async {
    try {
      await _googleSignIn.signIn().then((userData) => setState(() {
            _userObj = userData!;
            id = _userObj.id;
            getData(id);
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
            TextButton(
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
