import 'package:flutter/material.dart';
import '../../pages/timeChoose.dart';
import '../../pages/checkbox.dart';
import '../../controller/apiController.dart';
import 'package:get/get.dart';
class Request1a extends StatefulWidget {
  final dynamic selectedDay;

  Request1a({required this.selectedDay});

  @override
  _Request1aState createState() => _Request1aState();
}

class _Request1aState extends State<Request1a> {
  final inputController = TextEditingController();
  final ApiController apiController = Get.put(ApiController());
  late String whichone = "";
  List<String> _texts = [
    "Ар гэрийн гачигдал ",
    "Эрүүл мэндийн шалтгаан ",
    "Зайлшгүй шаардлага ",
    "Бусад",
  ];
 List<String> data=[];

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('${widget.selectedDay}-ны '),
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
          ),
          Container(
            height: 250,
            child: ListView(
              padding: EdgeInsets.all(5.0),
              children: _texts
                  .map((text) => CheckboxListTile(
                        controlAffinity: ListTileControlAffinity.platform,
                        // controlAffinity: ListTileControlAffinity.leading,
                        title: Text(
                          text,
                          style: TextStyle(fontSize: 12),
                        ),
                        value: whichone == text ? true : false,
                        onChanged: (val) {
                          setState(() {
                            whichone == text ? whichone = "" : whichone = text;
                            print(whichone);
                          });
                        },
                      ))
                  .toList(),
            ),
          ),
          TextFormField(
            controller: inputController,
            decoration: InputDecoration(
              hintText: "Тайлбар",
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.0),
                borderSide: BorderSide(color: Colors.blue),
              ),
              disabledBorder: InputBorder.none,
              focusedBorder: OutlineInputBorder(
                borderSide:
                    const BorderSide(color: Colors.blueGrey, width: 2.0),
                borderRadius: BorderRadius.circular(10.0),
              ),
            ),
          ),
          TextButton(onPressed: () {
            data.addAll([whichone,inputController.text,widget.selectedDay]);
            apiController.request(data);
            Navigator.pushNamed(context, '/home');
          }, child: Text('Click me'))
        ],
      ),
    );
  }
}
