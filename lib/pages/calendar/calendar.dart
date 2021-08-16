import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:table_calendar/table_calendar.dart';
import './request1.dart';
import './request2.dart';

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
    return Container(
      width: 350,
      child: ListView(
        children: [
          AnimatedContainer(
            height: count ? 0 : 20,
            width: 350,
            duration: Duration(milliseconds: 900),
            curve: !count ? Curves.easeInOut : Curves.easeInSine,
            alignment: Alignment.topLeft,
            child: Row(
              children: [
                Container(
                    height: 10,
                    width: 10,
                    decoration: BoxDecoration(
                      color: Colors.blue,
                      shape: BoxShape.circle,
                    )),
                SizedBox(
                  width: 5,
                ),
                Text(
                  'Ta өдрөө сонгоно уу',
                  style: TextStyle(fontSize: 18.0, color: Colors.blue),
                ),
              ],
            ),
            margin: EdgeInsets.fromLTRB(10.0, 15.0, 0.0, 0.0),
          ),

          Container(
            width: 350.0,
            child: TableCalendar(
              focusedDay: focusedDay,
              firstDay: DateTime(2021),
              lastDay: DateTime(2023),
              startingDayOfWeek: StartingDayOfWeek.monday,
              daysOfWeekVisible: true,
              onDaySelected: (DateTime selectDay, DateTime focusDay) {
                setState(() {
                  focusedDay = focusDay;
                  selectedDay = selectDay;
                  count = true;
                  whichSelect = "";
                });
              },
              calendarStyle: CalendarStyle(
                isTodayHighlighted: true,
                selectedDecoration: BoxDecoration(
                  color: !count ? Colors.white : Colors.blue,
                  shape: BoxShape.circle,
                ),
                todayDecoration: BoxDecoration(
                  color: Colors.white,
                ),
                todayTextStyle: TextStyle(color: Colors.black),
                weekendTextStyle: TextStyle(color: Colors.orangeAccent),
                selectedTextStyle:
                    TextStyle(color: !count ? Colors.black : Colors.white),
              ),
              headerStyle: HeaderStyle(
                formatButtonVisible: false,
                titleCentered: true,
                leftChevronPadding: EdgeInsets.fromLTRB(0, 12, 0, 12),
                rightChevronPadding: EdgeInsets.fromLTRB(0, 12, 0, 12),
              ),
              selectedDayPredicate: (DateTime date) {
                return isSameDay(selectedDay, date);
              },
            ),
          ),
          // TextButton(
          //   onPressed: () => errorHandler(),
          //   child: Text('alert popup'),
          // )
          AnimatedContainer(
            height: count ? 200 : 0,
            width: 350,
            duration: Duration(milliseconds: 900),
            curve: !count ? Curves.easeInOut : Curves.easeInSine,
            child: Column(
              children: [
                RequestDay(
                  selectedDay: dateFormat.format(selectedDay),
                  selectD: () {
                    setState(() {
                      whichSelect == 'selectD'
                          ? whichSelect = ""
                          : whichSelect = "selectD";
                    });
                  },
                  check: whichSelect,
                ),
                SizedBox(
                  height: 10,
                ),
                Request(
                  selectedDay: dateFormat.format(selectedDay),
                  selectC: () {
                    setState(() {
                      whichSelect == 'selectC'
                          ? whichSelect = ''
                          : whichSelect = "selectC";
                    });
                  },
                  check: whichSelect,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
