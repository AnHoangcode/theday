import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'package:get/get.dart';
import 'package:theday/app/resource/base_define.dart';
import 'package:theday/app/resource/form_field_widget.dart';
import 'package:theday/app/resource/reponsive_utils.dart';
import 'package:theday/app/resource/text_style.dart';

import '../controllers/personal_supplier_controller.dart';

class PersonalSupplierView extends GetView<PersonalSupplierController> {
  const PersonalSupplierView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: SingleChildScrollView(
      padding: EdgeInsets.all(UtilsReponsive.height(20, context)),
      child: Column(
        children: [
          Row(
            children: [
              GestureDetector(
                onTap: () {
                  Get.back();
                },
                child: Icon(
                  Icons.arrow_back_ios_new,
                  color: ColorManager.secondaryColor,
                ),
              ),
              SizedBoxConst.sizeWith(context: context),
              TextConstant.subTile2(context, text: 'Thông tin cá nhân'),
              const SizedBox()
            ],
          ),
          Obx(
            () => controller.isLoading.value
                ? const Center(
                    child: CupertinoActivityIndicator(),
                  )
                : Column(
                    children: [
                      SizedBoxConst.size(context: context, size: 20),
                      _avatar(context, controller.personalData.value.image),
                      _formData(context,
                          icon: Icon(Icons.person),
                          title: 'Họ và tên',
                          textController: controller.nameController,
                          errorText: '',
                          isEnabled: controller.isEnableUpdate.value),
                      _formData(context,
                          icon: Icon(Icons.mail),
                          title: 'Email',
                          textController: controller.nameController,
                          errorText: '',
                          isEnabled: controller.isEnableUpdate.value),
                      _formData(context,
                          icon: Icon(Icons.phone),
                          title: 'Số điện thoại',
                          textController: controller.phoneController,
                          errorText: '',
                          isEnabled: controller.isEnableUpdate.value),
                      Row(
                        children: [
                          Icon(CupertinoIcons.location),
                          SizedBoxConst.sizeWith(context: context, size: 5),
                          TextConstant.subTile3(
                            context,
                            text: 'Địa chỉ',
                          ),
                        ],
                      ),
                      SizedBoxConst.size(context: context),
                      TextConstant.subTile3(context,
                          text:
                              '${controller.personalData.value.area?.fullAddress ?? ''}'),
                      SizedBoxConst.size(context: context, size: 20),
                     
                      
                      controller.isEnableUpdate.value?
                      _comboButtonUpdate(context)
                      :_buttonEdit(context),
                    ],
                  ),
          )
        ],
      ),
    )));
  }

  Row _comboButtonUpdate(BuildContext context) {
    return Row(
                      children: [
                        Expanded(
                          child: ConstrainedBox(
                                                  constraints:
                            BoxConstraints.tightFor(width: context.width),
                                                  child: ElevatedButton(
                          style: ButtonStyle(
                            shape: MaterialStateProperty.all(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20),
                                
                              ),
                            ),
                            backgroundColor: MaterialStateProperty.all(
                                ColorManager.secondaryColor),
                            padding:
                                MaterialStateProperty.all(EdgeInsets.all(14)),
                          ),
                          child: TextConstant.subTile2(context,
                              text: 'Cập nhật', color: Colors.white
                             ),
                          onPressed: () async {
                              controller.updateInformation();
                          },
                                                  )),
                        ),
                        SizedBoxConst.sizeWith(context: context),
                      Expanded(
                        child: ConstrainedBox(
                        constraints:
                            BoxConstraints.tightFor(width: context.width),
                        child: ElevatedButton(
                          style: ButtonStyle(
                            shape: MaterialStateProperty.all(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20),
                                side: BorderSide(color: Colors.red, width: 2)
                              ),
                            ),
                            backgroundColor: MaterialStateProperty.all(
                                Colors.white),
                            padding:
                                MaterialStateProperty.all(EdgeInsets.all(14)),
                          ),
                          child: TextConstant.subTile2(context,
                              text: 'Huỷ bỏ',
                              color: Colors.red
                             ),
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
                        constraints:
                            BoxConstraints.tightFor(width: context.width),
                        child: ElevatedButton(
                          style: ButtonStyle(
                            shape: MaterialStateProperty.all(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20),
                                side: BorderSide(color: ColorManager.secondaryColor, width: 2)
                              ),
                            ),
                            backgroundColor: MaterialStateProperty.all(
                                Colors.white),
                            padding:
                                MaterialStateProperty.all(EdgeInsets.all(14)),
                          ),
                          child:
                           controller.isUploading.value?CupertinoActivityIndicator():
                           TextConstant.subTile2(context,
                              text: 'Chỉnh sửa',
                             ),
                          onPressed: () async {
                              controller.isEnableUpdate.value = true;
                          },
                        ));
  }

  Column _formData(BuildContext context,
      {required Icon icon,
      required String title,
      required TextEditingController textController,
      String errorText = '',
      int maxLine = 1,
      bool isEnabled = true}) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                icon,
                SizedBoxConst.sizeWith(context: context, size: 5),
                TextConstant.subTile3(
                  context,
                  text: title,
                ),
              ],
            ),
          ],
        ),
        SizedBoxConst.size(
          context: context,
        ),
        FormFieldWidget(
          controllerEditting: textController,
          padding: 20,
          borderColor: Colors.grey,
          radiusBorder: 15,
          errorText: errorText.isNotEmpty ? errorText : null,
          setValueFunc: (v) {},
          isEnabled: isEnabled,
        ),
        SizedBoxConst.size(
          context: context,
        ),
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
}
