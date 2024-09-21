import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:theday/app/common/base_common.dart';
import 'package:theday/app/common/model/account.dart';
import 'package:theday/app/resource/base_define.dart';
import 'package:theday/app/resource/reponsive_utils.dart';
import 'package:theday/app/resource/text_style.dart';
import 'package:theday/app/routes/app_pages.dart';

import '../controllers/nav_account_controller.dart';

class NavAccountView extends GetView<NavAccountController> {
  const NavAccountView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    Get.find<NavAccountController>();
   return Container(
      width: double.infinity,
      height: double.infinity,
      padding: EdgeInsets.all(UtilsReponsive.height(10, context)),
      child: Column(
        children: [
          _avatar(context, ''),
          SizedBoxConst.size(context: context),
          TextConstant.subTile2(context, text: '${BaseCommon.instance.accountSession?.name}'),
          SizedBoxConst.size(context: context, size: 20),
          GestureDetector(
            onTap: () {
              BaseCommon.instance.accountSession!.roleName! == coupleRole?
              Get.toNamed(Routes.PERSONAL_ACCOUNT)
              : Get.toNamed(Routes.PERSONAL_SUPPLIER);
            },
            child: Container(
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
          ),
          SizedBoxConst.size(context: context, ),
          GestureDetector(
            onTap: () async{
              await controller.logout();
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
