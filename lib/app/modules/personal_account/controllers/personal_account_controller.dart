import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:theday/app/common/base_common.dart';
import 'package:theday/app/common/model/account.dart';
import 'package:theday/app/common/model/personal_info_couple.dart';
import 'package:theday/app/modules/login/service/auth_service.dart';
import 'package:theday/app/resource/util_common.dart';

class PersonalAccountController extends GetxController {
  //TODO: Implement PersonalAccountController

  final count = 0.obs;
  Rx<bool> isLoading = false.obs;
  Rx<bool> isEnableUpdate = false.obs;
  Rx<bool> isUploading = false.obs;

  //

  AuthService service = AuthService();
  Rx<PersonalnfoCouple> dataCouple = PersonalnfoCouple().obs;
  TextEditingController nameController = TextEditingController(text: '');
  TextEditingController emailController = TextEditingController(text: '');
  TextEditingController phoneController = TextEditingController(text: '');
  TextEditingController addressController = TextEditingController(text: '');
  TextEditingController partnerName1Controller =
      TextEditingController(text: '');
  TextEditingController partnerName2Controller =
      TextEditingController(text: '');

  Rx<String> errorName = ''.obs;
  Rx<String> errorCouple = ''.obs;
  Rx<String> errorPhone = ''.obs;
  Rx<String> errorAddress= ''.obs;



  @override
  void onInit() {
    initData();
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

  void initData() {
    isLoading(true);
    service
        .getPersonalInfoCouple(
            userId: BaseCommon.instance.accountSession!.userId!)
        .then((value) {
      dataCouple.value = value;
      prepareData();
      isLoading(false);
    }).catchError((error) {
      log('$error');
    });
  }

  void cancelUpdate() {
    isEnableUpdate(false);
    prepareData();
  }

  void prepareData() {
    errorCouple('');
    errorName('');
    errorPhone('');

    nameController.text = dataCouple.value.account?.name ?? '';
    emailController.text = dataCouple.value.account?.email ?? '';
    phoneController.text = dataCouple.value.account?.phoneNumber ?? '';
    addressController.text = dataCouple.value.account?.address ?? '';
    partnerName1Controller.text = dataCouple.value.partnerName1 ?? '';
    partnerName2Controller.text = dataCouple.value.partnerName2 ?? '';
  }

  void updateInformation() {
    if (validationAll()) {
      PersonalnfoCouple model = PersonalnfoCouple();
      model = dataCouple.value;
      model.account?.name = nameController.text;
      model.account?.phoneNumber = phoneController.text;
      model.account?.address = addressController.text;

      model.partnerName1 = partnerName1Controller.text;
      model.partnerName2 = partnerName2Controller.text;
      isUploading(true);
      service.updateCoupleProfile(model: model).then((value) {
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
    return ![validationPhone(), validationName(), validationCouple(), validationAddress()]
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

   bool validationAddress() {
    if (addressController.text.trim().isEmpty) {
      errorAddress('Địa chỉ không được để trống');
      return false;
    }
      errorAddress('');
    return true;
  }

  bool validationCouple() {
    if (partnerName1Controller.text.trim().isEmpty ||
        partnerName2Controller.text.trim().isEmpty) {
        errorCouple('Tên không được để trống');
      return false;
    }
    errorCouple('');
    return true;
  }
}
