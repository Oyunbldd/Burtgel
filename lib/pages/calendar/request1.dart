import 'package:flutter/material.dart';

class RequestDay extends StatefulWidget {
  final String selectedDay;
  final dynamic selectD;
  late String check;
  RequestDay(
      {required this.selectedDay, required this.selectD, required this.check});

  @override
  _RequestDayState createState() => _RequestDayState();
}

class _RequestDayState extends State<RequestDay> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          GestureDetector(
            onTap: () {
              widget.selectD();
            },
            child: Container(
              height: 45,
              padding: EdgeInsets.symmetric(horizontal: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Чөлөө авах '),
                  Row(
                    children: [
                      Text('${widget.selectedDay}'),
                      widget.check == 'selectD'
                          ? Icon(Icons.arrow_drop_down)
                          : SizedBox(),
                    ],
                  )
                ],
              ),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(
                      color: widget.check != 'selectC'
                          ? Colors.blueAccent
                          : Colors.white),
                  color:
                      widget.check != "selectC" ? Colors.white : Colors.grey),
            ),
          ),
          AnimatedContainer(
            duration: Duration(milliseconds: 900),
            margin: EdgeInsets.fromLTRB(0, 10, 0, 0),
            curve: widget.check == 'selectD'
                ? Curves.easeInOut
                : Curves.easeInSine,
            height: widget.check == 'selectD' ? 80 : 0,
            width: 350,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: Colors.white),
                color: Colors.lightBlue),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Та чөлөө авах төрлөө сонгoно уу',
                  style: TextStyle(color: Colors.white, fontSize: 15),
                ),
                Container(
                  width: 200,
                  margin: EdgeInsets.fromLTRB(0, 4, 0, 0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        height: 35,
                        width: 90,
                        child: TextButton(
                          onPressed: () {
                            Navigator.pushNamed(context, '/request',
                                arguments: [
                                  "Чөлөө авах / Цагаар",
                                  widget.selectedDay
                                ]);
                          },
                          child: Text(
                            'Цагаар',
                            style: TextStyle(color: Colors.black, fontSize: 12),
                          ),
                        ),
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.white),
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.white),
                      ),
                      Container(
                        height: 35,
                        width: 90,
                        child: TextButton(
                          onPressed: () {
                            Navigator.pushNamed(context, '/request',
                                arguments: [
                                  "Чөлөө авах / Өдрөөр",
                                  widget.selectedDay
                                ]);
                          },
                          child: Text(
                            'Өдрөөр',
                            style: TextStyle(color: Colors.black, fontSize: 12),
                          ),
                        ),
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.white),
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.white),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
