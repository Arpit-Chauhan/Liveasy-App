
import 'package:get/get.dart';

import '../../../utils/selectionPopup.dart';

class WelcomeModel {
  Rx<List<SelectionPopupModel>> dropdownItemList = Rx([
    SelectionPopupModel(
      id: 1,
      title: "English",
      isSelected: true,
    ),
    SelectionPopupModel(
      id: 2,
      title: "Hindi",
    ),
  ]);
}
