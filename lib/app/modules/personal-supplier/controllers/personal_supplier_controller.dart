import 'dart:convert';
import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:theday/app/common/base_common.dart';
import 'package:theday/app/common/model/personal_info_supplier.dart';
import 'package:theday/app/modules/login/service/auth_service.dart';
import 'package:theday/app/resource/util_common.dart';

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
  
  Rx<String> errorPhone = ''.obs;
  Rx<String> errorName = ''.obs;

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
      prepareData();

      isLoading.value = false;
    }).catchError((error) async {
      isLoading.value = false;
      log('$error');
    });
  }

  void cancelUpdate() {
    isEnableUpdate(false);
    prepareData();
  }

  void prepareData() {
    errorName('');
    errorPhone('');

    nameController.text = personalData.value.contactPersonName ?? '';
    phoneController.text = personalData.value.contactPhone ?? '';
    emailController.text = personalData.value.contactEmail ?? '';
  }

  void updateInformation() {
    if (validationAll()) {
      PersonalInforSupplier model = PersonalInforSupplier();
      model = personalData.value;
      model.supplierName = nameController.text;
      model.contactPhone = phoneController.text;
      log('message2: ${jsonEncode(model)}');
      isUploading(true);
      service.updateSupplierProfile(model: model).then((value) {
        if (value) {
          UtilCommon.snackBar(text: 'Cập nhật thành công');
          isUploading(false);
          isEnableUpdate(false);
          initData();
        }
      }).catchError((error) {
        isUploading(false);
        isEnableUpdate(false);
        UtilCommon.snackBar(text: '${error}', isFail: true);
        log('$error');
      });
    }
  }

  validationAll() {
    return ![validationPhone(), validationName()]
        .contains(false);
  }

  bool validationPhone() {
    if (phoneController.text.trim().isEmpty) {
      errorPhone('Số điện thoại không để trống');
      return false;
    }
    if (!phoneController.text.trim().isPhoneNumber) {
      errorPhone('Không đúng định dạng');
      return false;
    }
    errorPhone('');
    return true;
  }

  bool validationName() {
    if (nameController.text.trim().isEmpty) {
      errorName('Tên không được để trống');
      return false;
    }
      errorName('');
    return true;
  }

}
