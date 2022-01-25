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
            duration: Duration(milliseconds: 800),
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
                  ),
                ),
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
            margin: EdgeInsets.only(top: 10),
            decoration: BoxDecoration(
                border: Border.all(width: 2, color: Colors.white),
                borderRadius: BorderRadius.circular(20),
                color: Colors.white),
            child: TableCalendar(
              locale: 'mn_MN',
              headerStyle: HeaderStyle(
                formatButtonVisible: false,
                decoration: BoxDecoration(
                  color: Color(0xFFFC5376),
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
                    color: Colors.grey),
                weekendStyle: TextStyle(
                    fontSize: 14.0,
                    height: 2,
                    fontWeight: FontWeight.bold,
                    color: Colors.grey),
              ),
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
          // TextButton(
          //   onPressed: () => errorHandler(),
          //   child: Text('alert popup'),
          // )
          AnimatedContainer(
            margin: EdgeInsets.fromLTRB(0, 10, 0, 0),
            height: count ? 200 : 0,
            width: 350,
            duration: Duration(milliseconds: 400),
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
