import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:liveasy/screens/verify_otp/models/verify_otp_model.dart';

class VerifyOtpController extends GetxController {
  TextEditingController otpController = TextEditingController();

  Rx<VerifyOtpModel> verifyOtpModelObj = VerifyOtpModel().obs;
  late String verifyId="";
  late String phone="";

  @override
  void onClose() {
    super.onClose();
  }

  @override
  void onReady() {
    if (Get.arguments != null) {
      verifyId = Get.arguments[0];
      phone = Get.arguments[1];
      print('ID: - $verifyId');
    }
    super.onReady();
  }
}
