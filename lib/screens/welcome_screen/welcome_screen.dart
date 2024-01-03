import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:liveasy/routes/app_routes.dart';
import 'package:liveasy/utils/scaling.dart';

import '../../utils/image_constants.dart';
import '../../widgets/custom_drop_down.dart';
import '../../widgets/custom_elevated_button.dart';
import '../../widgets/custom_image_view.dart';
import 'controller/welcomeScreen_controller.dart';

// ignore_for_file: must_be_immutable
class WelcomeScreen extends GetWidget<WelcomeController> {
  const WelcomeScreen({Key? key})
      : super(
          key: key,
        );

  @override
  Widget build(BuildContext context) {
    Scaling scale = Scaling(context: context)..setCurrentDeviceSize();
    return SafeArea(
      child: Scaffold(
        body: SizedBox(
          width: double.maxFinite,
          child: Column(
            children: [
              SizedBox(height: scale.getScaledHeight(48)),
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      SizedBox(height: scale.getScaledHeight(104)),
                      CustomImageView(
                        imagePath: ImageConstant.imgInbox,
                        height: scale.getScaledHeight(56),
                        width: scale.getScaledWidth(56),
                      ),
                      SizedBox(height: scale.getScaledHeight(32)),
                      Text(
                        "Please select your Language".tr,
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w700,
                          fontSize: 20,
                          letterSpacing: 0.07,
                        ),
                        //style: theme.textTheme.titleLarge,
                      ),
                      SizedBox(height: scale.getScaledHeight(8)),
                      SizedBox(
                        width: scale.getScaledWidth(185),
                        child: Text(
                          "You can change the language\nat any time.".tr,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize : 14,
                            fontWeight : FontWeight.w400,
                            color : Color(0xFF6A6C7B),
                            letterSpacing : 0.07,
                          ),
                        ),
                      ),
                      SizedBox(height: scale.getScaledHeight(24)),
                      CustomDropDown(
                        width: scale.getScaledWidth(216),
                        icon: Container(
                          margin: EdgeInsets.fromLTRB(1, 1, 8, 1),
                          child: CustomImageView(
                            imagePath: ImageConstant.imgDropdownarrow,
                            color: Color.fromRGBO(156, 156, 156, 1),
                            height: scale.getScaledHeight(12), //12
                            width: scale.getScaledWidth(12), //12
                          ),
                        ),
                        hintText: "English".tr,
                        items: controller.welcomeModel.value.dropdownItemList!.value,
                        onChanged: (value) {
                          controller.onSelected(value);
                        },
                      ),
                      SizedBox(height: scale.getScaledHeight(24)),
                      CustomElevatedButton(
                        height: scale.getScaledHeight(48),
                        width: scale.getScaledWidth(216),
                        text: "NEXT".tr,
                        onPressed: () =>Get.toNamed(AppRoutes.mobileNumberScreen),
                        ),
                      SizedBox(height: scale.getScaledHeight(103)),
                      CustomImageView(
                        imagePath: ImageConstant.imgGroup3,
                        height: scale.getScaledHeight(216),
                        width: scale.getScaledWidth(360),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
