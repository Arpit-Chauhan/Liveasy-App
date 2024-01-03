import 'package:get/get.dart';
import 'package:liveasy/screens/select_profile/models/select_item.dart';

import '../../../utils/image_constants.dart';

class SelectProfileModel {
  Rx<List<UserprofilesectionItemModel>> userprofilesectionItemList = Rx([
    UserprofilesectionItemModel(
        shipperImage: ImageConstant.imgHome.obs,
        shipperText: "Shipper".obs,
        loremText: "Lorem ipsum dolor sit amet, \nconsectetur adipiscing".obs),
    UserprofilesectionItemModel(
        shipperImage: ImageConstant.imgCar.obs,
        shipperText: "Transporter".obs,
        loremText: "Lorem ipsum dolor sit amet, \nconsectetur adipiscing".obs)
  ]);
}
