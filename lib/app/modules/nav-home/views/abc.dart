  //  if (![
  //                               cancelStatusService,
  //                               completeSatus,
  //                               rejectStatusService
  //                             ].contains(project.status)) {
  //                               Get.bottomSheet(Container(
  //                                 height: UtilsReponsive.height(300, context),
  //                                 width: double.infinity,
  //                                 padding: EdgeInsets.all(
  //                                     UtilsReponsive.height(15, context)),
  //                                 decoration: BoxDecoration(
  //                                     color: Colors.white,
  //                                     borderRadius: BorderRadius.only(
  //                                         topLeft: Radius.circular(10),
  //                                         topRight: Radius.circular(10))),
  //                                 child: Column(
  //                                   children: [
  //                                     TextConstant.subTile3(context,
  //                                         text: 'Cập nhật trạng thái'),
  //                                     SizedBoxConst.size(context: context),
  //                                     Obx(() => controller.isLockUpdate.value
  //                                         ? CupertinoActivityIndicator()
  //                                         : project.status == pendingStatus
  //                                             ? Column(
  //                                                 children: [
  //                                                   GestureDetector(
  //                                                     onTap: () async {
  //                                                       await controller
  //                                                           .confirmService(
  //                                                               idService: project
  //                                                                   .bookingDetailId!);
  //                                                     },
  //                                                     child: Container(
  //                                                       padding: EdgeInsets.all(
  //                                                           UtilsReponsive
  //                                                               .height(10,
  //                                                                   context)),
  //                                                       decoration: BoxDecoration(
  //                                                           color: ColorManager
  //                                                               .primaryColor,
  //                                                           border: Border.all(
  //                                                               color: Colors
  //                                                                   .grey),
  //                                                           borderRadius:
  //                                                               BorderRadius.circular(
  //                                                                   UtilsReponsive
  //                                                                       .height(
  //                                                                           10,
  //                                                                           context))),
  //                                                       child: Row(
  //                                                         children: [
  //                                                           UtilCommon
  //                                                               .getWidgetByStatus(
  //                                                                   context,
  //                                                                   pendingStatus),
  //                                                           SizedBoxConst
  //                                                               .sizeWith(
  //                                                                   context:
  //                                                                       context),
  //                                                           Icon(Icons
  //                                                               .arrow_forward),
  //                                                           SizedBoxConst
  //                                                               .sizeWith(
  //                                                                   context:
  //                                                                       context),
  //                                                           UtilCommon
  //                                                               .getWidgetByStatus(
  //                                                                   context,
  //                                                                   approvedStatusService),
  //                                                         ],
  //                                                       ),
  //                                                     ),
  //                                                   ),
  //                                                   SizedBoxConst.size(
  //                                                       context: context),
  //                                                   GestureDetector(
  //                                                     onTap: () async {
  //                                                       await controller
  //                                                           .rejectService(
  //                                                               idService: project
  //                                                                   .bookingDetailId!);
  //                                                     },
  //                                                     child: Container(
  //                                                       padding: EdgeInsets.all(
  //                                                           UtilsReponsive
  //                                                               .height(10,
  //                                                                   context)),
  //                                                       decoration: BoxDecoration(
  //                                                           color: ColorManager
  //                                                               .primaryColor,
  //                                                           border: Border.all(
  //                                                               color: Colors
  //                                                                   .grey),
  //                                                           borderRadius:
  //                                                               BorderRadius.circular(
  //                                                                   UtilsReponsive
  //                                                                       .height(
  //                                                                           10,
  //                                                                           context))),
  //                                                       child: Row(
  //                                                         children: [
  //                                                           UtilCommon
  //                                                               .getWidgetByStatus(
  //                                                                   context,
  //                                                                   pendingStatus),
  //                                                           SizedBoxConst
  //                                                               .sizeWith(
  //                                                                   context:
  //                                                                       context),
  //                                                           Icon(Icons
  //                                                               .arrow_forward),
  //                                                           SizedBoxConst
  //                                                               .sizeWith(
  //                                                                   context:
  //                                                                       context),
  //                                                           UtilCommon
  //                                                               .getWidgetByStatus(
  //                                                                   context,
  //                                                                   rejectStatusService),
  //                                                         ],
  //                                                       ),
  //                                                     ),
  //                                                   ),
  //                                                 ],
  //                                               )
  //                                             : project.status ==
  //                                                     processingStatusService
  //                                                 ? GestureDetector(
  //                                                     onTap: () async {
  //                                                       await controller
  //                                                           .completeService(
  //                                                               idService: project
  //                                                                   .bookingDetailId!);
  //                                                     },
  //                                                     child: Container(
  //                                                       padding: EdgeInsets.all(
  //                                                           UtilsReponsive
  //                                                               .height(10,
  //                                                                   context)),
  //                                                       decoration: BoxDecoration(
  //                                                           color: ColorManager
  //                                                               .primaryColor,
  //                                                           border: Border.all(
  //                                                               color: Colors
  //                                                                   .grey),
  //                                                           borderRadius:
  //                                                               BorderRadius.circular(
  //                                                                   UtilsReponsive
  //                                                                       .height(
  //                                                                           10,
  //                                                                           context))),
  //                                                       child: Row(
  //                                                         children: [
  //                                                           UtilCommon
  //                                                               .getWidgetByStatus(
  //                                                                   context,
  //                                                                   processingStatusService),
  //                                                           SizedBoxConst
  //                                                               .sizeWith(
  //                                                                   context:
  //                                                                       context),
  //                                                           Icon(Icons
  //                                                               .arrow_forward),
  //                                                           SizedBoxConst
  //                                                               .sizeWith(
  //                                                                   context:
  //                                                                       context),
  //                                                           UtilCommon
  //                                                               .getWidgetByStatus(
  //                                                                   context,
  //                                                                   completeSatus),
  //                                                         ],
  //                                                       ),
  //                                                     ),
  //                                                   )
  //                                                 : SizedBox())
  //                                   ],
  //                                 ),
  //                               ));
  //                             }