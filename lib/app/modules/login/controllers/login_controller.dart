import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:theday/app/common/base_common.dart';
import 'package:theday/app/modules/login/service/auth_service.dart';
import 'package:theday/app/resource/util_common.dart';
import 'package:theday/app/routes/app_pages.dart';

class LoginController extends GetxController {
  //TODO: Implement LoginController

  TextEditingController emailController = TextEditingController(text: '');
  TextEditingController passwordController = TextEditingController(text: '');

  Rx<String> emailError = ''.obs;
  Rx<String> passwordError = ''.obs;

  final isLoading = false.obs;
  final isLockButton = false.obs;

  final visiblePassword = false.obs;
  AuthService service = AuthService();
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
      emailError.value = 'Email không được để rỗng';
      return;
    }
    if (!emailController.text.trim().isEmail) {
      emailError.value = 'Email sai định dạng';
      return;
    }
    emailError.value = '';
  }

  void validationPassword() {
    if (passwordController.text.trim().isEmpty) {
      passwordError.value = 'Mật khẩu không được để trống';
      return;
    }
    passwordError.value = '';
  }

  Future<void> login() async {
    validationEmail();
    validationPassword();
    if (passwordError.isEmpty && emailError.isEmpty && !isLockButton.value) {
      isLockButton(true);
      service
          .loginWithEmailPassword(
              email: emailController.text, password: passwordController.text)
          .then((account) {
        BaseCommon.instance.saveAccount(account: account);
        Get.toNamed(Routes.HOME);
      }).catchError((error) {
        isLockButton(false);
        log('$error');
        UtilCommon.snackBar(text: '$error', isFail: true);
      });
    }
  }
}
