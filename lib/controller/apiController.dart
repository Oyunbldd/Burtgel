import 'dart:io';

import 'package:get/get.dart';
import 'package:dio/dio.dart';
import '../controller/idController.dart';

class ApiController extends GetxController {
  var dio = Dio();
  final IdController idController = Get.put(IdController());
  Future<dynamic> checkUser(data) async => dio.post(
        "http://localhost:8001/api/v1/users/?gmail=${data.email}",
        options: Options(
            headers: {HttpHeaders.contentTypeHeader: "application/json"}),
        data: {
          'displayName': data.displayName,
          'id': data.id,
          'gmail': data.email,
          'photoUrl': data.photoUrl
        },
      ).then((value) => {
            data = value.data['data'][0]['_id'],
            idController.increment(data),
            print(data)
          });
}
