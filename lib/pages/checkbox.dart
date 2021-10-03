import 'package:flutter/material.dart';

class CheckBoxInListview extends StatefulWidget {
  @override
  _CheckBoxInListviewState createState() => _CheckBoxInListviewState();
}

class _CheckBoxInListviewState extends State<CheckBoxInListview> {
  late String whichone = "";
  List<String> _texts = [
    "Ар гэрийн гачигдал ",
    "Эрүүл мэндийн шалтгаан ",
    "Зайлшгүй шаардлага ",
    "Бусад",
  ];
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 250,
      child: ListView(
        padding: EdgeInsets.all(5.0),
        children: _texts
            .map((text) => CheckboxListTile(
           controlAffinity: ListTileControlAffinity.platform,
                  // controlAffinity: ListTileControlAffinity.leading,
                  title: Text(
                    text,
                    style: TextStyle(fontSize: 12),
                  ),
                  value: whichone == text ? true : false,
                  onChanged: (val) {
                    setState(() {
                      whichone == text ? whichone = "" : whichone = text;
                      print(whichone);
                    });
                  },
                ))
            .toList(),
      ),
    );
  }
}
