import 'package:flutter/material.dart';

class checkbox extends StatefulWidget {
  checkbox({Key? key}) : super(key: key);

  @override
  _checkboxState createState() => _checkboxState();
}

class _checkboxState extends State<checkbox> {
  bool _isChecked = true;
  String _currText = '';

  List<String> text = [
    "Ар гэрийн гачигдал ",
    "Эрүүл мэндийн шалтгаан ",
    "Зайлшгүй шаардлага ",
    "Бусад"
  ];
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          text.map((e) => CheckboxListTile(value: _isChecked, onChanged: onChanged))
        ],
      ),
    );
  }
}
