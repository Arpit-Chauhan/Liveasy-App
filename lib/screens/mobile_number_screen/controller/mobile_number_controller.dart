import 'package:country_pickers/country.dart';
import 'package:country_pickers/country_pickers.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:liveasy/screens/mobile_number_screen/models/mobile_number_model.dart';

class MobileNumberController extends GetxController {
  TextEditingController phoneNumberController = TextEditingController();

  Rx<MobileNumberModel> mobileNumberModelObj = MobileNumberModel().obs;

  Rx<Country> selectedCountry =
      CountryPickerUtils.getCountryByPhoneCode('91').obs;

  @override
  void onClose() {
    super.onClose();
    phoneNumberController.dispose();
  }
}
