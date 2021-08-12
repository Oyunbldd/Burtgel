import 'package:flutter/material.dart';
import 'package:get/get.dart';
import './pages/login.dart';
import './pages/home.dart';

void main() => runApp(GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/login',
      routes: {
        '/login': (context) => Login(),
        '/home': (context) => Home(),
      },
    ));
