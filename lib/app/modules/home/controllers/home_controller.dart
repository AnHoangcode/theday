import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:theday/app/modules/nav-account/views/nav_account_view.dart';
import 'package:theday/app/modules/nav-home/views/nav_home_view.dart';

class HomeController extends GetxController {
  final index = 0.obs;
  List<Widget> listScreen = [
    NavHomeView(),
    NavAccountView(),
  ];
  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void increment() => index.value++;
}

