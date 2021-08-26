import 'package:flutter/material.dart';
import '../pages/timeChoose.dart';

class SendRequest extends StatefulWidget {
  @override
  _SendRequestState createState() => _SendRequestState();
}

final inputController = TextEditingController();

class _SendRequestState extends State<SendRequest> {
  @override
  Widget build(BuildContext context) {
    dynamic args = ModalRoute.of(context)!.settings.arguments;
    final inputController = TextEditingController();
    String dropdownValue = '09:00';
    print(args[0]);
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            args[0],
            style: TextStyle(color: Colors.black, fontSize: 15),
          ),
          centerTitle: true,
          backgroundColor: Colors.white,
          iconTheme: IconThemeData(color: Colors.blue),
          elevation: 0,
        ),
        body: Container(
          margin: EdgeInsets.fromLTRB(0, 10, 0, 0),
          height: double.infinity,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              args[0] != 'Чөлөө авах / Өдрөөр'
                  ? Row(
                      children: [
                        Text('${args[1]}-ны '),
                        SizedBox(
                          width: 5,
                        ),
                        timeChoose(),
                        SizedBox(
                          width: 5,
                        ),
                        Text('цагаас '),
                        SizedBox(
                          width: 5,
                        ),
                        timeChoose(),
                        SizedBox(
                          width: 5,
                        ),
                        Text('хүртэл'),
                      ],
                    )
                  : Text('data'),
            ],
          ),
        ),
      ),
    );
  }
}
