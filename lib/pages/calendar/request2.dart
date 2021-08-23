import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Request extends StatefulWidget {
  final String selectedDay;
  final dynamic selectC;
  late String check;
  Request(
      {required this.selectedDay, required this.selectC, required this.check});

  @override
  _RequestState createState() => _RequestState();
}

class _RequestState extends State<Request> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, '/request',
            arguments: ["Гадуур ажиллах", widget.selectedDay]);
      },
      child: Container(
        height: 45,
        padding: EdgeInsets.symmetric(horizontal: 15),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [Text('Гадуур ажиллах '), Text('${widget.selectedDay}'),],
        ),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            border: Border.all(
                color: widget.check != 'selectD'
                    ? Colors.blueAccent
                    : Colors.white),
            color: widget.check != 'selectD' ? Colors.white : Colors.grey),
      ),
    );
  }
}
