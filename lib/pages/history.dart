import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import '../controller/apiController.dart';
import 'package:get/get.dart';

class History extends StatefulWidget {
  History({Key? key}) : super(key: key);

  @override
  _HistoryState createState() => _HistoryState();
}

bool isLoading = false;
dynamic data;
final ApiController apiController = Get.put(ApiController());

class _HistoryState extends State<History> {
  @override
  void initState() {
    super.initState();
    setState(() {
      apiController.requestData().then((value) {
        data = value.data;
      });
    });
  }

  Widget build(BuildContext context) {
    return Container(
        width: double.infinity,
        padding: EdgeInsets.all(15),
        child: Expanded(
          child: ListView.builder(
            itemCount: data['data'].length,
            itemBuilder: (context, index) {
              return Container(
                height: 50,
                margin: EdgeInsets.symmetric(vertical: 5),
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        children: [
                          Text('Огноо : ${data['data'][index]['endpoint']}'),
                          Text('Төрөл :  ${data['data'][index]['type']}')
                        ],
                      ),
                      Text(
                        data['data'][index]['status'].toString(),
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            color: Colors.black),
                      ),
                    ]),
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.black,
                  ),
                  borderRadius: BorderRadius.circular(20),
                  color: Color(0xFFF4F5F4),
                ),
              );
            },
          ),
        ));
  }
}
