import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:theday/app/common/base_common.dart';
import 'package:theday/app/common/model/personal_info_supplier.dart';
import 'package:theday/app/modules/login/service/auth_service.dart';

class PersonalSupplierController extends GetxController {
  //TODO: Implement PersonalSupplierController

  final isLoading = false.obs;
  final isEnableUpdate = false.obs;
  final isUploading = false.obs;

  AuthService service = AuthService();
  Rx<PersonalInforSupplier> personalData = PersonalInforSupplier().obs;
  TextEditingController nameController = TextEditingController(text: '');
  TextEditingController emailController = TextEditingController(text: '');
  TextEditingController phoneController = TextEditingController(text: '');
  
  @override
  void onInit() {
    super.onInit();
    initData();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void initData() {
    isLoading.value = true;
    service
        .getPersonalInfoSupplier(
            userId: BaseCommon.instance.accountSession!.userId!)
        .then((value) {
      personalData.value = value;
      prepareDataUI();

      isLoading.value = false;
    }).catchError((error) async {
      isLoading.value = false;
      log('$error');
    });
  }

  prepareDataUI() {
    nameController.text = personalData.value.supplierName ?? '';
    emailController.text = personalData.value.contactEmail ?? '';
    phoneController.text = personalData.value.contactPhone ?? '';
  }

  cancelUpdate() {
    isEnableUpdate.value = false;
    prepareDataUI();
  }

  updateInformation() {
    isEnableUpdate(false);
    isUploading(true);
    Future.delayed(Duration(seconds: 2)).then((value) {
      isUploading(false);
    });
  }
}
