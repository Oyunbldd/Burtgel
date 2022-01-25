import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controller/idController.dart';
import '../controller/apiController.dart';
import '../controller/googleController.dart';

class Account extends StatefulWidget {
  @override
  _AccountState createState() => _AccountState();
}

class _AccountState extends State<Account> {
  final IdController data = Get.put(IdController());
  final ApiController apiController = Get.put(ApiController());
  final GoogleController google = Get.put(GoogleController());
  @override
  Widget build(BuildContext context) {
    apiController.getData().then((value) => print(value.data['data']));
    return Container(
      width: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            margin: EdgeInsets.fromLTRB(0.0, 50.0, 0.0, 0.0),
            child: Text('User information'),
          ),
          Container(
            margin: EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 100.0),
            width: 190.0,
            height: 30.0,
            child: ElevatedButton(
              child: Text(
                'Гарах',
                style: TextStyle(fontSize: 15.0),
              ),
              style: ElevatedButton.styleFrom(
                primary: Colors.redAccent,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0)),
              ),
              onPressed: () {
                google.handleSignOut();
                Navigator.pushNamed(context, '/login');
              },
            ),
          ),
        ],
      ),
    );
  }
}
