import 'package:flutter/material.dart';
import '../../pages/timeChoose.dart';
import '../../pages/checkbox.dart';
import './request1a.dart';
import './request1b.dart';
import './request2.dart';

class SendRequest extends StatefulWidget {
  @override
  _SendRequestState createState() => _SendRequestState();
}

final inputController = TextEditingController();

class _SendRequestState extends State<SendRequest> {
  @override
  Widget build(BuildContext context) {
    dynamic args = ModalRoute.of(context)!.settings.arguments;
    final inputController = TextEditingController();
    String dropdownValue = '09:00';
    print(args[0]);
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            args[0],
            style: TextStyle(color: Colors.black, fontSize: 15),
          ),
          centerTitle: true,
          backgroundColor: Colors.white,
          iconTheme: IconThemeData(color: Colors.blue),
          elevation: 0,
        ),
        body: Container(
          margin: EdgeInsets.fromLTRB(0, 10, 0, 0),
          width: double.infinity,
          height: double.infinity,
          padding: EdgeInsets.all(10),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                args[0] == 'Чөлөө авах / Цагаар'
                    ? Request1a(selectedDay: args[1])
                    : args[0] == 'Чөлөө авах / Өдрөөр'
                        ? Request1b(selectedDay: args[1])
                        : Request2(selectedDay: args[1]),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
