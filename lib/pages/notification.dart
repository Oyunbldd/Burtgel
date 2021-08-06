import 'package:flutter/material.dart';
class NotificationPage extends StatefulWidget {
  NotificationPage({Key? key}) : super(key: key);
  //api aas notification uudaa duudaj viewbuild eer haruulah
  @override
  _NotificationPageState createState() => _NotificationPageState();
}

class _NotificationPageState extends State<NotificationPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
       child: Text('Notification page'),
    );
  }
}