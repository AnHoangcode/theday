import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:theday/app/common/base_common.dart';
import 'package:theday/app/common/model/account.dart';
import 'package:theday/app/common/model/booking.dart';
import 'package:theday/app/common/model/booking_overview_supplier.dart';
import 'package:theday/app/common/model/service_supplier_model.dart';
import 'package:theday/app/resource/base_define.dart';
import 'package:theday/app/resource/logo_app.dart';
import 'package:theday/app/resource/reponsive_utils.dart';
import 'package:theday/app/resource/text_style.dart';
import 'package:theday/app/resource/util_common.dart';
import 'package:theday/app/routes/app_pages.dart';

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
                _headerWelcome(context),
                SizedBoxConst.size(context: context, size: 20),
                Obx(
                  () => controller.isLoading.value
                      ? const Center(child: CircularProgressIndicator())
                      : BaseCommon.instance.accountSession!.roleName ==
                              coupleRole
                          ? controller.listBooking.value.isEmpty
                              ? Center(
                                  child: TextConstant.subTile2(context,
                                      text: 'Dữ liệu trống'),
                                )
                              : ListView.separated(
                                  shrinkWrap: true,
                                  primary: false,
                                  itemBuilder: (context, index) =>
                                      _cardProjectForCouple(context,
                                          controller.listBooking.value[index]),
                                  separatorBuilder: (context, index) =>
                                      SizedBoxConst.size(context: context),
                                  itemCount:
                                      controller.listBooking.value.length)
                          : controller.listService.value.isEmpty
                              ? Center(
                                  child: TextConstant.subTile2(context,
                                      text: 'Dữ liệu trống'),
                                )
                              : ListView.separated(
                                  shrinkWrap: true,
                                  primary: false,
                                  itemBuilder: (context, index) =>
                                      _cardForSupplierView(context,
                                          controller.listService.value[index]),
                                  separatorBuilder: (context, index) =>
                                      SizedBoxConst.size(context: context),
                                  itemCount:
                                      controller.listService.value.length),
                ),
                SizedBoxConst.size(context: context, size: 50)
              ],
            )));
  }

  SizedBox _headerWelcome(BuildContext context) {
    return SizedBox(
      height: UtilsReponsive.height(50, context),
      width: double.infinity,
      child: Padding(
        padding:
            EdgeInsets.symmetric(horizontal: UtilsReponsive.width(5, context)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            LogoApp(),
            SizedBoxConst.sizeWith(context: context),
            TextConstant.subTile3(context,
                fontWeight: FontWeight.bold,
                text: 'Xin chào,\n${BaseCommon.instance.accountSession?.name}',
                color: ColorManager.secondaryColor),
          ],
        ),
      ),
    );
  }

  Widget _cardProjectForCouple(BuildContext context, Booking project) {
    return GestureDetector(
      onTap: () {
        controller.onTapCardBooking(idBooking: project.id ?? '');
      },
      child: Container(
          // height: UtilsReponsive.height(100, context),
          width: double.infinity,
          decoration: BoxDecoration(
              borderRadius:
                  BorderRadius.circular(UtilsReponsive.height(15, context)),
              color: ColorManager.secondaryColor),
          padding: EdgeInsets.symmetric(
              vertical: UtilsReponsive.height(10, context),
              horizontal: UtilsReponsive.height(10, context)),
          child: Row(
            children: [
              Container(
                height: UtilsReponsive.height(60, context),
                width: UtilsReponsive.height(60, context),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(
                        UtilsReponsive.height(10, context)),
                    color: ColorManager.secondaryColor),
                child: FittedBox(
                    child: TextConstant.subTile3(
                        text: 'B', color: Colors.white, context)),
              ),
              SizedBoxConst.sizeWith(context: context, size: 20),
              Expanded(
                  child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // TextConstant.subTile3(
                  //     text: '${project.id}',
                  //     color: Colors.white,
                  //     fontWeight: FontWeight.bold,
                  //     context),
                  // SizedBoxConst.size(context: context, size: 5),
                  Row(
                    children: [
                      Icon(
                        Icons.calendar_month,
                        color: Colors.white,
                        size: UtilsReponsive.height(16, context),
                      ),
                      SizedBoxConst.sizeWith(context: context, size: 5),
                      TextConstant.subTile2(
                          text:
                              '${UtilCommon.convertDateTime(project.couple!.weddingDate!)}',
                          color: Colors.white,
                          fontWeight: FontWeight.w500,
                          context),
                    ],
                  ),
                  SizedBoxConst.size(context: context),

                  Row(
                    children: [
                      TextConstant.subTile3(context,
                          text: 'Trạng thái:', size: 10, color: Colors.white),
                      SizedBoxConst.sizeWith(context: context),
                      UtilCommon.getWidgetByStatus(context, project.status!)
                    ],
                  ),
                  SizedBoxConst.size(context: context),
                  Row(
                    children: [
                      TextConstant.subTile3(context,
                          text: 'Tổng:', size: 10, color: Colors.white),
                      SizedBoxConst.sizeWith(context: context, size: 5),
                      TextConstant.subTile1(
                        context,
                        color: Colors.white,
                        text:
                            '${NumberFormat.currency(locale: 'vi_VN', symbol: 'VND').format(project.totalPrice ?? 0)}',
                      ),
                    ],
                  )
                ],
              ))
            ],
          )),
    );
  }

  Widget _cardForSupplierView(
      BuildContext context, BookingOverViewSupplier project) {
    return Container(
        width: double.infinity,
        decoration: BoxDecoration(
          border: Border.all(color: ColorManager.secondaryColor),
          borderRadius:
              BorderRadius.circular(UtilsReponsive.height(5, context)),
        ),
        padding: EdgeInsets.symmetric(
            vertical: UtilsReponsive.height(5, context),
            horizontal: UtilsReponsive.height(5, context)),
        child: Row(
          children: [
            SizedBox(
              width: UtilsReponsive.width(70, context),
              height: UtilsReponsive.width(70, context),
              child:Image.asset('assets/theday_logo.png')
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  //Id Booking
                  TextConstant.subTile3(context,
                      size: 12,
                      text:
                          '#${project.id}'),
                          SizedBoxConst.size(context: context),
                  //Data WeddingDate
                  Row(
                    children: [
                      Icon(
                        Icons.calendar_month,
                        size: UtilsReponsive.height(12, context),
                      ),
                      SizedBoxConst.sizeWith(context: context),
                      TextConstant.subTile3(context,
                          size: 12,
                          text:
                              '${UtilCommon.convertDateTime(project.coupleResponse!.weddingDate!)}')
                    ],
                  ),
                  SizedBoxConst.size(context: context),
                    //Name Customer
                  TextConstant.subTile3(context,
                      size: 12,
                      text:
                          'KH: ${project.coupleResponse!.account!.name}'),
                          SizedBoxConst.size(context: context),
                  GestureDetector(
                    onTap: () {
                      Get.toNamed(Routes.BOOKING_DETAIL_SUPPLIER, arguments: project.id);
                    },
                    child: TextConstant.subTile3(context,size: 10, text: 'Xem thêm thông tin', color: ColorManager.secondaryColor, fontWeight: FontWeight.bold))
                ],
              ),
            ),
          ],
        ));
  }
}
