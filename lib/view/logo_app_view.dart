import 'package:flutter/material.dart';
import 'package:flutter_moto_gp/view_model/logo_app_view_model.dart';
import 'package:flutter_moto_gp/widgets/common/image_extention.dart';
import 'package:get/get.dart';

class LogoAppView extends StatefulWidget {
  const LogoAppView({super.key});

  @override
  State<LogoAppView> createState() => _LogoAppViewState();
}

class _LogoAppViewState extends State<LogoAppView> {
  final controller = Get.put(LogoAppViewModel());

  @override
  void initState() {
    super.initState();
    controller.loadView();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Image.asset(
          ImageAssest.loadLogoApp,
          height: 200,
        ),
      ),
    );
  }
}
