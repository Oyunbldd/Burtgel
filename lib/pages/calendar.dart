import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:table_calendar/table_calendar.dart';
import 'calendar/request1.dart';
import 'calendar/request2.dart';

class Calendar extends StatefulWidget {
  @override
  _CalendarState createState() => _CalendarState();
}

class _CalendarState extends State<Calendar> {
  CalendarFormat format = CalendarFormat.month;
  DateTime selectedDay = DateTime.now();
  DateTime focusedDay = DateTime.now();
  final dateFormat = DateFormat('yyyy-MM-dd');
  String whichSelect = "";
  bool count = false;
  double _height = 180;

  @override
  Widget build(BuildContext context) {
    double _width = MediaQuery.of(context).size.width * 0.95;
    void _showMaterialDialog() {
      showGeneralDialog(
        barrierLabel: "Label",
        barrierDismissible: true,
        barrierColor: Colors.black.withOpacity(0.8),
        transitionDuration: Duration(milliseconds: 500),
        context: context,
        pageBuilder: (context, anim1, anim2) {
          return Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: 500,
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(10),
                  topRight: Radius.circular(10),
                ),
              ),
              child: Scaffold(
                body: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                '5 r sariin 1',
                                style: TextStyle(
                                    color: Colors.blueAccent,
                                    fontSize: 25,
                                    fontWeight: FontWeight.bold),
                              ),
                              Text(
                                'Davaa garag',
                              ),
                            ],
                          ),
                          IconButton(
                            onPressed: () {},
                            icon: Icon(
                              Icons.close_rounded,
                              size: 20,
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
          );
        },
        transitionBuilder: (context, anim1, anim2, child) {
          return SlideTransition(
            position:
                Tween(begin: Offset(0, 1), end: Offset(0, 0)).animate(anim1),
            child: child,
          );
        },
      );
    }

    return Container(
      width: _width,
      child: ListView(
        children: [
          Container(
            width: 350.0,
            margin: EdgeInsets.only(top: 15),
            decoration: BoxDecoration(
              border: Border.all(width: 2, color: Colors.white),
              borderRadius: BorderRadius.circular(20),
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.8),
                  spreadRadius: 2,
                  blurRadius: 5,
                ),
              ],
            ),
            child: TableCalendar(
              locale: 'mn_MN',
              headerStyle: HeaderStyle(
                formatButtonVisible: false,
                decoration: BoxDecoration(
                  color: Colors.blueAccent,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20),
                  ),
                ),
                titleCentered: true,
                titleTextStyle: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold),
                leftChevronIcon: Icon(
                  Icons.chevron_left,
                  color: Colors.white,
                ),
                rightChevronIcon: Icon(
                  Icons.chevron_right,
                  color: Colors.white,
                ),
              ),
              daysOfWeekHeight: 35,
              daysOfWeekStyle: DaysOfWeekStyle(
                weekdayStyle: TextStyle(
                  fontSize: 14.0,
                  height: 2,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF637392),
                ),
                weekendStyle: TextStyle(
                  fontSize: 14.0,
                  height: 2,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF637392),
                ),
              ),
              focusedDay: focusedDay,
              firstDay: DateTime(2022),
              lastDay: DateTime(2023),
              startingDayOfWeek: StartingDayOfWeek.monday,
              daysOfWeekVisible: true,
              onDaySelected: (DateTime selectDay, DateTime focusDay) {
                setState(() {
                  focusedDay = focusDay;
                  selectedDay = selectDay;
                  count = true;
                  whichSelect = "";
                  _showMaterialDialog();
                  print(focusDay);
                });
              },
              calendarStyle: CalendarStyle(
                cellMargin: EdgeInsets.all(10),
                isTodayHighlighted: true,
                selectedDecoration: BoxDecoration(
                  color: Colors.grey,
                  shape: BoxShape.circle,
                ),
                outsideDecoration: BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.circle,
                  border: Border.all(color: Colors.blueGrey),
                ),
                defaultDecoration: BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.circle,
                  border: Border.all(color: Colors.blueGrey),
                ),
                weekendDecoration: BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.circle,
                  border: Border.all(color: Colors.blueGrey),
                ),
                weekendTextStyle: TextStyle(color: Colors.grey),
                selectedTextStyle: TextStyle(color: Colors.black),
              ),
              selectedDayPredicate: (DateTime date) {
                return isSameDay(selectedDay, date);
              },
            ),
          ),

          // AnimatedContainer(
          //   margin: EdgeInsets.fromLTRB(0, 10, 0, 0),
          //   height: count ? 200 : 0,
          //   width: 350,
          //   duration: Duration(milliseconds: 400),
          //   curve: !count ? Curves.easeInOut : Curves.easeInSine,
          //   child: Column(
          //     children: [
          //       RequestDay(
          //         selectedDay: dateFormat.format(selectedDay),
          //         selectD: () {
          //           setState(() {
          //             whichSelect == 'selectD'
          //                 ? whichSelect = ""
          //                 : whichSelect = "selectD";
          //           });
          //         },
          //         check: whichSelect,
          //       ),
          //       SizedBox(
          //         height: 10,
          //       ),
          //       Request(
          //         selectedDay: dateFormat.format(selectedDay),
          //         selectC: () {
          //           setState(() {
          //             whichSelect == 'selectC'
          //                 ? whichSelect = ''
          //                 : whichSelect = "selectC";
          //           });
          //         },
          //         check: whichSelect,
          //       ),
          //     ],
          //   ),
          // ),
        ],
      ),
    );
  }
}
