import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:theday/app/common/model/booking.dart';
import 'package:theday/app/resource/base_define.dart';
import 'package:theday/app/resource/logo_app.dart';
import 'package:theday/app/resource/reponsive_utils.dart';
import 'package:theday/app/resource/text_style.dart';

import '../controllers/booking_detail_controller.dart';

class BookingDetailView extends GetView<BookingDetailController> {
  const BookingDetailView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.amber.shade700,
          centerTitle: true,
          title: TextConstant.subTile1(context,
              text: 'Thông tin chi tiết', color: Colors.white),
          leading: IconButton(
              onPressed: () {
                Get.back();
              },
              icon: Icon(
                Icons.arrow_back_ios_new,
                color: Colors.white,
              )),
        ),
        backgroundColor: Colors.amber.shade700,
        bottomNavigationBar: Obx(() =>
            (controller.isLoading.value|| [completedStatusService, cancelStatusService].contains(controller.bookingData.value.status)) ? SizedBox() : _buttonSupplier(context)),
        body: Obx(
          () => controller.isLoading.value
              ? Container(
                  height: double.infinity,
                  width: double.infinity,
                  color: Colors.white,
                  alignment: Alignment.center,
                  child: CircularProgressIndicator())
              : SingleChildScrollView(
                  child: Stack(
                    children: [
                      Container(
                        height: UtilsReponsive.height(200, context),
                        width: double.infinity,
                        margin: EdgeInsets.only(
                            top: UtilsReponsive.height(140, context)),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            // border: Border.all(color: Colors.black),
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(
                                  UtilsReponsive.height(80, context)),
                              topRight: Radius.circular(
                                  UtilsReponsive.height(80, context)),
                            )),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            width: double.infinity,
                            padding: EdgeInsets.all(
                                UtilsReponsive.height(10, context)),
                            height: UtilsReponsive.height(170, context),
                            margin: EdgeInsets.only(
                                top: UtilsReponsive.height(40, context),
                                left: UtilsReponsive.height(20, context),
                                right: UtilsReponsive.height(20, context)),
                            decoration: BoxDecoration(
                                border:
                                    Border.all(color: Colors.white, width: 2),
                                color: ColorManager.secondaryColor,
                                borderRadius: BorderRadius.circular(
                                    UtilsReponsive.height(20, context))),
                            child: Column(
                              children: [
                                Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      SizedBox(
                                          height: UtilsReponsive.height(
                                              50, context),
                                          width: UtilsReponsive.height(
                                              50, context),
                                          child: LogoApp()),
                                      SizedBoxConst.sizeWith(context: context),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          TextConstant.subTile3(context,
                                              size: 10,
                                              text:
                                                  'Mã đơn: ${controller.bookingData.value.id}',
                                              fontWeight: FontWeight.w900,
                                              color: Colors.white),
                                          SizedBoxConst.size(
                                              context: context, size: 5),
                                          TextConstant.subTile1(
                                            context,
                                            color: Colors.white,
                                            text:
                                                '${NumberFormat.currency(locale: 'vi_VN', symbol: 'VND').format(controller.bookingData.value.totalPrice ?? 0)}',
                                          ),
                                          SizedBoxConst.size(context: context),
                                        ],
                                      )
                                    ]),
                                SizedBoxConst.size(context: context),
                                Row(
                                  children: [
                                    Expanded(
                                        child: Column(
                                      children: [
                                        TextConstant.subTile2(context,
                                            fontWeight: FontWeight.w500,
                                            text: 'Ngày cưới',
                                            color: Colors.white),
                                        SizedBoxConst.size(context: context),
                                        TextConstant.subTile3(context,
                                            color: Colors.white,
                                            text:
                                                '${DateFormat('dd-MM-yyyy').format(controller.bookingData.value.couple!.weddingDate!)}',
                                            fontWeight: FontWeight.bold),
                                      ],
                                    )),
                                    Container(
                                      width: 2,
                                      height:
                                          UtilsReponsive.height(60, context),
                                      color: Colors.white,
                                    ),
                                    Expanded(
                                        flex: 2,
                                        child: Column(
                                          children: [
                                            TextConstant.subTile2(context,
                                                color: Colors.white,
                                                text:
                                                    '${controller.bookingData.value.couple!.partnerName1!}'),
                                            Icon(
                                                CupertinoIcons
                                                    .heart_fill,
                                                size: 20,
                                                color: Colors.red),
                                            TextConstant.subTile2(context,
                                                color: Colors.white,
                                                text:
                                                    '${controller.bookingData.value.couple!.partnerName2!}'),
                                          ],
                                        )),
                                  ],
                                )
                              ],
                            ),
                          ),
                          SizedBoxConst.size(context: context),
                          Container(
                            color: Colors.white,
                            padding: EdgeInsets.all(
                                UtilsReponsive.height(15, context)),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                TextConstant.subTile1(context,
                                    text: 'Thông tin liên hệ',
                                    fontWeight: FontWeight.bold,
                                    color: ColorManager.secondaryColor),
                                _textData(context,
                                    title: 'Số điện thoại: ',
                                    content: controller.bookingData.value.couple
                                            ?.account?.phoneNumber ??
                                        ''),
                                _textData(context,
                                    title: 'Địa chỉ: ',
                                    content: controller.bookingData.value.couple
                                            ?.account?.address ??
                                        '')

                                // Container(
                                //   width: UtilsReponsive.width(60, context),
                                //   margin: EdgeInsets.symmetric(
                                //       vertical: UtilsReponsive.height(5, context)),
                                //   height: 2,
                                //   color: ColorManager.secondaryColor,
                                // ),
                                // TextConstant.subTile3(context,
                                //     fontWeight: FontWeight.w400,
                                //     text:
                                //         'Đại học FPT Hà Nội tọa lạc tại Khu Công nghệ cao Hòa Lạc, Km29 Đại lộ Thăng Long, huyện Thạch Thất, Hà Nội'),
                                ,
                                SizedBoxConst.size(context: context),
                                TextConstant.subTile1(context,
                                    text: 'Bảng dịch vụ',
                                    fontWeight: FontWeight.bold,
                                    color: ColorManager.secondaryColor),
                                Container(
                                  width: UtilsReponsive.width(120, context),
                                  margin: EdgeInsets.symmetric(
                                      vertical:
                                          UtilsReponsive.height(5, context)),
                                  height: 2,
                                  color: ColorManager.secondaryColor,
                                ),
                                SizedBoxConst.size(context: context),
                                Container(
                                  width: double.infinity,
                                  padding: EdgeInsets.all(
                                      UtilsReponsive.height(10, context)),
                                  decoration: BoxDecoration(
                                      border: Border.all(),
                                      borderRadius: BorderRadius.circular(
                                          UtilsReponsive.height(10, context))),
                                  child: Column(
                                    children: [
                                      ListView.separated(
                                        shrinkWrap: true,
                                        primary: false,
                                        itemBuilder: (context, index) => _textData(
                                            context,
                                            title: controller
                                                .bookingData
                                                .value
                                                .listBookingDetail![index]
                                                .serviceSupplier!
                                                .name!,
                                            content:
                                                '${NumberFormat.currency(locale: 'vi_VN', symbol: 'VND').format(controller.bookingData.value.listBookingDetail![index].price)}'),
                                        separatorBuilder: (context, index) =>
                                            SizedBoxConst.size(
                                          context: context,
                                        ),
                                        itemCount: controller.bookingData.value
                                            .listBookingDetail!.length,
                                      ),
                                      SizedBoxConst.size(
                                        context: context,
                                      ),
                                      _textData(context,
                                          title: 'Tổng cộng',
                                          content:
                                              '${NumberFormat.currency(locale: 'vi_VN', symbol: 'VND').format(controller.bookingData.value.totalPrice)}',
                                          isBoldContent: true),
                                      SizedBoxConst.size(context: context),
                                      // DashedDivider(),
                                      // SizedBoxConst.size(context: context),
                                      // Row(
                                      //   mainAxisAlignment:
                                      //       MainAxisAlignment.spaceBetween,
                                      //   children: [
                                      //     Row(
                                      //       children: [
                                      //         Icon(
                                      //           CupertinoIcons.tag_fill,
                                      //           color:
                                      //               ColorManager.secondaryColor,
                                      //         ),
                                      //         SizedBoxConst.sizeWith(
                                      //             context: context),
                                      //         TextConstant.subTile2(context,
                                      //             text: 'Giảm giá'),
                                      //       ],
                                      //     ),
                                      //     TextConstant.subTile3(context,
                                      //         text: '0 VNĐ',
                                      //         color:
                                      //             ColorManager.secondaryColor)
                                      //   ],
                                      // ),
                                      SizedBoxConst.size(context: context),
                                      DashedDivider(),
                                      SizedBoxConst.size(context: context),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          TextConstant.subTile2(
                                            context,
                                            fontWeight: FontWeight.w800,
                                            text: 'Thành tiền',
                                            color: ColorManager.secondaryColor,
                                          ),
                                          TextConstant.textH2(context,
                                              text:
                                                  '${NumberFormat.currency(locale: 'vi_VN', symbol: 'VND').format(controller.bookingData.value.totalPrice)}',
                                              color:
                                                  ColorManager.secondaryColor,
                                              fontWeight: FontWeight.w800),
                                        ],
                                      ),
                                      SizedBoxConst.size(context: context),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          TextConstant.subTile3(
                                            context,
                                            fontWeight: FontWeight.w500,
                                            text: 'Đặt cọc',
                                            color: ColorManager.secondaryColor,
                                          ),
                                          TextConstant.textH3(context,
                                              text: '0 VND',
                                              color:
                                                  ColorManager.secondaryColor,
                                              fontWeight: FontWeight.w800),
                                        ],
                                      ),
                                      SizedBoxConst.size(context: context),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          TextConstant.subTile3(
                                            context,
                                            fontWeight: FontWeight.w500,
                                            text: 'Còn lại',
                                            color: ColorManager.secondaryColor,
                                          ),
                                          TextConstant.textH3(context,
                                              text:
                                                  '${NumberFormat.currency(locale: 'vi_VN', symbol: 'VND').format(controller.bookingData.value.totalPrice)}',
                                              color:
                                                  ColorManager.secondaryColor,
                                              fontWeight: FontWeight.w800),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBoxConst.size(context: context, size: 100),
                              ],
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
        ));
  }

  GestureDetector _buttonSupplier(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        // Get.back();
        // await controller.cancelService(
        //     idService: controller.bookingData.value.listBookingDetail![0].id!);

        Get.bottomSheet(Container(
          height: UtilsReponsive.height(400, context),
          width: double.infinity,
          padding: EdgeInsets.all(UtilsReponsive.height(15, context)),
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(10), topRight: Radius.circular(10))),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(),
                  TextConstant.subTile2(context, text: 'Dịch vụ'),
                  GestureDetector(
                      onTap: () {
                        Get.back();
                      },
                      child: Icon(Icons.close))
                ],
              ),
              TextConstant.subTile3(context,
                  text: 'Các dịch vụ đủ điều kiện huỷ sẽ được hiện ở đây',
                  size: 10),
              Expanded(
                  child: ListView.builder(
                      itemBuilder: (context, index) =>  Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Card(
                                child: ListTile(
                                  title: TextConstant.subTile3(context,
                                      text: controller
                                          .bookingData
                                          .value
                                          .listBookingDetail![index]
                                          .serviceSupplier!
                                          .name!),
                                  trailing:controller.bookingData
                                  .value.listBookingDetail![index].status ==
                              pendingStatus
                          ? GestureDetector(
                                      onTap: () async {
                                        await controller.cancelService(
                                            idService: controller
                                                .bookingData
                                                .value
                                                .listBookingDetail![index]
                                                .id!);
                                      },
                                      child: TextConstant.subTile3(context,
                                          text: 'Huỷ', color: Colors.red)):SizedBox(),
                                ),
                              ),
                            )
                         ,
                      itemCount: controller
                          .bookingData.value.listBookingDetail!.length)),
              GestureDetector(
                onTap: () async{
                  await controller.cancelBooking(idBooking: controller.bookingData.value!.id!);
                },
                child: Container(
                  height: UtilsReponsive.height(50, context),
                  padding: EdgeInsets.symmetric(
                      vertical: UtilsReponsive.height(10, context),
                      horizontal: UtilsReponsive.height(15, context)),
                  decoration: BoxDecoration(color: Colors.redAccent),
                  child: Center(
                    child: Text('Tôi muốn huỷ hết đơn',
                        style: GoogleFonts.roboto(
                            color: Colors.white,
                            fontSize: UtilsReponsive.formatFontSize(14, context),
                            fontWeight: FontWeight.bold)),
                  ),
                ),
              ),
            ],
          ),
        ));
      },
      child: Container(
        height: UtilsReponsive.height(50, context),
        padding: EdgeInsets.symmetric(
            vertical: UtilsReponsive.height(10, context),
            horizontal: UtilsReponsive.height(15, context)),
        decoration: BoxDecoration(color: Colors.redAccent),
        child: Center(
          child: controller.isLockButtonCancel.value
              ? CupertinoActivityIndicator()
              : Text('Huỷ đơn / dịch vụ',
                  style: GoogleFonts.roboto(
                      color: Colors.white,
                      fontSize: UtilsReponsive.formatFontSize(14, context),
                      fontWeight: FontWeight.bold)),
        ),
      ),
    );
  }

  Row _textData(BuildContext context,
      {required String title,
      required String content,
      bool isBoldContent = false}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        TextConstant.subTile2(context,
            fontWeight: FontWeight.w400, text: title, color: Colors.black87),
        TextConstant.subTile1(context,
            text: content,
            fontWeight: isBoldContent ? FontWeight.w800 : FontWeight.w400),
      ],
    );
  }
}

class DashedDivider extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      size: Size(double.infinity, 1),
      painter: DashedLinePainter(),
    );
  }
}

class DashedLinePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    var paint = Paint()
      ..color = Colors.black
      ..strokeWidth = 2;

    var max = size.width;
    var dashWidth = 5;
    var dashSpace = 3;
    double startX = 0;

    while (startX < max) {
      canvas.drawLine(Offset(startX, 0), Offset(startX + dashWidth, 0), paint);
      startX += dashWidth + dashSpace;
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}
