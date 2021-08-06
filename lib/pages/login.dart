import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class Login extends StatelessWidget {
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
            InkWell(
              onTap: () => Navigator.pushNamed(context, '/home'),
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
