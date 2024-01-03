import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:liveasy/screens/select_profile/controller/select_profile_controller.dart';
import 'package:liveasy/widgets/custom_elevated_button.dart';

import '../../utils/image_constants.dart';
import '../../utils/scaling.dart';
import '../../widgets/custom_image_view.dart';
import 'models/select_item.dart';
import 'widgets/select_item_model.dart';

// ignore_for_file: must_be_immutable
class SelectProfileScreen extends GetWidget<SelectProfileController> {
  const SelectProfileScreen({Key? key})
      : super(
          key: key,
        );

  @override
  Widget build(BuildContext context) {
    Scaling scale = Scaling(context: context)..setCurrentDeviceSize();
    return SafeArea(
      child: Scaffold(
        body: Container(
          width: double.maxFinite,
          padding: EdgeInsets.all(16),
          child: Column(
            children: [
              CustomImageView(
                imagePath: ImageConstant.imgArrowDown,
                height: scale.getScaledHeight(24),
                width: scale.getScaledWidth(24),
                alignment: Alignment.centerLeft,
              ),
              SizedBox(height: scale.getScaledHeight(48)),
              Text(
                "Please select your profile".tr,
                 style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w700,
                  fontSize: 20,
                  letterSpacing: 0.07,
                ),
              ),
              SizedBox(height: scale.getScaledHeight(24)),
              _buildUserProfileSection(),
              SizedBox(height:scale.getScaledHeight(24)),
              CustomElevatedButton(
                text: "CONTINUE".tr,
              ),
              SizedBox(height: scale.getScaledHeight(24)),
            ],
          ),
        ),
      ),
    );
  }

  /// Section Widget
  Widget _buildUserProfileSection() {
    return Obx(
      () => ListView.separated(
        physics: NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        separatorBuilder: (
          context,
          index,
        ) {
          return SizedBox(
            height: 24,
          );
        },
        itemCount: controller.selectProfileModelObj.value.userprofilesectionItemList.value.length,
        itemBuilder: (context, index) {
          UserprofilesectionItemModel model = controller.selectProfileModelObj.value.userprofilesectionItemList.value[index];
          return UserprofilesectionItemWidget(
            model,
          );
        },
      ),
    );
  }
}
