import 'package:flutter/material.dart';
import 'package:theday/app/resource/base_define.dart';
import 'package:theday/app/resource/reponsive_utils.dart';

class LogoApp extends StatelessWidget {
  const LogoApp({
    super.key,
  });


  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(UtilsReponsive.height(10, context)),
      decoration: BoxDecoration(
        color: ColorManager.primaryColor,
        shape: BoxShape.circle,
      ),
      child: Image.asset('assets/logo_milk.png', fit: BoxFit.contain,));
  }
}