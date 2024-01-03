
import 'package:get/get.dart';

import '../../../utils/selectionPopup.dart';
import '../models/welcomeScreen_model.dart';

class WelcomeController extends GetxController {
  Rx<WelcomeModel> welcomeModel = WelcomeModel().obs;

  SelectionPopupModel? selectedDropDownValue;

  onSelected(dynamic value) {
    for (var element in welcomeModel.value.dropdownItemList.value) {
      element.isSelected = false;
      if (element.id == value.id) {
        element.isSelected = true;
      }
    }
    welcomeModel.value.dropdownItemList.refresh();
  }
}
