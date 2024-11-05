import 'package:flutter_moto_gp/view/main_screen_user_view.dart';
import 'package:get/get.dart';

import '../view/login_view.dart';

class LogoAppViewModel extends GetxController {
  void loadView() async {
    await Future.delayed(const Duration(seconds: 3));
    // Get.to(() => const LoginView());
    Get.to(() => const MainScreenUserView(initialIndex: 0));
    
  }
  
}
