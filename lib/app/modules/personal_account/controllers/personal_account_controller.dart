import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
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
    service.getPersonalInfoCouple(userId: BaseCommon.instance.accountSession!.userId!).then((value){
        dataCouple.value = value;
        prepareData();
        isLoading(false);
    }).catchError((error) {
        log('$error');
    });
  }
  void cancelUpdate(){
    isEnableUpdate(false);
    prepareData();
  }
  void prepareData(){
    nameController.text = dataCouple.value.account?.name?? '';
    emailController.text = dataCouple.value.account?.email?? '';
    phoneController.text = dataCouple.value.account?.phoneNumber?? '';
  }

  void updateInformation(){
    PersonalnfoCouple model = PersonalnfoCouple();
    model = dataCouple.value;
    model.account?.name = nameController.text;
    isUploading(true);
    service.updateCoupleProfile(model: model).then((value){
        if(value){
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
    });;
  }
}
