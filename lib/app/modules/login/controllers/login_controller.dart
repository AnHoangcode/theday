import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:theday/app/routes/app_pages.dart';

class LoginController extends GetxController {
  //TODO: Implement LoginController

  TextEditingController emailController = TextEditingController(text: '');
  TextEditingController passwordController = TextEditingController(text: '');

  Rx<String> emailError = ''.obs;
  Rx<String> passwordError = ''.obs;

  final isLoading = false.obs;
  final visiblePassword = false.obs;
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

  void validationEmail() {
    if (emailController.text.trim().isEmpty) {
      emailError.value = 'Email can not blank';
      return;
    }
    if (!emailController.text.trim().isEmail) {
      emailError.value = 'Email wrong format';
      return;
    }
    emailError.value = '';
  }

  void validationPassword() {
    if (passwordController.text.trim().isEmpty) {
      passwordError.value = 'Password can not blank';
      return;
    }
    passwordError.value = '';
  }

  Future<void> login() async {
    Get.toNamed(Routes.HOME);
  }
}
