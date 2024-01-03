import 'package:get/get_rx/get_rx.dart';
import '../../../utils/image_constants.dart';

class UserprofilesectionItemModel {
  UserprofilesectionItemModel({
    this.shipperImage,
    this.shipperText,
    this.loremText,
    this.id,
  }) {
    shipperImage = shipperImage ?? Rx(ImageConstant.imgHome);
    shipperText = shipperText ?? Rx("Shipper");
    loremText =
        loremText ?? Rx("Lorem ipsum dolor sit amet, \nconsectetur adipiscing");
    id = id ?? Rx("");
  }

  Rx<String>? shipperImage;

  Rx<String>? shipperText;

  Rx<String>? loremText;

  Rx<String>? id;
}
