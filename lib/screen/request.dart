import 'package:flutter/material.dart';

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
          width: 350,
          height: double.infinity,
          child: Row(
            children: [
              Text('${args[1]}-ны '),
              Container(
                  width: 80,
                  height: 60,
                  child: TextFormField(
                      controller: inputController,
                      decoration: InputDecoration(
                        hintText: "09:00",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                          borderSide: BorderSide(color: Colors.blue),
                        ),
                        disabledBorder: InputBorder.none,
                        focusedBorder: OutlineInputBorder(
                          borderSide:
                              const BorderSide(color: Colors.blue, width: 2.0),
                        ),
                      ))),
            ],
          ),
        ),
      ),
    );
  }
}
