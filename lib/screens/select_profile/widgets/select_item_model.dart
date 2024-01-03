import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:liveasy/screens/select_profile/controller/select_profile_controller.dart';
import 'package:liveasy/utils/scaling.dart';

import '../../../widgets/custom_image_view.dart';
import '../models/select_item.dart';

// ignore: must_be_immutable
class UserprofilesectionItemWidget extends StatelessWidget {
  UserprofilesectionItemWidget(
    this.userprofilesectionItemModelObj, {
    Key? key,
  }) : super(
          key: key,
        );

  UserprofilesectionItemModel userprofilesectionItemModelObj;

  var controller = Get.find<SelectProfileController>();

  @override
  Widget build(BuildContext context) {
    Scaling scale = Scaling(context: context)..setCurrentDeviceSize();
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: scale.getScaledWidth(5),
        vertical: scale.getScaledHeight(6),
      ),
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.black,
          width: 1,
        ),
      ),
      child: Obx(()=>RadioListTile(
        selected: true,
        activeColor: Color(0xFF2E3B62),
        value: userprofilesectionItemModelObj.shipperText!.value,
        groupValue: controller.selectedValue.value,
        contentPadding: EdgeInsets.zero,
        controlAffinity: ListTileControlAffinity.leading,
        onChanged: (newValue) {
          controller.selectedValue.value = newValue.toString();          
        },
        title: Row(
          children: [
            Obx(
              () => CustomImageView(
                imagePath: userprofilesectionItemModelObj.shipperImage!.value,
                height: 40,
                width: 40,
                margin: EdgeInsets.only(
                  top: 10,
                  bottom: 11,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                left: 16,
                top: 3,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Obx(
                    () => Text(
                      userprofilesectionItemModelObj.shipperText!.value,
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w400,
                        color: Color(0xFF2F3037),
                        letterSpacing: 0.07,
                      ),
                    ),
                  ),
                  SizedBox(height: scale.getScaledHeight(4)),
                  SizedBox(
                    width: scale.getScaledWidth(150),
                    child: Obx(
                      () => Text(
                        userprofilesectionItemModelObj.loremText!.value,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                          color: Color(0xFF6A6C7B),
                          letterSpacing: 0.07,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),),
    );
    // return Container(
    //   padding: EdgeInsets.symmetric(
    //     horizontal: scale.getScaledWidth(15),
    //     vertical: scale.getScaledHeight(12),
    //   ),
    //   decoration: BoxDecoration(
    //     border: Border.all(
    //       color: Colors.black,
    //       width: 1,
    //     ),
    //   ),
    //   child: Row(
    //     children: [
    //       Container(
    //         height: scale.getScaledHeight(24),
    //         width: scale.getScaledWidth(24),
    //         margin: EdgeInsets.only(
    //           top: 18,
    //           bottom: 19,
    //         ),
    //         decoration: BoxDecoration(
    //           borderRadius: BorderRadius.circular(
    //             12,
    //           ),
    //           border: Border.all(
    //             color: Colors.black,
    //             width: 1,
    //           ),
    //         ),
    //       ),
    //       Obx(
    //         () => CustomImageView(
    //           imagePath: userprofilesectionItemModelObj.shipperImage!.value,
    //           height: 40,
    //           width: 40,
    //           margin: EdgeInsets.only(
    //             left: 16,
    //             top: 10,
    //             bottom: 11,
    //           ),
    //         ),
    //       ),
    //       Padding(
    //         padding: EdgeInsets.only(
    //           left: 16,
    //           top: 3,
    //         ),
    //         child: Column(
    //           crossAxisAlignment: CrossAxisAlignment.start,
    //           children: [
    //             Obx(
    //               () => Text(
    //                 userprofilesectionItemModelObj.shipperText!.value,
    //                 style: TextStyle(
    //                   fontSize: 18,
    //                   fontWeight: FontWeight.w400,
    //                   color: Color(0xFF2F3037),
    //                   letterSpacing: 0.07,
    //                 ),
    //               ),
    //             ),
    //             SizedBox(height: scale.getScaledHeight(4)),
    //             SizedBox(
    //               width: scale.getScaledWidth(150),
    //               child: Obx(
    //                 () => Text(userprofilesectionItemModelObj.loremText!.value,
    //                     maxLines: 2,
    //                     overflow: TextOverflow.ellipsis,
    //                     style: TextStyle(
    //                       fontSize: 12,
    //                       fontWeight: FontWeight.w400,
    //                       color: Color(0xFF6A6C7B),
    //                       letterSpacing: 0.07,
    //                     )),
    //               ),
    //             ),
    //           ],
    //         ),
    //       ),
    //     ],
    //   ),
    // );
  }
}
