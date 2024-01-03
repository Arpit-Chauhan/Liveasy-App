import 'package:country_pickers/country.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:liveasy/utils/scaling.dart';

import '../../routes/app_routes.dart';
import '../../utils/image_constants.dart';
import '../../widgets/custom_elevated_button.dart';
import '../../widgets/custom_image_view.dart';
import '../../widgets/custom_phone_number.dart';
import 'controller/mobile_number_controller.dart';

// ignore_for_file: must_be_immutable
class MobileNumberScreen extends GetWidget<MobileNumberController> {
  MobileNumberScreen({Key? key}) : super(key: key);

  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    Scaling scale = Scaling(context: context)..setCurrentDeviceSize();
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: _buildAppBar(),
        body: Form(
          key: _formKey,
          child: SingleChildScrollView(
            padding: EdgeInsets.only(top: 48),
            child: Column(
              children: [
                Text(
                  "Please enter your mobile number".tr,
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w700,
                    fontSize: 20,
                    letterSpacing: 0.07,
                  ),
                  // style: theme.textTheme.titleLarge,
                ),
                SizedBox(height: scale.getScaledHeight(8)),
                SizedBox(
                  width: scale.getScaledWidth(171),
                  child: Text(
                    "You’ll receive a 4 digit code\nto verify next.".tr,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      color: Color(0xFF6A6C7B),
                      letterSpacing: 0.07,
                    ),
                  ),
                ),
                SizedBox(height: scale.getScaledHeight(32)),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16),
                  child: Obx(
                    () => CustomPhoneNumber(
                      country: controller.selectedCountry.value,
                      controller: controller.phoneNumberController,
                      onTap: (Country value) {
                        controller.selectedCountry.value = value;
                      },
                    ),
                  ),
                ),
                SizedBox(height: scale.getScaledHeight(24)),
                CustomElevatedButton(
                  text: "CONTINUE".tr,
                  margin: EdgeInsets.symmetric(horizontal: 16),
                  onPressed: () async {
                    // print('+${controller.selectedCountry.value.phoneCode + controller.phoneNumberController.value.text}');
                    try {
                      await FirebaseAuth.instance.verifyPhoneNumber(
                        phoneNumber: '+${controller.selectedCountry.value.phoneCode + controller.phoneNumberController.value.text}',
                        verificationCompleted: (PhoneAuthCredential credential) {},
                        verificationFailed: (FirebaseAuthException e) {
                          Get.snackbar('Error', 'Invalid Number');
                        },
                        codeSent: (String verificationId, int? resendToken) {
                          Get.toNamed(AppRoutes.verifyOtpScreen, arguments: [verificationId,controller.phoneNumberController.value.text]);
                        },
                        codeAutoRetrievalTimeout: (String verificationId) {},
                      );
                    } catch (e) {
                      Get.snackbar('Error', 'Invalid Number');
                    }
                  },
                ),
                SizedBox(height: scale.getScaledHeight(257)),
                CustomImageView(
                  imagePath: ImageConstant.imgGroup3Errorcontainer,
                  height: scale.getScaledHeight(216),
                  width: scale.getScaledWidth(360),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  /// Section Widget
  PreferredSizeWidget _buildAppBar() {
    return AppBar(
      forceMaterialTransparency: true,
      leadingWidth: 40,
      leading: CustomImageView(
          imagePath: ImageConstant.imgClose,
          margin: EdgeInsets.only(left: 16, top: 16, bottom: 17),
          color: Color.fromRGBO(47, 48, 55, 1),
          onTap: () {
            onTapClose();
          }),
    );
  }

  /// Navigates to the previous screen.
  onTapClose() {
    Get.back();
  }
}
