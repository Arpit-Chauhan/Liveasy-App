import 'package:get/get.dart';
import 'package:liveasy/screens/mobile_number_screen/binding/mobile_number_binding.dart';
import 'package:liveasy/screens/mobile_number_screen/mobile_number_screen.dart';
import 'package:liveasy/screens/select_profile/binding/select_profile_binding.dart';
import 'package:liveasy/screens/select_profile/select_profile_screen.dart';
import 'package:liveasy/screens/verify_otp/binding/verify_otp_binding.dart';
import 'package:liveasy/screens/verify_otp/verify_otp_screen.dart';
import 'package:liveasy/screens/welcome_screen/binding/welcomeScreen_binding.dart';

import '../screens/welcome_screen/welcome_screen.dart';

class AppRoutes {
  static const String welcomeScreen = '/welcome_screen';

  static const String mobileNumberScreen = '/mobile_number_screen';

  static const String verifyOtpScreen = '/verify_otp_screen';

  static const String selectProfileScreen = '/select_profile_screen';

  static const String initialRoute = '/initialRoute';

  static List<GetPage> pages = [
    GetPage(
      name: welcomeScreen,
      page: () => WelcomeScreen(),
      bindings: [
        WelcomeBinding(),
      ],
    ),
    GetPage(
      name: mobileNumberScreen,
      page: () => MobileNumberScreen(),
      bindings: [
        MobileNumberBinding(),
      ],
    ),
    GetPage(
      name: verifyOtpScreen,
      page: () => VerifyOtpScreen(),
      bindings: [
        VerifyOtpBinding(),
      ],
    ),
    GetPage(
      name: selectProfileScreen,
      page: () => SelectProfileScreen(),
      bindings: [
        SelectProfileBinding(),
      ],
    ),
    GetPage(
      name: initialRoute,
      page: () => WelcomeScreen(),
      bindings: [
        WelcomeBinding(),
      ],
    )
  ];
}
