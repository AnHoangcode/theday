import 'dart:convert';
import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:theday/app/common/base_common.dart';
import 'package:theday/app/modules/login/service/auth_service.dart';
import 'package:theday/app/resource/util_common.dart';
import 'package:theday/app/routes/app_pages.dart';

class LoginController extends GetxController {
  //TODO: Implement LoginController

  TextEditingController emailController =
      TextEditingController(text: 'lyhieuduy9190@gmail.com');
  TextEditingController passwordController =
      TextEditingController(text: '123456789');

  Rx<String> emailError = ''.obs;
  Rx<String> passwordError = ''.obs;

  final isLoading = false.obs;
  final isLockButton = false.obs;

  final visiblePassword = false.obs;
  AuthService service = AuthService();

  GoogleSignIn _googleSignIn = GoogleSignIn(scopes: <String>[
    'email',
    'https://www.googleapis.com/auth/contacts.readonly',
  ]);
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
      // Get.toNamed(Routes.HOME);
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

  Future<void> handleSignIn() async {
    try {
      GoogleSignInAccount? account = await _googleSignIn.signIn();
      if (account != null) {
        account.authentication.then((googleAuth) async {
          final credential = GoogleAuthProvider.credential(
            accessToken: googleAuth.accessToken,
            idToken: googleAuth.idToken,
          );
          await FirebaseAuth.instance.signInWithCredential(credential);
          User? user = FirebaseAuth.instance.currentUser;
          if (user != null) {
            // Lấy token Bearer
            String? token = await user.getIdToken();
            log('hihi: ${token}');
            service
                .loginWithGoogle(
                    token: token!,
                  )
                .then((account) {
              BaseCommon.instance.saveAccount(account: account);
              Get.toNamed(Routes.HOME);
            }).catchError((error) {
              isLockButton(false);
              log('$error');
              UtilCommon.snackBar(text: '$error', isFail: true);
            });
          }
        });
      }
    } catch (error) {
      print('lỗi $error');
    }
  }
}
