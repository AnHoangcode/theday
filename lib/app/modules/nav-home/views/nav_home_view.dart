import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:theday/app/resource/text_style.dart';

import '../controllers/nav_home_controller.dart';

class NavHomeView extends GetView<NavHomeController> {
  const NavHomeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      child: TextConstant.subTile1(context, text: 'TabHome'),
    );
  }
}
