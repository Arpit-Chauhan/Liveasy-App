import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:liveasy/routes/app_routes.dart';
import 'package:liveasy/screens/verify_otp/controller/verify_otp_controller.dart';
import 'package:liveasy/utils/scaling.dart';

import '../../utils/image_constants.dart';
import '../../widgets/custom_elevated_button.dart';
import '../../widgets/custom_image_view.dart';
import '../../widgets/custom_otp_field.dart';

// ignore_for_file: must_be_immutable
class VerifyOtpScreen extends GetWidget<VerifyOtpController> {
  VerifyOtpScreen({Key? key})
      : super(
          key: key,
        );

  final FirebaseAuth auth = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    Scaling scale = Scaling(context: context)..setCurrentDeviceSize();
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: _buildAppBar(),
        body: Container(
          width: double.maxFinite,
          padding: EdgeInsets.symmetric(
            horizontal: scale.getScaledWidth(10),
            vertical: scale.getScaledHeight(48),
          ),
          child: Column(
            children: [
              Text(
                "Verify Phone".tr,
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w700,
                  fontSize: 20,
                  letterSpacing: 0.07,
                ),
              ),
              SizedBox(height: scale.getScaledHeight(5)),
              Text("Code is sent to ${controller.phone}".tr,
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    color: Color(0xFF6A6C7B),
                    letterSpacing: 0.07,
                  )),
              SizedBox(height: scale.getScaledHeight(23)),
              Padding(
                padding: EdgeInsets.only(left: 1),
                child: CustomOtpTextField(
                  context: Get.context!,
                  controller: controller.otpController,
                  onChanged: (value) {
                    controller.otpController.text = value;
                    print(controller.otpController.text);
                  },
                ),
                // ),
              ),
              SizedBox(height: scale.getScaledHeight(16)),
              RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                        text: "Didn't receive the code? ".tr,
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          color: Color(0xFF6A6C7B),
                          letterSpacing: 0.07,
                        )),
                    TextSpan(
                        text: "Request Again".tr,
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          color: Color.fromRGBO(6, 29, 40, 1),
                          letterSpacing: 0.07,
                        )),
                  ],
                ),
                textAlign: TextAlign.left,
              ),
              SizedBox(height: scale.getScaledHeight(25)),
              CustomElevatedButton(
                text: "VERIFY AND CONTINUE".tr,
                margin: EdgeInsets.symmetric(
                  horizontal: scale.getScaledHeight(6),
                ),
                onPressed: () async {
                  print(controller.otpController.text);
                  try {
                    // Create a PhoneAuthCredential with the code
                    PhoneAuthCredential credential =
                        PhoneAuthProvider.credential(verificationId: controller.verifyId, smsCode: controller.otpController.text);

                    // Sign the user in (or link) with the credential
                    await auth.signInWithCredential(credential);
                    Get.offNamed(AppRoutes.selectProfileScreen);
                  } catch (e) {
                    Get.snackbar('Error', 'Invalid OTP');
                  }
                },
              ),
              SizedBox(height: scale.getScaledHeight(5)),
            ],
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
          height: 24,
          width: 24,
          imagePath: ImageConstant.imgCombinedShape,
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
