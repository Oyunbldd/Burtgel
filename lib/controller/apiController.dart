import 'dart:io';

import 'package:get/get.dart';
import 'package:dio/dio.dart';
import '../controller/idController.dart';

class ApiController extends GetxController {
  var dio = Dio();
  final IdController id = Get.put(IdController());
  Future<dynamic> checkUser(data) async => dio.post(
        "http://localhost:8000/api/v1/users/?gmail=${data.email}",
        options: Options(
            headers: {HttpHeaders.contentTypeHeader: "application/json"}),
        data: {
          'displayName': data.displayName,
          'id': data.id,
          'gmail': data.email,
          'photoUrl': data.photoUrl
        },
      ).then((value) => {
            data = value.data['data']['_id'],
            id.increment(data),
          });
  Future<dynamic> getData() async =>
      dio.get("http://localhost:8000/api/v1/user/${id.id}");
}
