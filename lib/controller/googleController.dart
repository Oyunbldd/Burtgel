import 'dart:io';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import '../controller/apiController.dart';

class GoogleController extends GetxController {
  GoogleSignIn _googleSignIn = GoogleSignIn();
  final ApiController apiController = Get.put(ApiController());
  Future<dynamic> handleSignIn() async {
    try {
      await _googleSignIn
          .signIn()
          .then((data) => apiController.checkUser(data));
    } catch (err) {
      print(err);
    }
  }
}
