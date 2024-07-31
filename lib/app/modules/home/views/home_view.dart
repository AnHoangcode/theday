import 'package:flutter/material.dart';
import 'package:curved_labeled_navigation_bar/curved_navigation_bar.dart';
import 'package:curved_labeled_navigation_bar/curved_navigation_bar_item.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:theday/app/resource/base_define.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: ColorManager.primaryColor,
        bottomNavigationBar: Obx(() => CurvedNavigationBar(
              animationCurve: Easing.legacy,
              backgroundColor: Colors.transparent,
              color: ColorManager.secondaryColor,
              // buttonBackgroundColor: Colors.amber,
              items: [
                CurvedNavigationBarItem(
                  labelStyle: GoogleFonts.roboto(
                      color: Colors.white, fontWeight: FontWeight.bold),
                  child: Icon(
                    Icons.home_outlined,
                    color: Colors.white,
                  ),
                  label: controller.index.value == 0 ? 'Trang chủ' : '',
                ),
                CurvedNavigationBarItem(
                  child: Icon(
                    Icons.perm_identity,
                    color: Colors.white,
                  ),
                  labelStyle: TextStyle(color: Colors.white),
                  label: controller.index.value == 1 ? 'Tài khoản' : '',
                ),
              ],
              onTap: (index) {
                controller.index.value = index;
              },
            )),
        body: SafeArea(
            child: Obx(() => controller.listScreen[controller.index.value])));
  }
}
