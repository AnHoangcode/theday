import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:theday/app/common/base_common.dart';
import 'package:theday/app/resource/base_define.dart';
import 'package:theday/app/resource/logo_app.dart';
import 'package:theday/app/resource/reponsive_utils.dart';
import 'package:theday/app/resource/text_style.dart';

import '../controllers/nav_home_controller.dart';

class NavHomeView extends GetView<NavHomeController> {
  const NavHomeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
        height: double.infinity,
        width: double.infinity,
        child: SingleChildScrollView(
            padding: EdgeInsets.all(UtilsReponsive.height(15, context)),
            child: Column(
              children: [
                SizedBox(
                  height: UtilsReponsive.height(50, context),
                  width: double.infinity,
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: UtilsReponsive.width(5, context)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        LogoApp(),
                        SizedBoxConst.sizeWith(context: context),
                        TextConstant.subTile3(context,
                            fontWeight: FontWeight.bold,
                            text: 'Xin chào',
                            color: ColorManager.secondaryColor),
                      ],
                    ),
                  ),
                ),
                Obx(
                  () => controller.isLoading.value
                      ? Center(child: CircularProgressIndicator())
                      : controller.listBooking.value.isEmpty
                          ? Center(
                              child: TextConstant.subTile2(context,
                                  text: 'Dữ liệu trống'),
                            )
                          : Expanded(
                              child: ListView.separated(
                                  itemBuilder: (context, index) => Container(
                                        height: 10,
                                      ),
                                  separatorBuilder: (context, index) =>
                                      SizedBoxConst.size(context: context),
                                  itemCount:
                                      controller.listBooking.value.length)),
                )
              ],
            )));
  }
}
