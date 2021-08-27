import 'package:flutter/material.dart';

class CheckBoxInListview1 extends StatefulWidget {
  @override
  _CheckBoxInListview1State createState() => _CheckBoxInListview1State();
}

class _CheckBoxInListview1State extends State<CheckBoxInListview1> {
  late String whichone = "";
  List<String> _texts = [
    "Tүгээлт",
    "Суурилуулалт",
    "Засвар",
    "Бусад",
  ];
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 250,
      child: ListView(
        padding: EdgeInsets.all(8.0),
        children: _texts
            .map((text) => CheckboxListTile(
                  controlAffinity: ListTileControlAffinity.leading,
                  title: Text(text),
                  value: whichone == text ? true : false,
                  onChanged: (val) {
                    setState(() {
                      whichone == text ? whichone = "" : whichone = text;
                    });
                  },
                ))
            .toList(),
      ),
    );
  }
}
