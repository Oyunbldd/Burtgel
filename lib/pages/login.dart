// ignore: unused_import
// ignore_for_file: unused_import

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controller/idController.dart';
import '../controller/googleController.dart';
import '../controller/apiController.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final IdController idController = Get.put(IdController());
  final GoogleController googleController = Get.put(GoogleController());
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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueAccent,
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
              onPressed: () async {
                await googleController
                    .handleSignIn()
                    .then((value) => Navigator.pushNamed(context, '/home'));
              },
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
