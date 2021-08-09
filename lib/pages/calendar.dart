import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

class Calendar extends StatefulWidget {
  @override
  _CalendarState createState() => _CalendarState();
}

class _CalendarState extends State<Calendar> {
  CalendarFormat format = CalendarFormat.month;
  DateTime selectedDay = DateTime.now();
  DateTime focusedDay = DateTime.now();
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Container(
            child: Text('Ta udruu songono uu '),
            margin: EdgeInsets.fromLTRB(0.0, 15.0, 0.0, 0.0),
          ),
          Container(
            width: 300.0,
            child: TableCalendar(
              focusedDay: focusedDay,
              firstDay: DateTime(2021),
              lastDay: DateTime(2023),

              // calendarFormat: format,
              // onFormatChanged: (CalendarFormat _format) {
              //   setState(() {
              //     format = _format;
              //   });
              // },
              startingDayOfWeek: StartingDayOfWeek.monday,
              daysOfWeekVisible: true,
              onDaySelected: (DateTime selectDay, DateTime focusDay) {
                setState(() {
                  selectedDay = selectDay;
                  focusedDay = focusDay;
                });
              },
              calendarStyle: CalendarStyle(
                isTodayHighlighted: true,
                selectedDecoration: BoxDecoration(
                  color: Colors.blue,
                  shape: BoxShape.circle,
                ),
                weekendTextStyle: TextStyle(color: Colors.orangeAccent),
                selectedTextStyle: TextStyle(color: Colors.white),
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
          Container(
            child: Text('songolt'),
          )
        ],
      ),
    );
  }
}
