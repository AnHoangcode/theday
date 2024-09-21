import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:theday/app/common/model/booking.dart';
import 'package:theday/app/common/model/booking_detail_supplier.dart';
import 'package:theday/app/resource/base_define.dart';
import 'package:theday/app/resource/form_field_widget.dart';
import 'package:theday/app/resource/reponsive_utils.dart';
import 'package:theday/app/resource/text_style.dart';
import 'package:theday/app/resource/util_common.dart';

import '../controllers/booking_detail_supplier_controller.dart';

class BookingDetailSupplierView
    extends GetView<BookingDetailSupplierController> {
  const BookingDetailSupplierView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
            child: Padding(
              padding:  EdgeInsets.all(UtilsReponsive.height(20, context)),
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
                ],
              ),
              SizedBoxConst.size(context: context),
              Obx(
                () => controller.isLoading.value
                    ? Center(child: CircularProgressIndicator())
                    : Expanded(
                        child: SingleChildScrollView(
                        padding:
                            EdgeInsets.all(UtilsReponsive.height(5, context)),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            _basicInfo(context),
                            SizedBoxConst.size(context: context),
                            TextConstant.subTile1(context,
                                text: 'Danh sách dịch vụ',
                                fontWeight: FontWeight.bold,
                                color: ColorManager.secondaryColor),
                            SizedBoxConst.size(context: context),
                            ListView.separated(
                                primary: false,
                                shrinkWrap: true,
                                itemCount: controller.bookingData.value.length,
                                separatorBuilder: (context, index) =>
                                    SizedBoxConst.size(context: context),
                                itemBuilder: (context, index) {
                                  final booking =
                                      controller.bookingData.value[index];
                                  return GestureDetector(
                                    onTap: () {
                                      if (![
                                        cancelStatusService,
                                        completeSatus,
                                        doneStatusService,
                                        rejectStatusService,
                                        approvedStatusService
                                      ].contains(booking.status)) {
                                        onTapCardService(context,
                                            booking: booking);
                                      }
                                    },
                                    child: SizedBox(
                                      child: Stack(
                                        children: [
                                          Container(
                                            margin: EdgeInsets.only(
                                              top: UtilsReponsive.height(
                                                  22, context),
                                            ),
                                            padding: EdgeInsets.all(
                                                UtilsReponsive.height(
                                                    10, context)),
                                            decoration: BoxDecoration(
                                                border: Border.all(
                                                    color: Colors.grey),
                                                borderRadius:
                                                    BorderRadius.circular(
                                                        UtilsReponsive.height(
                                                            15, context))),
                                            child: Row(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              children: [
                                                Container(
                                                  clipBehavior: Clip.antiAlias,
                                                  decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              UtilsReponsive
                                                                  .height(15,
                                                                      context))),
                                                  width: UtilsReponsive.height(
                                                      100, context),
                                                  height: UtilsReponsive.height(
                                                      100, context),
                                                  child: CachedNetworkImage(
                                                      fit: BoxFit.fill,
                                                      imageUrl: booking
                                                              .serviceSupplierResponse
                                                              ?.listImages?[0] ??
                                                          '',
                                                      placeholder: (context,
                                                              url) =>
                                                          const CircularProgressIndicator(
                                                            color: Colors.white,
                                                          ),
                                                      errorWidget: (context, url,
                                                              error) =>
                                                          Image.asset(
                                                              'asset/theday_logo.png')),
                                                ),
                                                SizedBoxConst.sizeWith(
                                                    context: context),
                                                Expanded(
                                                    child: Column(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.start,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                     SizedBoxConst.size(
                                                        context: context,
                                                        size: 5),
                                                    TextConstant.subTile3(context,
                                                        text:
                                                            '${UtilCommon.convertDateTime(booking.completedDate!)}',
                                                        color: Colors.red,
                                                        ),
                                                    TextConstant.subTile3(context,
                                                        text:
                                                            '${booking.serviceSupplierResponse?.name}'),
                                                    SizedBoxConst.size(
                                                        context: context,
                                                        size: 5),
                                                    TextConstant.subTile3(context,
                                                        text:
                                                            'Số lượng: ${booking.quantity}'),
                                                    SizedBoxConst.size(
                                                        context: context,
                                                        size: 5),
                                                    TextConstant.subTile3(context,
                                                        text:
                                                            'Ghi chú: ${booking.note ?? 'N/A'}'),
                                                    SizedBoxConst.size(
                                                        context: context,
                                                        size: 5),
                                                    TextConstant.subTile3(context,
                                                        text:
                                                            'Giá: ${NumberFormat.currency(locale: 'vi_VN', symbol: 'VND').format(booking.price ?? 0)}',
                                                        color: ColorManager
                                                            .secondaryColor,
                                                        fontWeight:
                                                            FontWeight.bold),
                                                   
                                                  ],
                                                ))
                                              ],
                                            ),
                                          ),
                                          Positioned(
                                              top: UtilsReponsive.height(
                                                  10, context),
                                              right: 0,
                                              child: UtilCommon.getWidgetByStatus(
                                                  context, booking.status!)),
                                        ],
                                      ),
                                    ),
                                  );
                                })
                          ],
                        ),
                      )),
              )
                        ],
                      ),
            )));
  }

  Column _basicInfo(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextConstant.subTile1(context,
            text: 'Thông tin liên hệ',
            fontWeight: FontWeight.bold,
            color: ColorManager.secondaryColor),
        SizedBoxConst.size(context: context),
        Row(
          children: [
            Icon(Icons.phone, color: ColorManager.secondaryColor),
            SizedBoxConst.sizeWith(context: context),
            Expanded(
              child: TextConstant.subTile1(context,
                  text:
                      controller.bookingData[0].couple?.account?.phoneNumber ??
                          '',
                  fontWeight: FontWeight.w400),
            )
          ],
        ),
        SizedBoxConst.size(context: context),
        Row(
          children: [
            Icon(
              CupertinoIcons.location_fill,
              color: ColorManager.secondaryColor,
            ),
            SizedBoxConst.sizeWith(context: context),
            Expanded(
              child: TextConstant.subTile1(context,
                  text: controller
                          .bookingData.value[0].couple?.account?.address ??
                      '',
                  fontWeight: FontWeight.w400),
            )
          ],
        ),
        SizedBoxConst.size(context: context),
        Row(
          children: [
            Icon(
              CupertinoIcons.heart_fill,
              color: ColorManager.secondaryColor,
            ),
            SizedBoxConst.sizeWith(context: context),
            Expanded(
              child: TextConstant.subTile1(context,
                  text: '${controller
                          .bookingData.value[0].couple?.partnerName1} - ${controller
                          .bookingData.value[0].couple?.partnerName2}' ??
                      '',
                  fontWeight: FontWeight.w400),
            )
          ],
        ),
      ],
    );
  }

  onTapCardService(BuildContext context,
      {required BookingDetailSupplier booking}) {
    Get.bottomSheet(Container(
      height: UtilsReponsive.height(300, context),
      width: double.infinity,
      padding: EdgeInsets.all(UtilsReponsive.height(15, context)),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(UtilsReponsive.height(10, context)),
              topRight: Radius.circular(UtilsReponsive.height(10, context)))),
      child: Column(
        children: [
          TextConstant.subTile3(context, text: 'Cập nhật trạng thái'),
          SizedBoxConst.size(context: context),
          Obx(() {
            if (controller.isLockUpdate.value) {
              return const CupertinoActivityIndicator();
            }
            switch (booking.status) {
              case pendingStatusService:
                return _pendingChangeOption(booking, context);
              case processingStatusService:
                return _processChangeOption(booking, context);
              case depositedStatusService:
                return _depositedChangeOption(booking, context);
              default:
                return const SizedBox();
            }
          })
        ],
      ),
    ));
  }

  GestureDetector _depositedChangeOption(
      BookingDetailSupplier booking, BuildContext context) {
    return GestureDetector(
      onTap: () async {
        await controller.processingService(idService: booking.bookingDetailId!);
      },
      child: Container(
        padding: EdgeInsets.all(UtilsReponsive.height(10, context)),
        decoration: BoxDecoration(
            color: ColorManager.primaryColor,
            border: Border.all(color: Colors.grey),
            borderRadius:
                BorderRadius.circular(UtilsReponsive.height(10, context))),
        child: Row(
          children: [
            UtilCommon.getWidgetByStatus(context, depositedStatusService),
            SizedBoxConst.sizeWith(context: context),
            Icon(Icons.arrow_forward),
            SizedBoxConst.sizeWith(context: context),
            UtilCommon.getWidgetByStatus(context, processingStatusService),
          ],
        ),
      ),
    );
  }

  GestureDetector _processChangeOption(
      BookingDetailSupplier booking, BuildContext context) {
    return GestureDetector(
      onTap: () async {
        Get.back();
        await controller.doneService(idService: booking.bookingDetailId!);
      },
      child: Container(
        padding: EdgeInsets.all(UtilsReponsive.height(10, context)),
        decoration: BoxDecoration(
            color: ColorManager.primaryColor,
            border: Border.all(color: Colors.grey),
            borderRadius:
                BorderRadius.circular(UtilsReponsive.height(10, context))),
        child: Row(
          children: [
            UtilCommon.getWidgetByStatus(context, processingStatusService),
            SizedBoxConst.sizeWith(context: context),
            Icon(Icons.arrow_forward),
            SizedBoxConst.sizeWith(context: context),
            UtilCommon.getWidgetByStatus(context, completeSatus),
          ],
        ),
      ),
    );
  }

  Column _pendingChangeOption(
      BookingDetailSupplier booking, BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          onTap: () async {
            await controller.confirmService(
                idService: booking.bookingDetailId!);
          },
          child: Container(
            padding: EdgeInsets.all(UtilsReponsive.height(10, context)),
            decoration: BoxDecoration(
                color: ColorManager.primaryColor,
                border: Border.all(color: Colors.grey),
                borderRadius:
                    BorderRadius.circular(UtilsReponsive.height(10, context))),
            child: Row(
              children: [
                UtilCommon.getWidgetByStatus(context, pendingStatus),
                SizedBoxConst.sizeWith(context: context),
                Icon(Icons.arrow_forward),
                SizedBoxConst.sizeWith(context: context),
                UtilCommon.getWidgetByStatus(context, approvedStatusService),
              ],
            ),
          ),
        ),
        SizedBoxConst.size(context: context),
        GestureDetector(
          onTap: () async {
            _bottomCancel(booking, context);
          },
          child: Container(
            padding: EdgeInsets.all(UtilsReponsive.height(10, context)),
            decoration: BoxDecoration(
                color: ColorManager.primaryColor,
                border: Border.all(color: Colors.grey),
                borderRadius:
                    BorderRadius.circular(UtilsReponsive.height(10, context))),
            child: Row(
              children: [
                UtilCommon.getWidgetByStatus(context, pendingStatus),
                SizedBoxConst.sizeWith(context: context),
                Icon(Icons.arrow_forward),
                SizedBoxConst.sizeWith(context: context),
                UtilCommon.getWidgetByStatus(context, rejectStatusService),
              ],
            ),
          ),
        ),
      ],
    );
  }

  _bottomCancel(
    BookingDetailSupplier booking,
    BuildContext context,
  ) {
    Get.bottomSheet(Container(
      padding: EdgeInsets.all(UtilsReponsive.height(15, context)),
      height: UtilsReponsive.height(400, context),
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(UtilsReponsive.height(15, context)),
      ),
      child: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextConstant.subTile3(context, text: 'Lý do từ chối'),
            SizedBoxConst.size(context: context),
            ListView.separated(
                shrinkWrap: true,
                itemBuilder: (context, index) => GestureDetector(
                      onTap: () {
                        controller.reasonChoice(
                            controller.templateReasonCancel[index]);
                      },
                      child: Row(
                        children: [
                          Obx(
                            () => Icon(controller.reasonChoice !=
                                    controller.templateReasonCancel[index]
                                ? Icons.radio_button_off_outlined
                                : Icons.radio_button_checked),
                          ),
                          SizedBox(width: UtilsReponsive.height(10, context)),
                          TextConstant.subTile2(context,
                              text: controller.templateReasonCancel[index])
                        ],
                      ),
                    ),
                separatorBuilder: (context, index) => SizedBox(
                      height: UtilsReponsive.height(10, context),
                    ),
                itemCount: controller.templateReasonCancel.length),
            SizedBox(height: UtilsReponsive.height(10, context)),
            Obx(() => Visibility(
                  // ignore: unrelated_type_equality_checks
                  visible: controller.reasonChoice == 'Khác',
                  child: FormFieldWidget(
                      padding: UtilsReponsive.width(10, context),
                      controllerEditting: controller.textEdittingController,
                      radiusBorder: UtilsReponsive.height(15, context),
                      fillColor: Colors.grey.withOpacity(0.3),
                      setValueFunc: (value) {}),
                )),
            GestureDetector(
              onTap: () async {
                await controller.rejectService(
                    idService: booking.bookingDetailId!);
              },
              child: Container(
                margin: EdgeInsets.only(
                  top: UtilsReponsive.height(10, context),
                ),
                padding: EdgeInsets.symmetric(
                    vertical: UtilsReponsive.height(10, context),
                    horizontal: UtilsReponsive.height(15, context)),
                decoration: BoxDecoration(
                    color: Colors.redAccent,
                    border: Border.all(color: Colors.white),
                    borderRadius: BorderRadius.circular(
                        UtilsReponsive.height(10, context))
                    // shape: BoxShape.circle,
                    ),
                child: Text('Xác nhận',
                    style: GoogleFonts.montserrat(
                        color: Colors.white,
                        fontSize: UtilsReponsive.formatFontSize(13, context),
                        fontWeight: FontWeight.w600)),
              ),
            ),
          ],
        ),
      ),
    ));
  }
}
