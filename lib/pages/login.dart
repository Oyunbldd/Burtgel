import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:http/http.dart' as http;
import '../controller/idController.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final IdController idController = Get.put(IdController());
  void errorHandler() => {
        showDialog(
          context: context,
          builder: (BuildContext context) => AlertDialog(
            title: const Text('AlertDialog Title'),
            content: const Text('AlertDialog description'),
            actions: <Widget>[
              TextButton(
                onPressed: () => Navigator.pop(context, 'Cancel'),
                child: const Text('Cancel'),
              ),
              TextButton(
                onPressed: () => Navigator.pop(context, 'OK'),
                child: const Text('OK'),
              ),
            ],
          ),
        ),
      };
  Future<dynamic> getData(data) async {
    final body = {
      'displayName': '${data.displayName}',
      'id': '${data.id}',
      'gmail': '${data.email}',
      'photoUrl': '${data.photoUrl}'
    };
    final jsonString = json.encode(body);
    //check gmail
    // if(check!='callpro.mn'){
    //   errorHandler();
    // }
    Map<String, String> headers = {"Content-type": "application/json"};
    String url = "http://localhost:8001/api/v1/users/?gmail=${data.email}";
    final response =
        await http.post(Uri.parse(url), headers: headers, body: jsonString);
    dynamic test = jsonDecode(response.body)['data'][0];
    String id = test['_id'].toString();
    idController.increment(id);
    Navigator.pushNamed(context, '/home');
  }

  GoogleSignIn _googleSignIn = GoogleSignIn();
  Future<void> _handleSignIn() async {
    try {
      await _googleSignIn.signIn().then((userData) => setState(() {
            getData(userData);
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
