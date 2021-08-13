import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:table_calendar/table_calendar.dart';

class Calendar extends StatefulWidget {
  @override
  _CalendarState createState() => _CalendarState();
}

class _CalendarState extends State<Calendar> {
  CalendarFormat format = CalendarFormat.month;
  DateTime selectedDay = DateTime.now();
  DateTime focusedDay = DateTime.now();
  String formattedDate = DateFormat('yyyy-MM-dd').format(DateTime.now());
  int count = 1;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 400.0,
      child: Column(
        children: [
          count == 1
              ? Container(
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
                )
              : SizedBox(
                  height: 10,
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
                  count++;
                });
              },
              calendarStyle: CalendarStyle(
                isTodayHighlighted: true,
                selectedDecoration: BoxDecoration(
                  color: count == 1 ? Colors.white : Colors.blue,
                  shape: BoxShape.circle,
                ),
                todayDecoration: BoxDecoration(
                  color: Colors.white,
                ),
                todayTextStyle: TextStyle(color: Colors.black),
                weekendTextStyle: TextStyle(color: Colors.orangeAccent),
                selectedTextStyle:
                    TextStyle(color: count == 1 ? Colors.black : Colors.white),
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
          count != 1
              ? Container(
                  width: 350,
                  height: 45,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [Text('data'), Text('dqwdqwd')],
                  ),
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.blueAccent)),
                )
              : SizedBox(),
          SizedBox(
            height: 30.0,
          ),
          count != 1
              ? Container(
                  width: 350,
                  height: 45,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [Text('data'), Text('dqwdqwd')],
                  ),
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.blueAccent)),
                )
              : SizedBox(),
        ],
      ),
    );
  }
}
