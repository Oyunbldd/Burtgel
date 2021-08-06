import 'package:flutter/material.dart';
import './pages/login.dart';
import './pages/home.dart';
void main() => runApp(MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/login',
      routes: {
        '/login':(context)=>Login(),
        '/home':(context)=>Home(),
      },
    ));
