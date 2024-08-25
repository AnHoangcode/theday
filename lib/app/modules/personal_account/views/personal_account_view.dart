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
                      _formfieldInfo(context,
                          isEnable: controller.isEnableUpdate.value,
                          icon: Icon(
                            Icons.person,
                            color: ColorManager.secondaryColor,
                          ),
                          title: 'Họ và tên',
                          textController: controller.nameController),
                      _formfieldInfo(context,
                          icon: Icon(
                            Icons.email,
                            color: ColorManager.secondaryColor,
                          ),
                          title: 'Email',
                          textController: controller.emailController),
                      _formfieldInfo(context,
                          isEnable: controller.isEnableUpdate.value,
                          icon: Icon(
                            Icons.phone,
                            color: ColorManager.secondaryColor,
                          ),
                          title: 'Số điện thoại',
                          textController: controller.phoneController),
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
      required Icon icon,
      required TextEditingController textController, bool isEnable = false}) {
    return Column(
      children: [
        Row(
          children: [
            icon,
            SizedBoxConst.sizeWith(context: context),
            TextConstant.subTile3(context,
                text: title,
                color: ColorManager.secondaryColor,
                fontWeight: FontWeight.bold),
          ],
        ),
        SizedBoxConst.size(context: context),
        FormFieldWidget(
            fillColor: isEnable?Colors.white:Colors.grey.shade100,
            isEnabled: isEnable,
            padding: 15,
            controllerEditting: textController,
            radiusBorder: 15,
            borderColor: Colors.black,
            setValueFunc: (value) {}),
        SizedBoxConst.size(context: context),
      ],
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
