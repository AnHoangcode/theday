import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

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
            icon: Icon(
              Icons.arrow_back_ios_new,
              color: Colors.black,
            )),
      ),
      body: SafeArea(
        child: Column(
          children: [
            // AppBarCustom(
            //     callback: () {
            //       Get.back();
            //     },
            //     title: 'Cập Nhật Tài Khoản'),
            SizedBoxConst.size(context: context, size: 20),
            Expanded(
              child: Obx(() => controller.isLoading.value
                  ? Center(child: LoadingWidget())
                  : Material(
                      child: Container(
                        width: UtilsReponsive.width(
                          375,
                          context,
                        ),
                        height: UtilsReponsive.height(
                          812,
                          context,
                        ),
                        color: Colors.white,
                        child: SingleChildScrollView(
                          scrollDirection: Axis.vertical,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              controller.isLoading.value == true
                                  ? SizedBox()
                                  : SizedBox(),
                              Center(
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Container(
                                      clipBehavior: Clip.hardEdge,
                                      height:
                                          UtilsReponsive.height(80, context),
                                      width: UtilsReponsive.height(80, context),
                                      decoration: BoxDecoration(
                                          color: ColorManager.secondaryColor,
                                          shape: BoxShape.circle),
                                      child: CachedNetworkImage(
                                        fit: BoxFit.fill,
                                        imageUrl:
                                            // controller
                                            //         .account.value.avatarUrl ??
                                            '',
                                        placeholder: (context, url) =>
                                            const CircularProgressIndicator(
                                          color: Colors.white,
                                        ),
                                        errorWidget: (context, url, error) =>
                                            Icon(Icons.abc),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: UtilsReponsive.paddingOnly(context,
                                    top: 30, left: 20, right: 20),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      children: [
                                        Icon(Icons.person),
                                        SizedBoxConst.sizeWith(
                                            context: context, size: 5),
                                        TextConstant.subTile3(
                                          context,
                                          text: "Họ và tên",
                                        ),
                                      ],
                                    ),
                                
                                  ],
                                ),
                              ),
                              Padding(
                                padding: UtilsReponsive.paddingOnly(context,
                                    top: 20, right: 20, left: 20),
                                child: FormFieldWidget(
                                  initValue: BaseCommon.instance.accountSession?.name??'',
                                  // controllerEditting:
                                  //     controller.nameController,
                                  padding: 20,
                                  borderColor: Colors.grey,
                                  radiusBorder: 10,
                                  setValueFunc: (v) {},
                                  // isEnabled: controller.isUpdateName.value,
                                ),
                              ),
                              Padding(
                                padding: UtilsReponsive.paddingOnly(context,
                                    top: 30, left: 20),
                                child: Row(
                                  children: [
                                    Icon(Icons.email),
                                    SizedBoxConst.sizeWith(
                                        context: context, size: 5),
                                    TextConstant.subTile3(
                                      context,
                                      text: "Email",
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: UtilsReponsive.paddingOnly(context,
                                    top: 20, right: 20, left: 20),
                                child: FormFieldWidget(
                                  initValue: BaseCommon.instance.accountSession?.email??'',
                                  padding: 20,
                                  fillColor: Colors.grey.withOpacity(0.3),
                                  borderColor: Colors.grey,
                                  radiusBorder: 10,
                                  isEnabled: false,
                                  setValueFunc: (v) {},
                                ),
                              ),
                              Padding(
                                padding: UtilsReponsive.paddingOnly(context,
                                    top: 30, left: 20, right: 20),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      children: [
                                        Icon(Icons.phone),
                                        SizedBoxConst.sizeWith(
                                            context: context, size: 5),
                                        TextConstant.subTile3(
                                          context,
                                          text: "Số điện thoại",
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: UtilsReponsive.paddingOnly(context,
                                    top: 20, right: 20, left: 20),
                                child: FormFieldWidget(
                                // initValue: BaseCommon.instance.accountSession?.name??'',
                                  padding: 20,
                                  borderColor: Colors.grey,
                                  radiusBorder: 10,
                                  setValueFunc: (v) {},
                                ),
                              ),
                              // Padding(
                              //     padding: UtilsReponsive.paddingOnly(context,
                              //         top: 50, left: 20, right: 20, bottom: 50),
                              //     child: Obx(() => controller.isLockUpdate.value
                              //         ? ElevatedButton(
                              //             style: ElevatedButton.styleFrom(
                              //               backgroundColor:
                              //                   ColorsManager.primary,
                              //               shape: RoundedRectangleBorder(
                              //                   borderRadius:
                              //                       BorderRadius.circular(15)),
                              //               padding: UtilsReponsive.paddingOnly(
                              //                   context,
                              //                   top: 15,
                              //                   bottom: 15),
                              //             ),

                              //             // ignore: sort_child_properties_last
                              //             child: Container(
                              //               alignment: Alignment.center,
                              //               child: Text(
                              //                 'Chỉnh sửa thông tin',
                              //                 textAlign: TextAlign.center,
                              //               ),
                              //             ),
                              //             onPressed: () async {
                              //               controller.onTapEdit();
                              //             },
                              //           )
                              //         : Row(
                              //             mainAxisAlignment:
                              //                 MainAxisAlignment.spaceAround,
                              //             children: [
                              //               Expanded(
                              //                 child: ElevatedButton(
                              //                   style: ElevatedButton.styleFrom(
                              //                     backgroundColor:
                              //                         Colors.white,
                              //                     shape: RoundedRectangleBorder(
                              //                       side: BorderSide(color: ColorsManager.primary),
                              //                         borderRadius:
                              //                             BorderRadius.circular(
                              //                                 15)),
                              //                     padding:
                              //                         UtilsReponsive.paddingOnly(
                              //                             context,
                              //                             top: 15,
                              //                             bottom: 15),
                              //                   ),

                              //                   // ignore: sort_child_properties_last
                              //                   child: Container(
                              //                     alignment: Alignment.center,
                              //                     child: TextConstant.subTile3(context,text:
                              //                       'Huỷ bỏ',
                              //                       color: ColorsManager.primary,
                              //                     ),
                              //                   ),
                              //                   onPressed: () async {
                              //                     controller.onTapEdit();
                              //                   },
                              //                 ),
                              //               ),
                              //               SizedBoxConst.sizeWith(
                              //                   context: context),
                              //               Expanded(
                              //                 child: ElevatedButton(
                              //                   style: ElevatedButton.styleFrom(
                              //                     backgroundColor:
                              //                         ColorsManager.primary,
                              //                     shape: RoundedRectangleBorder(
                              //                         borderRadius:
                              //                             BorderRadius.circular(
                              //                                 15)),
                              //                     padding:
                              //                         UtilsReponsive.paddingOnly(
                              //                             context,
                              //                             top: 15,
                              //                             bottom: 15),
                              //                   ),

                              //                   // ignore: sort_child_properties_last
                              //                   child: Container(
                              //                     alignment: Alignment.center,
                              //                     child: Text(
                              //                       'Cập nhật',
                              //                       textAlign: TextAlign.center,
                              //                     ),
                              //                   ),
                              //                   onPressed: () async {
                              //                     controller.onTapEdit();
                              //                   },
                              //                 ),
                              //               ),
                              //             ],
                              //           ))),
                            ],
                          ),
                        ),
                      ),
                    )),
            ),
          ],
        ),
      ),
    );
  }
}
