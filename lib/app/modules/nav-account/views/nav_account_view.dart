import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:theday/app/common/base_common.dart';
import 'package:theday/app/resource/base_define.dart';
import 'package:theday/app/resource/reponsive_utils.dart';
import 'package:theday/app/resource/text_style.dart';
import 'package:theday/app/routes/app_pages.dart';

import '../controllers/nav_account_controller.dart';

class NavAccountView extends GetView<NavAccountController> {
  const NavAccountView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
   return Container(
      width: double.infinity,
      height: double.infinity,
      padding: EdgeInsets.all(UtilsReponsive.height(10, context)),
      child: Column(
        children: [
          _avatar(context),
          SizedBoxConst.size(context: context),
          TextConstant.subTile2(context, text: '${BaseCommon.instance.accountSession?.email}'),
          SizedBoxConst.size(context: context, size: 20),
          Container(
            height: UtilsReponsive.height(50, context),
            padding: EdgeInsets.symmetric(horizontal: UtilsReponsive.width(10, context)),
            decoration: BoxDecoration(
              color: ColorManager.secondaryColor,
              borderRadius: BorderRadius.circular(UtilsReponsive.height(10, context))
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Icon(Icons.person, color: Colors.white,),
                TextConstant.subTile1(context, text: 'Thông tin cá nhân', color: Colors.white,),
                Icon(Icons.arrow_forward_ios_outlined, color: Colors.white,),
              ],
            ),
          ),
          SizedBoxConst.size(context: context, ),
          Container(
            height: UtilsReponsive.height(50, context),
            padding: EdgeInsets.symmetric(horizontal: UtilsReponsive.width(10, context)),
            decoration: BoxDecoration(
              color: ColorManager.secondaryColor,
              borderRadius: BorderRadius.circular(UtilsReponsive.height(10, context))
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Icon(Icons.history, color: Colors.white,),
                TextConstant.subTile1(context, text: 'Lịch sử mua hàng', color: Colors.white,),
                Icon(Icons.arrow_forward_ios_outlined, color: Colors.white,),
              ],
            ),
          ),
            SizedBoxConst.size(context: context, ),
          GestureDetector(
            onTap: () {
              Get.offAllNamed(Routes.LOGIN);
            },
            child: Container(
              height: UtilsReponsive.height(50, context),
              padding: EdgeInsets.symmetric(horizontal: UtilsReponsive.width(10, context)),
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(color: Colors.red),
                borderRadius: BorderRadius.circular(UtilsReponsive.height(10, context))
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Icon(Icons.logout, color: Colors.red,),
                  TextConstant.subTile1(context, text: 'Đăng xuất', color: Colors.red,),
                  Icon(Icons.arrow_forward_ios_outlined, color: Colors.white,),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  SizedBox _avatar(BuildContext context) {
    return SizedBox(
      height: UtilsReponsive.height(90, context),
      width: UtilsReponsive.height(90, context),
      child: Container(
        clipBehavior: Clip.hardEdge,
        height: UtilsReponsive.height(90, context),
        width: UtilsReponsive.height(90, context),
        padding: EdgeInsets.all(UtilsReponsive.height(10, context)),
        decoration: BoxDecoration(
            color: ColorManager.secondaryColor,
            border: Border.all(color: ColorManager.secondaryColor),
            shape: BoxShape.circle),
        child: FittedBox(
            child: Icon(
          Icons.person,
          color: Colors.white,
        )),
      ),
    );
  }
}
