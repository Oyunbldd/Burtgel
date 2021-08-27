import 'package:flutter/material.dart';
import '../../pages/timeChoose.dart';
import '../../pages/checkbox1.dart';

class Request2 extends StatefulWidget {
  final dynamic selectedDay;
  Request2({required this.selectedDay});

  @override
  _Request2State createState() => _Request2State();
}

class _Request2State extends State<Request2> {
  final inputController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('${widget.selectedDay}-ны '),
              SizedBox(
                width: 5,
              ),
              timeChoose(),
              SizedBox(
                width: 5,
              ),
              Text('цагаас '),
              SizedBox(
                width: 5,
              ),
              timeChoose(),
              SizedBox(
                width: 5,
              ),
              Text('хүртэл'),
            ],
          ),
          CheckBoxInListview1(),
          TextFormField(
            controller: inputController,
            decoration: InputDecoration(
              hintText: "Тайлбар",
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.0),
                borderSide: BorderSide(color: Colors.blue),
              ),
              disabledBorder: InputBorder.none,
              focusedBorder: OutlineInputBorder(
                borderSide:
                    const BorderSide(color: Colors.blueGrey, width: 2.0),
                borderRadius: BorderRadius.circular(10.0),
              ),
            ),
          ),
          TextButton(onPressed: () {}, child: Text('Click me'))
        ],
      ),
    );
  }
}
