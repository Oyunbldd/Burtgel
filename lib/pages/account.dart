import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';
import '../controller/idController.dart';

class Account extends StatefulWidget {
  @override
  _AccountState createState() => _AccountState();
}

class _AccountState extends State<Account> {
  final IdController data = Get.put(IdController());
  @override
  Widget build(BuildContext context) {
    print(data.id);
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
                primary: HexColor('#C4C4C4'),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0)),
              ),
              onPressed: () {
                Navigator.pushNamed(context, '/login');
              },
            ),
          ),
        ],
      ),
    );
  }
}
