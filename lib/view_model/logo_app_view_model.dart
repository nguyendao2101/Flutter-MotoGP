import 'package:get/get.dart';

import '../view/login_view.dart';

class LogoAppViewModel extends GetxController {
  void loadView() async {
    await Future.delayed(const Duration(seconds: 3));
    Get.to(() => const LoginView());
  }
}
