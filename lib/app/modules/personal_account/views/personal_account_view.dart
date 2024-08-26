import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'package:get/get.dart';
import 'package:theday/app/common/base_common.dart';
import 'package:theday/app/resource/base_define.dart';
import 'package:theday/app/resource/form_field_widget.dart';
import 'package:theday/app/resource/loading_widget.dart';
import 'package:theday/app/resource/reponsive_utils.dart';
import 'package:theday/app/resource/text_style.dart';

import '../controllers/personal_account_controller.dart';

class PersonalAccountView extends GetView<PersonalAccountController> {
  const PersonalAccountView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: TextConstant.subTile2(context, text: 'Cập Nhật Tài Khoản'),
          leading: IconButton(
              onPressed: () {
                Get.back();
              },
              icon: const Icon(
                Icons.arrow_back_ios_new,
                color: Colors.black,
              )),
        ),
        body: Obx(
          () => controller.isLoading.value
              ? Center(
                  child: CupertinoActivityIndicator(
                    color: ColorManager.secondaryColor,
                  ),
                )
              : SingleChildScrollView(
                  padding: EdgeInsets.all(UtilsReponsive.height(15, context)),
                  child: Column(
                    children: [
                       _avatar(context, controller.dataCouple.value.account?.image??''),
                      Obx(()=>
                         _formfieldInfo(context,
                            isEnable: controller.isEnableUpdate.value,
                            icon: Icon(
                              Icons.person,
                              color: ColorManager.secondaryColor,
                            ),
                            title: 'Họ và tên',
                            textController: controller.nameController,
                            errorMessage: controller.errorName.value
                            ),
                      ),
                     _formfieldInfo(context,
                          isEnable: controller.isEnableUpdate.value,
                          icon: Icon(
                            CupertinoIcons.heart_circle_fill,
                            color: ColorManager.secondaryColor,
                          ),
                          title: 'Dâu - Rễ',
                        
                          textController: controller.partnerName1Controller),
                      Obx(()=>   _formfieldInfo(context,
                          isEnable: controller.isEnableUpdate.value,
                          title: '',
                          errorMessage: controller.errorCouple.value,
                          textController: controller.partnerName2Controller)),
                      _formfieldInfo(context,
                          icon: Icon(
                            Icons.email,
                            color: ColorManager.secondaryColor,
                          ),
                          title: 'Email',
                          textController: controller.emailController),
                    Obx(()=>   _formfieldInfo(context,
                          isEnable: controller.isEnableUpdate.value,
                          icon: Icon(
                            Icons.phone,
                            color: ColorManager.secondaryColor,
                          ),
                          title: 'Số điện thoại',
                          textController: controller.phoneController,
                          errorMessage: controller.errorPhone.value
                          )),
                        Obx(()=>  _formfieldInfo(context,
                          icon: Icon(
                            Icons.calendar_month,
                            color: ColorManager.secondaryColor,
                          ),
                          title: 'Địa chỉ',
                          errorMessage: controller.errorAddress.value,
                           isEnable: controller.isEnableUpdate.value,
                          textController: controller.addressController)),
                      SizedBoxConst.size(context: context, size: 20),
                      controller.isEnableUpdate.value
                          ? _comboButtonUpdate(context)
                          : _buttonEdit(context),
                    ],
                  ),
                ),
        ));
  }

  Column _formfieldInfo(BuildContext context,
      {required String title,
       Icon? icon,
      required TextEditingController textController, bool isEnable = false, String errorMessage = ''}) {
    return Column(
      children: [
        icon == null?SizedBox.shrink():
        Row(
          children: [
            icon??SizedBox(),
            SizedBoxConst.sizeWith(context: context),
            TextConstant.subTile3(context,
                text: title,
                color: ColorManager.secondaryColor,
                fontWeight: FontWeight.bold),
          ],
        ),
        icon!=null?SizedBoxConst.size(context: context):const SizedBox.shrink(),
        FormFieldWidget(
            fillColor: isEnable?Colors.white:Colors.grey.shade100,
            isEnabled: isEnable,
            errorText: errorMessage,
            padding: 15,
            controllerEditting: textController,
            radiusBorder: 15,
            borderColor: const Color.fromARGB(255, 231, 201, 201),
            setValueFunc: (value) {}),
        SizedBoxConst.size(context: context),
      ],
    );
  }
  Container _avatar(BuildContext context, String? url) {
    return Container(
      height: UtilsReponsive.height(90, context),
      width: UtilsReponsive.height(90, context),
      padding: EdgeInsets.all(UtilsReponsive.height(10, context)),
      decoration: BoxDecoration(
          border: Border.all(color: ColorManager.secondaryColor),
          color: Colors.white,
          shape: BoxShape.circle),
      child: Container(
        clipBehavior: Clip.hardEdge,
        decoration: BoxDecoration(
            color: ColorManager.secondaryColor, shape: BoxShape.circle),
        child: CachedNetworkImage(
          fit: BoxFit.fill,
          imageUrl: url ?? '',
          placeholder: (context, url) => const CircularProgressIndicator(
            color: Colors.white,
          ),
          errorWidget: (context, url, error) =>
              Image.asset('assets/theday_logo.png'),
        ),
      ),
    );
  }
  Row _comboButtonUpdate(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: ConstrainedBox(
              constraints: BoxConstraints.tightFor(width: context.width),
              child: ElevatedButton(
                style: ButtonStyle(
                  shape: MaterialStateProperty.all(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                  backgroundColor:
                      MaterialStateProperty.all(ColorManager.secondaryColor),
                  padding: MaterialStateProperty.all(EdgeInsets.all(14)),
                ),
                child: TextConstant.subTile2(context,
                    text: 'Cập nhật', color: Colors.white),
                onPressed: () async {
                  controller.updateInformation();
                },
              )),
        ),
        SizedBoxConst.sizeWith(context: context),
        Expanded(
          child: ConstrainedBox(
              constraints: BoxConstraints.tightFor(width: context.width),
              child: ElevatedButton(
                style: ButtonStyle(
                  shape: MaterialStateProperty.all(
                    RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                        side: BorderSide(color: Colors.red, width: 2)),
                  ),
                  backgroundColor: MaterialStateProperty.all(Colors.white),
                  padding: MaterialStateProperty.all(EdgeInsets.all(14)),
                ),
                child: TextConstant.subTile2(context,
                    text: 'Huỷ bỏ', color: Colors.red),
                onPressed: () async {
                  controller.cancelUpdate();
                },
              )),
        )
      ],
    );
  }

  ConstrainedBox _buttonEdit(BuildContext context) {
    return ConstrainedBox(
        constraints: BoxConstraints.tightFor(width: context.width),
        child: ElevatedButton(
          style: ButtonStyle(
            shape: MaterialStateProperty.all(
              RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                  side:
                      BorderSide(color: ColorManager.secondaryColor, width: 2)),
            ),
            backgroundColor: MaterialStateProperty.all(Colors.white),
            padding: MaterialStateProperty.all(EdgeInsets.all(14)),
          ),
          child: controller.isUploading.value
              ? CupertinoActivityIndicator()
              : TextConstant.subTile2(
                  context,
                  text: 'Chỉnh sửa',
                ),
          onPressed: () async {
            controller.isEnableUpdate.value = true;
          },
        ));
  }
}
