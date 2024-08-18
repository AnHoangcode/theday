import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:theday/app/common/base_common.dart';
import 'package:theday/app/common/model/account.dart';
import 'package:theday/app/common/model/booking.dart';
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
                            text: 'Xin chào,\n${BaseCommon.instance.accountSession?.name}',
                            color: ColorManager.secondaryColor),
                      ],
                    ),
                  ),
                ),
                SizedBoxConst.size(context: context, size: 20),
                Obx(
                  () => controller.isLoading.value
                      ? Center(child: CircularProgressIndicator())
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
      BuildContext context, ServiceSupplierModel project) {
    return Container(
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
            Expanded(
                child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
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
                    Row(
                      children: [
                        GestureDetector(
                            onTap: () {
                              if (![
                                cancelStatusService,
                                completeSatus,
                                rejectStatusService
                              ].contains(project.status)) {
                                Get.bottomSheet(Container(
                                  height: UtilsReponsive.height(300, context),
                                  width: double.infinity,
                                  padding: EdgeInsets.all(
                                      UtilsReponsive.height(15, context)),
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.only(
                                          topLeft: Radius.circular(10),
                                          topRight: Radius.circular(10))),
                                  child: Column(
                                    children: [
                                      TextConstant.subTile3(context,
                                          text: 'Cập nhật trạng thái'),
                                      SizedBoxConst.size(context: context),
                                      Obx(() => controller.isLockUpdate.value
                                          ? CupertinoActivityIndicator()
                                          : project.status == pendingStatus
                                              ? Column(
                                                  children: [
                                                    GestureDetector(
                                                      onTap: () async {
                                                        await controller
                                                            .confirmService(
                                                                idService: project
                                                                    .bookingDetailId!);
                                                      },
                                                      child: Container(
                                                        padding: EdgeInsets.all(
                                                            UtilsReponsive
                                                                .height(10,
                                                                    context)),
                                                        decoration: BoxDecoration(
                                                            color: ColorManager
                                                                .primaryColor,
                                                            border: Border.all(
                                                                color: Colors
                                                                    .grey),
                                                            borderRadius:
                                                                BorderRadius.circular(
                                                                    UtilsReponsive
                                                                        .height(
                                                                            10,
                                                                            context))),
                                                        child: Row(
                                                          children: [
                                                            UtilCommon
                                                                .getWidgetByStatus(
                                                                    context,
                                                                    pendingStatus),
                                                            SizedBoxConst
                                                                .sizeWith(
                                                                    context:
                                                                        context),
                                                            Icon(Icons
                                                                .arrow_forward),
                                                            SizedBoxConst
                                                                .sizeWith(
                                                                    context:
                                                                        context),
                                                            UtilCommon
                                                                .getWidgetByStatus(
                                                                    context,
                                                                    approvedStatusService),
                                                          ],
                                                        ),
                                                      ),
                                                    ),
                                                    SizedBoxConst.size(
                                                        context: context),
                                                    GestureDetector(
                                                      onTap: () async {
                                                        await controller
                                                            .rejectService(
                                                                idService: project
                                                                    .bookingDetailId!);
                                                      },
                                                      child: Container(
                                                        padding: EdgeInsets.all(
                                                            UtilsReponsive
                                                                .height(10,
                                                                    context)),
                                                        decoration: BoxDecoration(
                                                            color: ColorManager
                                                                .primaryColor,
                                                            border: Border.all(
                                                                color: Colors
                                                                    .grey),
                                                            borderRadius:
                                                                BorderRadius.circular(
                                                                    UtilsReponsive
                                                                        .height(
                                                                            10,
                                                                            context))),
                                                        child: Row(
                                                          children: [
                                                            UtilCommon
                                                                .getWidgetByStatus(
                                                                    context,
                                                                    pendingStatus),
                                                            SizedBoxConst
                                                                .sizeWith(
                                                                    context:
                                                                        context),
                                                            Icon(Icons
                                                                .arrow_forward),
                                                            SizedBoxConst
                                                                .sizeWith(
                                                                    context:
                                                                        context),
                                                            UtilCommon
                                                                .getWidgetByStatus(
                                                                    context,
                                                                    rejectStatusService),
                                                          ],
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                )
                                              : project.status ==
                                                      processingStatusService
                                                  ? GestureDetector(
                                                      onTap: () async {
                                                        await controller
                                                            .completeService(
                                                                idService: project
                                                                    .bookingDetailId!);
                                                      },
                                                      child: Container(
                                                        padding: EdgeInsets.all(
                                                            UtilsReponsive
                                                                .height(10,
                                                                    context)),
                                                        decoration: BoxDecoration(
                                                            color: ColorManager
                                                                .primaryColor,
                                                            border: Border.all(
                                                                color: Colors
                                                                    .grey),
                                                            borderRadius:
                                                                BorderRadius.circular(
                                                                    UtilsReponsive
                                                                        .height(
                                                                            10,
                                                                            context))),
                                                        child: Row(
                                                          children: [
                                                            UtilCommon
                                                                .getWidgetByStatus(
                                                                    context,
                                                                    processingStatusService),
                                                            SizedBoxConst
                                                                .sizeWith(
                                                                    context:
                                                                        context),
                                                            Icon(Icons
                                                                .arrow_forward),
                                                            SizedBoxConst
                                                                .sizeWith(
                                                                    context:
                                                                        context),
                                                            UtilCommon
                                                                .getWidgetByStatus(
                                                                    context,
                                                                    completeSatus),
                                                          ],
                                                        ),
                                                      ),
                                                    )
                                                  : SizedBox())
                                    ],
                                  ),
                                ));
                              }
                            },
                            child: UtilCommon.getWidgetByStatus(
                                context, project.status!)),
                      ],
                    ),
                  ],
                ),
                SizedBoxConst.size(context: context),
                Row(
                  children: [
                    TextConstant.subTile3(context,
                        text: 'Dịch vụ:', color: Colors.white),
                    SizedBoxConst.sizeWith(context: context, size: 5),
                    TextConstant.subTile3(
                      context,
                      color: Colors.white,
                      text: '${project.serviceSupplierResponse!.name}',
                    ),
                  ],
                ),
                SizedBoxConst.size(context: context),
                Row(
                  children: [
                    TextConstant.subTile3(context,
                        size: 11,
                        text: 'Thông tin chi tiết:',
                        color: Colors.white),
                    SizedBoxConst.sizeWith(context: context, size: 5),
                    GestureDetector(
                      onTap: () {
                        Get.bottomSheet(Container(
                            height: UtilsReponsive.height(400, context),
                            width: double.infinity,
                            padding: EdgeInsets.all(
                                UtilsReponsive.height(15, context)),
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(10),
                                    topRight: Radius.circular(10))),
                            child: Column(
                              children: [
                                TextConstant.subTile2(context,
                                    text: 'Thông tin chi tiết'),
                                    SizedBoxConst.size(context: context),
                                Expanded(
                                    child: SingleChildScrollView(
                                  child: Column(
                                    children: [
                                      _textData(context, title: 'Mô tả', content: project.serviceSupplierResponse?.description??'')
                                    ,SizedBoxConst.size(context: context),
                                      _textData(context, title: 'Cặp đôi', content: '${project.couple?.partnerName1}\n${project.couple?.partnerName2}')
                                    ,SizedBoxConst.size(context: context),
                                      _textData(context, title: 'Số điện thoại', content: '${project.couple?.account?.phoneNumber}')
                                     ,SizedBoxConst.size(context: context),
                                      _textData(context, title: 'Địa chỉ', content: '${project.couple?.account?.address}')
                                    ],
                                  ),
                                ))
                              ],
                            )));
                        // controller.onTapCardBooking(idBooking: project.id ?? '');
                      },
                      child: TextConstant.subTile3(
                        size: 12,
                        fontWeight: FontWeight.bold,
                        context,
                        color: Colors.amber.shade600,
                        text: 'Xem',
                      ),
                    ),
                  ],
                ),
                SizedBoxConst.size(context: context),
                Row(
                  children: [
                    TextConstant.subTile3(context,
                        text: 'Tổng:', color: Colors.white),
                    SizedBoxConst.sizeWith(context: context, size: 5),
                    TextConstant.subTile1(
                      context,
                      color: Colors.white,
                      text:
                          '${NumberFormat.currency(locale: 'vi_VN', symbol: 'VND').format(project.price ?? 0)}',
                    ),
                  ],
                )
              ],
            ))
          ],
        ));
  }

  Row _textData(BuildContext context,
      {required String title,
      required String content,
      bool isBoldContent = false}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: TextConstant.subTile3(context,
              fontWeight: FontWeight.w400, text: title, color: Colors.black87),
        ),
        Expanded(
          flex: 2,
          child: TextConstant.subTile3(context,
              text: content,
              fontWeight: isBoldContent ? FontWeight.w800 : FontWeight.w400),
        ),
      ],
    );
  }

}
