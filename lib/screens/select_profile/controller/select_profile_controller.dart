import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:liveasy/screens/select_profile/models/select_profile_model.dart';

class SelectProfileController extends GetxController {
  Rx<SelectProfileModel> selectProfileModelObj = SelectProfileModel().obs;
  RxString selectedValue = 'Shipper'.obs;

  @override
  void onClose() {
    super.onClose();
  }

  @override
  void onReady() {
    super.onReady();
  }
}
