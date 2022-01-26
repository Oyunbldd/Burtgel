import 'package:flutter/material.dart';
import 'package:get/get.dart';
import './pages/login.dart';
import './pages/home.dart';
import 'screen/request/request.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

void main() => runApp(
      GetMaterialApp(
        debugShowCheckedModeBanner: false,
        localizationsDelegates: GlobalMaterialLocalizations.delegates,
        supportedLocales: [const Locale('mn', 'MN')],
        initialRoute: '/home',
        routes: {
          '/login': (context) => Login(),
          '/home': (context) => Home(),
          '/request': (contetxt) => SendRequest(),
        },
      ),
    );
