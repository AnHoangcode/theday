import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import 'package:get/get.dart';
import 'package:theday/app/resource/base_define.dart';
import 'package:theday/app/resource/logo_app.dart';
import 'package:theday/app/resource/reponsive_utils.dart';
import 'package:theday/app/resource/text_style.dart';

import '../controllers/welcome_controller.dart';

class WelcomeView extends GetView<WelcomeController> {
  const WelcomeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    Get.find<WelcomeController>();
    return Scaffold(
      backgroundColor: ColorManager.primaryColor,
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
            colors: [
              Colors.tealAccent.shade100.withOpacity(0.5),
              Colors.white,
              ColorManager.primaryColor
            ],
          ),
        ),
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(
                  height: UtilsReponsive.height(150, context),
                  width: UtilsReponsive.height(150, context),
                  child: const LogoApp()),
              TextConstant.textH2(context, text: 'THE DAY'),
              SizedBox(
                height: UtilsReponsive.height(50, context),
                width: UtilsReponsive.height(50, context),
                child: SpinKitFadingCircle(
                  color: Colors.tealAccent.shade100.withOpacity(0.5),
                  size: 50.0,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
