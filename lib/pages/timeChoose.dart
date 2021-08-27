import 'package:flutter/material.dart';

class timeChoose extends StatefulWidget {
  timeChoose({Key? key}) : super(key: key);

  @override
  _timeChooseState createState() => _timeChooseState();
}

class _timeChooseState extends State<timeChoose> {
  String _selectedTime = '9:00AM';
  @override
  Widget build(BuildContext context) {
    Future<void> _openTimePicker(BuildContext context) async {
      final TimeOfDay? t =
          await showTimePicker(context: context, initialTime: TimeOfDay.now());
      if (t != null) {
        setState(() {
          _selectedTime = t.format(context);
        });
      }
    }

    return Container(
      width: 60,
      child: RawMaterialButton(
        fillColor: Colors.blue,
        onPressed: () {
          _openTimePicker(context);
        },
        child: Text(
          _selectedTime,
          style: TextStyle(color: Colors.white, fontSize: 15),
        ),
      ),
    );
  }
}
