import 'package:expand_tap_area/expand_tap_area.dart';
import 'package:find_my_doctor/App/locator.dart';
import 'package:find_my_doctor/Utils/color_utils.dart';
import 'package:find_my_doctor/Utils/extensions.dart';
import 'package:find_my_doctor/Utils/font_utils.dart';
import 'package:find_my_doctor/Utils/image_utils.dart';
import 'package:find_my_doctor/ViewModels/main_view_model.dart';
import 'package:find_my_doctor/Widgets/forward_button_black.dart';
import 'package:find_my_doctor/Widgets/page_horizontal_margin.dart';
import 'package:find_my_doctor/Widgets/text_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:page_transition/page_transition.dart';
import 'package:stacked/stacked.dart';

import '../../Utils/whole_page_loader.dart';
import '../../Widgets/bottom_navigation_bar.dart';
import 'appointment_details.dart';
import 'appointment_details_doc.dart';
import 'appointment_details_lab.dart';

class BookingsMainScreen extends StatefulWidget {
  const BookingsMainScreen({Key? key}) : super(key: key);

  @override
  State<BookingsMainScreen> createState() => _BookingsMainScreenState();
}

class _BookingsMainScreenState extends State<BookingsMainScreen> {
  int selectedTabIndex = 0;

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<MainViewModel>.reactive(
      viewModelBuilder: () => locator<MainViewModel>(),
      disposeViewModel: false,
      onViewModelReady: (model) async {
        await model.gettingDoctorActive(context, model.token!);
        await model.gettingDoctorMyhistory(context, model.token!);
        await model.gettingActiveLabBooking(context, model.token!);
        await model.gettingHistoryLabBooking(context, model.token!);
        await model.gettingPharmacyActive(context, model.token!);
        await model.gettingPharmacyHistory(context, model.token!);
      },
      builder: (context, model, child) {
        return model.activeLabBookingLoader || model.historyLabBookingLoader
            ? WholePageLoader()
            : DefaultTabController(
                length: 2,
                child: SafeArea(
                  child: Scaffold(
                    backgroundColor: Colors.white,
                    body: Column(
                      children: [
                        Column(
                          children: [
                            SizedBox(
                              height: context.getPadding().top,
                              child: Padding(
                                padding: EdgeInsets.only(left: 10),
                                child: Row(
                                  children: [
                                    ExpandTapWidget(
                                      onTap: () {
                                        model.navigationService.navigateToUntil(
                                            to: MyBottomNavBar());
                                        //Navigator.pop(context);
                                      },
                                      tapPadding: EdgeInsets.all(50),
                                      child: SvgPicture.asset(
                                          ImageUtils.backArrowRed),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(left: 4.w),
                                      child: TextWidget(
                                        textValue: "Appointment",
                                        fontFamily: FontUtils.interSemiBold,
                                        fontSize: 2.t,
                                        textColor: ColorUtils.red,
                                      ),
                                    ),
                                    SizedBox(
                                      width: 2.w,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            //TopMarginHome(),
                            SizedBox(
                              height: 6.5.h,
                              child: AppBar(
                                elevation: 3,
                                backgroundColor: ColorUtils.white,
                                bottom: TabBar(
                                  onTap: (value) {
                                    setState(() {
                                      selectedTabIndex = value;
                                    });
                                  },
                                  indicator: UnderlineTabIndicator(
                                    borderSide: BorderSide(
                                        width: 2.0, color: ColorUtils.red),
                                    insets:
                                        EdgeInsets.symmetric(horizontal: 10.w),
                                  ),
                                  indicatorColor: ColorUtils.red,
                                  labelColor: ColorUtils.red,
                                  unselectedLabelColor: ColorUtils.silver,
                                  tabs: [
                                    Tab(
                                      text: "Active Bookings",
                                    ),
                                    Tab(
                                      text: "Booking History",
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                        Expanded(
                          child: PageHorizontalMargin(
                            widget: Column(
                              children: [
                                Expanded(
                                  child: TabBarView(
                                    physics: NeverScrollableScrollPhysics(),
                                    children: [
                                      SingleChildScrollView(
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            SizedBox(
                                              height: 3.h,
                                            ),
                                            TextWidget(
                                              textValue: "Doctor Appointment",
                                              textColor: ColorUtils.blackShade,
                                              fontFamily: FontUtils.interMedium,
                                              fontSize: 1.9.t,
                                            ),
                                            SizedBox(
                                              height: 3.h,
                                            ),
                                            ListView.separated(
                                                shrinkWrap: true,
                                                physics:
                                                    NeverScrollableScrollPhysics(),
                                                itemBuilder: (context, index) {
                                                  return Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      InkWell(
                                                        onTap: () {
                                                          Navigator.push(
                                                              context,
                                                              PageTransition(
                                                                  type:
                                                                      PageTransitionType
                                                                          .fade,
                                                                  child:
                                                                      Appointment_Details_Doc(
                                                                    oderId: model
                                                                        .doctormyactive![
                                                                            index]
                                                                        .id
                                                                        .toString(),
                                                                  )));
                                                        },
                                                        child: Row(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .spaceBetween,
                                                          children: [
                                                            Padding(
                                                              padding: EdgeInsets
                                                                  .only(
                                                                      left:
                                                                          2.w),
                                                              child: Column(
                                                                crossAxisAlignment:
                                                                    CrossAxisAlignment
                                                                        .start,
                                                                children: [
                                                                  TextWidget(
                                                                    textValue: model
                                                                        .doctormyactive![
                                                                            index]
                                                                        .appoint_type
                                                                        .toString(),
                                                                    textColor:
                                                                        ColorUtils
                                                                            .blackShade,
                                                                    fontFamily:
                                                                        FontUtils
                                                                            .interRegular,
                                                                    fontSize:
                                                                        1.6.t,
                                                                  ),
                                                                  // Row(
                                                                  //   children: [
                                                                  //     TextWidget(
                                                                  //       textValue:
                                                                  //           "booking id: ",
                                                                  //       textColor:
                                                                  //           ColorUtils.blackShade,
                                                                  //       fontFamily:
                                                                  //           FontUtils.interRegular,
                                                                  //       fontSize:
                                                                  //           1.6.t,
                                                                  //     ),
                                                                  //     TextWidget(
                                                                  //       textValue: model
                                                                  //           .doctormyactive![index]
                                                                  //           .id
                                                                  //           .toString(),
                                                                  //       textColor:
                                                                  //           ColorUtils.blackShade,
                                                                  //       fontFamily:
                                                                  //           FontUtils.interRegular,
                                                                  //       fontSize:
                                                                  //           1.6.t,
                                                                  //     ),
                                                                  //   ],
                                                                  // ),
                                                                  // TextWidget(
                                                                  //   textValue:
                                                                  //       "Lab Order",
                                                                  //   textColor:
                                                                  //       ColorUtils
                                                                  //           .red,
                                                                  //   fontFamily:
                                                                  //       FontUtils
                                                                  //           .interSemiBold,
                                                                  //   fontSize:
                                                                  //       1.8.t,
                                                                  // ),
                                                                  SizedBox(
                                                                    height:
                                                                        0.75.h,
                                                                  ),

                                                                  Row(
                                                                    children: [
                                                                      TextWidget(
                                                                        textValue:
                                                                            "Patient: ",
                                                                        textColor:
                                                                            ColorUtils.blackShade,
                                                                        fontFamily:
                                                                            FontUtils.interRegular,
                                                                        fontSize:
                                                                            1.6.t,
                                                                      ),
                                                                      TextWidget(
                                                                        textValue: model
                                                                            .doctormyactive![index]
                                                                            .appointment_user
                                                                            .toString(),
                                                                        textColor:
                                                                            ColorUtils.blackShade,
                                                                        fontFamily:
                                                                            FontUtils.interRegular,
                                                                        fontSize:
                                                                            1.6.t,
                                                                      ),
                                                                    ],
                                                                  ),
                                                                  SizedBox(
                                                                    height:
                                                                        0.75.h,
                                                                  ),

                                                                  Row(
                                                                    children: [
                                                                      // TextWidget(
                                                                      //   textValue:
                                                                      //       "Doctor Consultation Type: ",
                                                                      //   textColor:
                                                                      //       ColorUtils.blackShade,
                                                                      //   fontFamily:
                                                                      //       FontUtils.interRegular,
                                                                      //   fontSize:
                                                                      //       1.6.t,
                                                                      // ),
                                                                      TextWidget(
                                                                        textValue: model.doctormyactive![index].doctor_consultation_type ==
                                                                                null
                                                                            ? ''
                                                                            : "Doctor Consultation Type: " +
                                                                                model.doctormyactive![index].doctor_consultation_type.toString(),
                                                                        textColor:
                                                                            ColorUtils.blackShade,
                                                                        fontFamily:
                                                                            FontUtils.interRegular,
                                                                        fontSize:
                                                                            1.6.t,
                                                                      ),
                                                                    ],
                                                                  ),
                                                                  SizedBox(
                                                                    height:
                                                                        0.75.h,
                                                                  ),
                                                                ],
                                                              ),
                                                            ),
                                                            Row(
                                                              children: [
                                                                TextWidget(
                                                                  textValue:
                                                                      "Rs. ",
                                                                  textColor:
                                                                      ColorUtils
                                                                          .lightGreen,
                                                                  fontFamily:
                                                                      FontUtils
                                                                          .interSemiBold,
                                                                  fontSize:
                                                                      1.8.t,
                                                                ),
                                                                TextWidget(
                                                                  textValue: model
                                                                      .doctormyactive?[
                                                                          index]
                                                                      .amount
                                                                      .toString(),
                                                                  textColor:
                                                                      ColorUtils
                                                                          .lightGreen,
                                                                  fontFamily:
                                                                      FontUtils
                                                                          .interSemiBold,
                                                                  fontSize:
                                                                      1.8.t,
                                                                ),
                                                                ForwardButtonBlack(),
                                                              ],
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    ],
                                                  );
                                                },
                                                separatorBuilder:
                                                    (context, index) {
                                                  return Divider();
                                                },
                                                itemCount: model.doctormyactive
                                                        ?.length ??
                                                    0),
                                            SizedBox(
                                              height: 3.h,
                                            ),
                                            TextWidget(
                                              textValue: "Lab Appointment",
                                              textColor: ColorUtils.blackShade,
                                              fontFamily: FontUtils.interMedium,
                                              fontSize: 1.9.t,
                                            ),
                                            SizedBox(
                                              height: 3.h,
                                            ),
                                            ListView.separated(
                                                shrinkWrap: true,
                                                physics:
                                                    NeverScrollableScrollPhysics(),
                                                itemBuilder: (context, index) {
                                                  return Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      // TextWidget(
                                                      //   textValue: model
                                                      //       .activeLabBookingModel?[
                                                      //           index]
                                                      //       .id
                                                      //       .toString(),
                                                      //   textColor: ColorUtils
                                                      //       .blackShade,
                                                      //   fontFamily: FontUtils
                                                      //       .interRegular,
                                                      //   fontSize: 1.6.t,
                                                      // ),
                                                      InkWell(
                                                        onTap: () {
                                                          Navigator.push(
                                                              context,
                                                              PageTransition(
                                                                  type:
                                                                      PageTransitionType
                                                                          .fade,
                                                                  child:
                                                                      Appointment_Details_Lab(
                                                                    oderId: model
                                                                        .activeLabBookingModel?[
                                                                            index]
                                                                        .id
                                                                        .toString(),
                                                                  )));
                                                        },
                                                        child: Row(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .spaceBetween,
                                                          children: [
                                                            Padding(
                                                              padding: EdgeInsets
                                                                  .only(
                                                                      left:
                                                                          2.w),
                                                              child: Column(
                                                                crossAxisAlignment:
                                                                    CrossAxisAlignment
                                                                        .start,
                                                                children: [
                                                                  TextWidget(
                                                                    textValue:
                                                                        "Lab Order",
                                                                    textColor:
                                                                        ColorUtils
                                                                            .red,
                                                                    fontFamily:
                                                                        FontUtils
                                                                            .interSemiBold,
                                                                    fontSize:
                                                                        1.8.t,
                                                                  ),
                                                                  SizedBox(
                                                                    height:
                                                                        0.75.h,
                                                                  ),
                                                                  Row(
                                                                    children: [
                                                                      TextWidget(
                                                                        textValue:
                                                                            "Patient: ",
                                                                        textColor:
                                                                            ColorUtils.blackShade,
                                                                        fontFamily:
                                                                            FontUtils.interRegular,
                                                                        fontSize:
                                                                            1.6.t,
                                                                      ),
                                                                      TextWidget(
                                                                        textValue: model
                                                                            .activeLabBookingModel?[index]
                                                                            .name,
                                                                        textColor:
                                                                            ColorUtils.blackShade,
                                                                        fontFamily:
                                                                            FontUtils.interRegular,
                                                                        fontSize:
                                                                            1.6.t,
                                                                      ),
                                                                    ],
                                                                  ),
                                                                ],
                                                              ),
                                                            ),
                                                            Row(
                                                              children: [
                                                                TextWidget(
                                                                  textValue:
                                                                      "Rs. ",
                                                                  textColor:
                                                                      ColorUtils
                                                                          .lightGreen,
                                                                  fontFamily:
                                                                      FontUtils
                                                                          .interSemiBold,
                                                                  fontSize:
                                                                      1.8.t,
                                                                ),
                                                                TextWidget(
                                                                  textValue: model
                                                                      .activeLabBookingModel?[
                                                                          index]
                                                                      .amount
                                                                      .toString(),
                                                                  textColor:
                                                                      ColorUtils
                                                                          .lightGreen,
                                                                  fontFamily:
                                                                      FontUtils
                                                                          .interSemiBold,
                                                                  fontSize:
                                                                      1.8.t,
                                                                ),
                                                                ForwardButtonBlack(),
                                                              ],
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    ],
                                                  );
                                                },
                                                separatorBuilder:
                                                    (context, index) {
                                                  return Divider();
                                                },
                                                itemCount: model
                                                        .activeLabBookingModel
                                                        ?.length ??
                                                    0),
                                            SizedBox(
                                              height: 3.h,
                                            ),
                                            TextWidget(
                                              textValue: "Pharmacy Order",
                                              textColor: ColorUtils.blackShade,
                                              fontFamily: FontUtils.interMedium,
                                              fontSize: 1.9.t,
                                            ),
                                            SizedBox(
                                              height: 3.h,
                                            ),

                                            ListView.separated(
                                                shrinkWrap: true,
                                                physics:
                                                    NeverScrollableScrollPhysics(),
                                                itemBuilder: (context, index) {
                                                  return Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      InkWell(
                                                        onTap: () {
                                                          Navigator.push(
                                                              context,
                                                              PageTransition(
                                                                  type:
                                                                      PageTransitionType
                                                                          .fade,
                                                                  child:
                                                                      Appointment_Details()
                                                                  //     Appointment_Details_Doc(
                                                                  //   oderId: model
                                                                  //       .doctormyactive![
                                                                  //           index]
                                                                  //       .id
                                                                  //       .toString(),
                                                                  // )
                                                                  ));
                                                        },
                                                        child: Row(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .spaceBetween,
                                                          children: [
                                                            Padding(
                                                              padding: EdgeInsets
                                                                  .only(
                                                                      left:
                                                                          2.w),
                                                              child: Column(
                                                                crossAxisAlignment:
                                                                    CrossAxisAlignment
                                                                        .start,
                                                                children: [
                                                                  // TextWidget(
                                                                  //   textValue: model
                                                                  //       .doctormyactive![
                                                                  //           index]
                                                                  //       .appoint_type
                                                                  //       .toString(),
                                                                  //   textColor:
                                                                  //       ColorUtils
                                                                  //           .blackShade,
                                                                  //   fontFamily:
                                                                  //       FontUtils
                                                                  //           .interRegular,
                                                                  //   fontSize:
                                                                  //       1.6.t,
                                                                  // ),

                                                                  SizedBox(
                                                                    height:
                                                                        0.75.h,
                                                                  ),

                                                                  Row(
                                                                    children: [
                                                                      TextWidget(
                                                                        textValue:
                                                                            "Patient: ",
                                                                        textColor:
                                                                            ColorUtils.blackShade,
                                                                        fontFamily:
                                                                            FontUtils.interRegular,
                                                                        fontSize:
                                                                            1.6.t,
                                                                      ),
                                                                      TextWidget(
                                                                        textValue: model
                                                                            .pharmacymyactive![index]
                                                                            .name
                                                                            .toString(),
                                                                        textColor:
                                                                            ColorUtils.blackShade,
                                                                        fontFamily:
                                                                            FontUtils.interRegular,
                                                                        fontSize:
                                                                            1.6.t,
                                                                      ),
                                                                    ],
                                                                  ),
                                                                  SizedBox(
                                                                    height:
                                                                        0.75.h,
                                                                  ),
                                                                  Row(
                                                                    children: [
                                                                      TextWidget(
                                                                        textValue:
                                                                            "Delivery_status: ",
                                                                        textColor:
                                                                            ColorUtils.blackShade,
                                                                        fontFamily:
                                                                            FontUtils.interRegular,
                                                                        fontSize:
                                                                            1.6.t,
                                                                      ),
                                                                      TextWidget(
                                                                        textValue: model
                                                                            .pharmacymyactive![index]
                                                                            .delivery_status
                                                                            .toString(),
                                                                        textColor:
                                                                            ColorUtils.blackShade,
                                                                        fontFamily:
                                                                            FontUtils.interRegular,
                                                                        fontSize:
                                                                            1.6.t,
                                                                      ),
                                                                    ],
                                                                  ),
                                                                  SizedBox(
                                                                    height:
                                                                        0.75.h,
                                                                  ),
                                                                ],
                                                              ),
                                                            ),
                                                            Row(
                                                              children: [
                                                                TextWidget(
                                                                  textValue:
                                                                      "Rs. ",
                                                                  textColor:
                                                                      ColorUtils
                                                                          .lightGreen,
                                                                  fontFamily:
                                                                      FontUtils
                                                                          .interSemiBold,
                                                                  fontSize:
                                                                      1.8.t,
                                                                ),
                                                                TextWidget(
                                                                  textValue: model
                                                                      .pharmacymyactive?[
                                                                          index]
                                                                      .amount
                                                                      .toString(),
                                                                  textColor:
                                                                      ColorUtils
                                                                          .lightGreen,
                                                                  fontFamily:
                                                                      FontUtils
                                                                          .interSemiBold,
                                                                  fontSize:
                                                                      1.8.t,
                                                                ),
                                                                ForwardButtonBlack(),
                                                              ],
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    ],
                                                  );
                                                },
                                                separatorBuilder:
                                                    (context, index) {
                                                  return Divider();
                                                },
                                                itemCount: model
                                                        .pharmacymyactive
                                                        ?.length ??
                                                    0),
                                            // ListView.separated(
                                            //     shrinkWrap: true,
                                            //     physics:
                                            //         NeverScrollableScrollPhysics(),
                                            //     itemBuilder: (context, index) {
                                            //       return Column(
                                            //         crossAxisAlignment:
                                            //             CrossAxisAlignment
                                            //                 .start,
                                            //         children: [
                                            //           InkWell(
                                            //             onTap: () {
                                            //               Navigator.push(
                                            //                   context,
                                            //                   PageTransition(
                                            //                       type:
                                            //                           PageTransitionType
                                            //                               .fade,
                                            //                       child:
                                            //                           Appointment_Details()));
                                            //             },
                                            //             child: Row(
                                            //               mainAxisAlignment:
                                            //                   MainAxisAlignment
                                            //                       .spaceBetween,
                                            //               children: [
                                            //                 Padding(
                                            //                   padding: EdgeInsets
                                            //                       .only(
                                            //                           left:
                                            //                               2.w),
                                            //                   child: Column(
                                            //                     crossAxisAlignment:
                                            //                         CrossAxisAlignment
                                            //                             .start,
                                            //                     children: [
                                            //                       TextWidget(
                                            //                         textValue: model
                                            //                                 .activeBookings[index]
                                            //                             [
                                            //                             "orderType"],
                                            //                         textColor:
                                            //                             ColorUtils
                                            //                                 .red,
                                            //                         fontFamily:
                                            //                             FontUtils
                                            //                                 .interSemiBold,
                                            //                         fontSize:
                                            //                             1.8.t,
                                            //                       ),
                                            //                       SizedBox(
                                            //                         height:
                                            //                             0.75.h,
                                            //                       ),
                                            //                       TextWidget(
                                            //                         textValue: model
                                            //                                 .activeBookings[index]
                                            //                             [
                                            //                             "patient"],
                                            //                         textColor:
                                            //                             ColorUtils
                                            //                                 .blackShade,
                                            //                         fontFamily:
                                            //                             FontUtils
                                            //                                 .interRegular,
                                            //                         fontSize:
                                            //                             1.6.t,
                                            //                       ),
                                            //                     ],
                                            //                   ),
                                            //                 ),
                                            //                 Row(
                                            //                   children: [
                                            //                     TextWidget(
                                            //                       textValue: model
                                            //                                   .activeBookings[
                                            //                               index]
                                            //                           [
                                            //                           "amount"],
                                            //                       textColor:
                                            //                           ColorUtils
                                            //                               .lightGreen,
                                            //                       fontFamily:
                                            //                           FontUtils
                                            //                               .interSemiBold,
                                            //                       fontSize:
                                            //                           1.8.t,
                                            //                     ),
                                            //                     ForwardButtonBlack(),
                                            //                   ],
                                            //                 ),
                                            //               ],
                                            //             ),
                                            //           ),
                                            //         ],
                                            //       );
                                            //     },
                                            //     separatorBuilder:
                                            //         (context, index) {
                                            //       return Divider();
                                            //     },
                                            //     itemCount: model
                                            //         .activeBookings.length),
                                          ],
                                        ),
                                      ),
                                      SingleChildScrollView(
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            SizedBox(
                                              height: 3.h,
                                            ),
                                            TextWidget(
                                              textValue: "Doctor Appointment",
                                              textColor: ColorUtils.blackShade,
                                              fontFamily: FontUtils.interMedium,
                                              fontSize: 1.9.t,
                                            ),
                                            SizedBox(
                                              height: 3.h,
                                            ),
                                            ListView.separated(
                                                shrinkWrap: true,
                                                physics:
                                                    NeverScrollableScrollPhysics(),
                                                itemBuilder: (context, index) {
                                                  return Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      InkWell(
                                                        onTap: () {
                                                          Navigator.push(
                                                              context,
                                                              PageTransition(
                                                                  type:
                                                                      PageTransitionType
                                                                          .fade,
                                                                  child:
                                                                      Appointment_Details_Doc(
                                                                    oderId: model
                                                                        .doctormyhistory![
                                                                            index]
                                                                        .id
                                                                        .toString(),
                                                                  )));
                                                        },
                                                        child: Row(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .spaceBetween,
                                                          children: [
                                                            Padding(
                                                              padding: EdgeInsets
                                                                  .only(
                                                                      left:
                                                                          2.w),
                                                              child: Column(
                                                                crossAxisAlignment:
                                                                    CrossAxisAlignment
                                                                        .start,
                                                                children: [
                                                                  TextWidget(
                                                                    textValue: model
                                                                        .doctormyhistory![
                                                                            index]
                                                                        .appoint_type
                                                                        .toString(),
                                                                    textColor:
                                                                        ColorUtils
                                                                            .blackShade,
                                                                    fontFamily:
                                                                        FontUtils
                                                                            .interRegular,
                                                                    fontSize:
                                                                        1.6.t,
                                                                  ),
                                                                  // Row(
                                                                  //   children: [
                                                                  //     TextWidget(
                                                                  //       textValue:
                                                                  //           "booking id: ",
                                                                  //       textColor:
                                                                  //           ColorUtils.blackShade,
                                                                  //       fontFamily:
                                                                  //           FontUtils.interRegular,
                                                                  //       fontSize:
                                                                  //           1.6.t,
                                                                  //     ),
                                                                  //     TextWidget(
                                                                  //       textValue: model
                                                                  //           .doctormyhistory![index]
                                                                  //           .id
                                                                  //           .toString(),
                                                                  //       textColor:
                                                                  //           ColorUtils.blackShade,
                                                                  //       fontFamily:
                                                                  //           FontUtils.interRegular,
                                                                  //       fontSize:
                                                                  //           1.6.t,
                                                                  //     ),
                                                                  //   ],
                                                                  // ),

                                                                  SizedBox(
                                                                    height:
                                                                        0.75.h,
                                                                  ),
                                                                  Row(
                                                                    children: [
                                                                      TextWidget(
                                                                        textValue:
                                                                            "Patient: ",
                                                                        textColor:
                                                                            ColorUtils.blackShade,
                                                                        fontFamily:
                                                                            FontUtils.interRegular,
                                                                        fontSize:
                                                                            1.6.t,
                                                                      ),
                                                                      TextWidget(
                                                                        textValue: model
                                                                            .doctormyhistory![index]
                                                                            .appointment_user
                                                                            .toString(),
                                                                        textColor:
                                                                            ColorUtils.blackShade,
                                                                        fontFamily:
                                                                            FontUtils.interRegular,
                                                                        fontSize:
                                                                            1.6.t,
                                                                      ),
                                                                    ],
                                                                  ),
                                                                ],
                                                              ),
                                                            ),
                                                            Row(
                                                              children: [
                                                                TextWidget(
                                                                  textValue:
                                                                      "Rs. ",
                                                                  textColor:
                                                                      ColorUtils
                                                                          .lightGreen,
                                                                  fontFamily:
                                                                      FontUtils
                                                                          .interSemiBold,
                                                                  fontSize:
                                                                      1.8.t,
                                                                ),
                                                                TextWidget(
                                                                  textValue: model
                                                                      .doctormyhistory?[
                                                                          index]
                                                                      .amount
                                                                      .toString(),
                                                                  textColor:
                                                                      ColorUtils
                                                                          .lightGreen,
                                                                  fontFamily:
                                                                      FontUtils
                                                                          .interSemiBold,
                                                                  fontSize:
                                                                      1.8.t,
                                                                ),
                                                                ForwardButtonBlack(),
                                                              ],
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                      SizedBox(
                                                        height: 0.75.h,
                                                      ),
                                                      Padding(
                                                        padding:
                                                            EdgeInsets.only(
                                                                left: 2.w),
                                                        child: Row(
                                                          children: [
                                                            // TextWidget(
                                                            //   textValue:
                                                            //       "Doctor Consultation Type: ",
                                                            //   textColor:
                                                            //       ColorUtils
                                                            //           .blackShade,
                                                            //   fontFamily: FontUtils
                                                            //       .interRegular,
                                                            //   fontSize: 1.6.t,
                                                            // ),
                                                            TextWidget(
                                                              textValue: model
                                                                          .doctormyhistory![
                                                                              index]
                                                                          .doctor_consultation_type ==
                                                                      null
                                                                  ? ''
                                                                  : "Doctor Consultation Type: " +
                                                                      model
                                                                          .doctormyhistory![
                                                                              index]
                                                                          .doctor_consultation_type
                                                                          .toString(),
                                                              // model
                                                              //     .doctormyhistory![
                                                              //         index]
                                                              //     .doctor_consultation_type
                                                              //     .toString(),
                                                              textColor:
                                                                  ColorUtils
                                                                      .blackShade,
                                                              fontFamily: FontUtils
                                                                  .interRegular,
                                                              fontSize: 1.6.t,
                                                            ),
                                                          ],
                                                        ),
                                                      )
                                                    ],
                                                  );
                                                },
                                                separatorBuilder:
                                                    (context, index) {
                                                  return Divider();
                                                },
                                                itemCount: model.doctormyhistory
                                                        ?.length ??
                                                    0),
                                            // ListView.separated(
                                            //     shrinkWrap: true,
                                            //     physics:
                                            //         NeverScrollableScrollPhysics(),
                                            //     itemBuilder: (context, index) {
                                            //       return Column(
                                            //         crossAxisAlignment:
                                            //             CrossAxisAlignment
                                            //                 .start,
                                            //         children: [
                                            //           InkWell(
                                            //             onTap: () {
                                            //               Navigator.push(
                                            //                   context,
                                            //                   PageTransition(
                                            //                       type:
                                            //                           PageTransitionType
                                            //                               .fade,
                                            //                       child:
                                            //                           Appointment_Details()));
                                            //             },
                                            //             child: Row(
                                            //               mainAxisAlignment:
                                            //                   MainAxisAlignment
                                            //                       .spaceBetween,
                                            //               children: [
                                            //                 Padding(
                                            //                   padding: EdgeInsets
                                            //                       .only(
                                            //                           left:
                                            //                               2.w),
                                            //                   child: Column(
                                            //                     crossAxisAlignment:
                                            //                         CrossAxisAlignment
                                            //                             .start,
                                            //                     children: [
                                            //                       TextWidget(
                                            //                         textValue: model
                                            //                                 .activeBookings[index]
                                            //                             [
                                            //                             "orderType"],
                                            //                         textColor:
                                            //                             ColorUtils
                                            //                                 .red,
                                            //                         fontFamily:
                                            //                             FontUtils
                                            //                                 .interSemiBold,
                                            //                         fontSize:
                                            //                             1.8.t,
                                            //                       ),
                                            //                       SizedBox(
                                            //                         height:
                                            //                             0.75.h,
                                            //                       ),
                                            //                       TextWidget(
                                            //                         textValue: model
                                            //                                 .activeBookings[index]
                                            //                             [
                                            //                             "patient"],
                                            //                         textColor:
                                            //                             ColorUtils
                                            //                                 .blackShade,
                                            //                         fontFamily:
                                            //                             FontUtils
                                            //                                 .interRegular,
                                            //                         fontSize:
                                            //                             1.6.t,
                                            //                       ),
                                            //                     ],
                                            //                   ),
                                            //                 ),
                                            //                 Row(
                                            //                   children: [
                                            //                     TextWidget(
                                            //                       textValue: model
                                            //                                   .activeBookings[
                                            //                               index]
                                            //                           [
                                            //                           "amount"],
                                            //                       textColor:
                                            //                           ColorUtils
                                            //                               .lightGreen,
                                            //                       fontFamily:
                                            //                           FontUtils
                                            //                               .interSemiBold,
                                            //                       fontSize:
                                            //                           1.8.t,
                                            //                     ),
                                            //                     ForwardButtonBlack(),
                                            //                   ],
                                            //                 ),
                                            //               ],
                                            //             ),
                                            //           ),
                                            //         ],
                                            //       );
                                            //     },
                                            //     separatorBuilder:
                                            //         (context, index) {
                                            //       return Divider();
                                            //     },
                                            //     itemCount: model
                                            //         .activeBookings.length),
                                            SizedBox(
                                              height: 3.h,
                                            ),
                                            TextWidget(
                                              textValue: "Lab Appointment",
                                              textColor: ColorUtils.blackShade,
                                              fontFamily: FontUtils.interMedium,
                                              fontSize: 1.9.t,
                                            ),
                                            SizedBox(
                                              height: 3.h,
                                            ),
                                            ListView.separated(
                                                shrinkWrap: true,
                                                physics:
                                                    NeverScrollableScrollPhysics(),
                                                itemBuilder: (context, index) {
                                                  return Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      InkWell(
                                                        onTap: () {
                                                          Navigator.push(
                                                              context,
                                                              PageTransition(
                                                                  type:
                                                                      PageTransitionType
                                                                          .fade,
                                                                  child:
                                                                      Appointment_Details_Lab(
                                                                    oderId: model
                                                                        .historyLabBookingModel?[
                                                                            index]
                                                                        .id
                                                                        .toString(),
                                                                  )));
                                                        },
                                                        child: Row(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .spaceBetween,
                                                          children: [
                                                            Padding(
                                                              padding: EdgeInsets
                                                                  .only(
                                                                      left:
                                                                          2.w),
                                                              child: Column(
                                                                crossAxisAlignment:
                                                                    CrossAxisAlignment
                                                                        .start,
                                                                children: [
                                                                  TextWidget(
                                                                    textValue:
                                                                        "Lab Order",
                                                                    textColor:
                                                                        ColorUtils
                                                                            .red,
                                                                    fontFamily:
                                                                        FontUtils
                                                                            .interSemiBold,
                                                                    fontSize:
                                                                        1.8.t,
                                                                  ),
                                                                  SizedBox(
                                                                    height:
                                                                        0.75.h,
                                                                  ),
                                                                  // TextWidget(
                                                                  //   textValue: model
                                                                  //       .historyLabBookingModel?[
                                                                  //           index]
                                                                  //       .id.toString(),
                                                                  //   textColor:
                                                                  //       ColorUtils
                                                                  //           .blackShade,
                                                                  //   fontFamily:
                                                                  //       FontUtils
                                                                  //           .interRegular,
                                                                  //   fontSize:
                                                                  //       1.6.t,
                                                                  // ),
                                                                  Row(
                                                                    children: [
                                                                      TextWidget(
                                                                        textValue:
                                                                            "Patient: ",
                                                                        textColor:
                                                                            ColorUtils.blackShade,
                                                                        fontFamily:
                                                                            FontUtils.interRegular,
                                                                        fontSize:
                                                                            1.6.t,
                                                                      ),
                                                                      TextWidget(
                                                                        textValue: model
                                                                            .historyLabBookingModel?[index]
                                                                            .name,
                                                                        textColor:
                                                                            ColorUtils.blackShade,
                                                                        fontFamily:
                                                                            FontUtils.interRegular,
                                                                        fontSize:
                                                                            1.6.t,
                                                                      ),
                                                                    ],
                                                                  ),
                                                                ],
                                                              ),
                                                            ),
                                                            Row(
                                                              children: [
                                                                TextWidget(
                                                                  textValue:
                                                                      "Rs. ",
                                                                  textColor:
                                                                      ColorUtils
                                                                          .lightGreen,
                                                                  fontFamily:
                                                                      FontUtils
                                                                          .interSemiBold,
                                                                  fontSize:
                                                                      1.8.t,
                                                                ),
                                                                TextWidget(
                                                                  textValue: model
                                                                      .historyLabBookingModel?[
                                                                          index]
                                                                      .amount
                                                                      .toString(),
                                                                  textColor:
                                                                      ColorUtils
                                                                          .lightGreen,
                                                                  fontFamily:
                                                                      FontUtils
                                                                          .interSemiBold,
                                                                  fontSize:
                                                                      1.8.t,
                                                                ),
                                                                ForwardButtonBlack(),
                                                              ],
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    ],
                                                  );
                                                },
                                                separatorBuilder:
                                                    (context, index) {
                                                  return Divider();
                                                },
                                                itemCount: model
                                                        .historyLabBookingModel
                                                        ?.length ??
                                                    0),
                                            SizedBox(
                                              height: 3.h,
                                            ),
                                            TextWidget(
                                              textValue: "Pharmacy Order",
                                              textColor: ColorUtils.blackShade,
                                              fontFamily: FontUtils.interMedium,
                                              fontSize: 1.9.t,
                                            ),
                                            SizedBox(
                                              height: 3.h,
                                            ),
                                            ListView.separated(
                                                shrinkWrap: true,
                                                physics:
                                                    NeverScrollableScrollPhysics(),
                                                itemBuilder: (context, index) {
                                                  return Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      InkWell(
                                                        onTap: () {
                                                          Navigator.push(
                                                              context,
                                                              PageTransition(
                                                                  type:
                                                                      PageTransitionType
                                                                          .fade,
                                                                  child:
                                                                      Appointment_Details()
                                                                  //     Appointment_Details_Doc(
                                                                  //   oderId: model
                                                                  //       .doctormyactive![
                                                                  //           index]
                                                                  //       .id
                                                                  //       .toString(),
                                                                  // )
                                                                  ));
                                                        },
                                                        child: Row(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .spaceBetween,
                                                          children: [
                                                            Padding(
                                                              padding: EdgeInsets
                                                                  .only(
                                                                      left:
                                                                          2.w),
                                                              child: Column(
                                                                crossAxisAlignment:
                                                                    CrossAxisAlignment
                                                                        .start,
                                                                children: [
                                                                  // TextWidget(
                                                                  //   textValue: model
                                                                  //       .doctormyactive![
                                                                  //           index]
                                                                  //       .appoint_type
                                                                  //       .toString(),
                                                                  //   textColor:
                                                                  //       ColorUtils
                                                                  //           .blackShade,
                                                                  //   fontFamily:
                                                                  //       FontUtils
                                                                  //           .interRegular,
                                                                  //   fontSize:
                                                                  //       1.6.t,
                                                                  // ),

                                                                  SizedBox(
                                                                    height:
                                                                        0.75.h,
                                                                  ),

                                                                  Row(
                                                                    children: [
                                                                      TextWidget(
                                                                        textValue:
                                                                            "Patient: ",
                                                                        textColor:
                                                                            ColorUtils.blackShade,
                                                                        fontFamily:
                                                                            FontUtils.interRegular,
                                                                        fontSize:
                                                                            1.6.t,
                                                                      ),
                                                                      TextWidget(
                                                                        textValue: model
                                                                            .pharmacymyhistory![index]
                                                                            .name
                                                                            .toString(),
                                                                        textColor:
                                                                            ColorUtils.blackShade,
                                                                        fontFamily:
                                                                            FontUtils.interRegular,
                                                                        fontSize:
                                                                            1.6.t,
                                                                      ),
                                                                    ],
                                                                  ),
                                                                  SizedBox(
                                                                    height:
                                                                        0.75.h,
                                                                  ),
                                                                  Row(
                                                                    children: [
                                                                      TextWidget(
                                                                        textValue:
                                                                            "Delivery_status: ",
                                                                        textColor:
                                                                            ColorUtils.blackShade,
                                                                        fontFamily:
                                                                            FontUtils.interRegular,
                                                                        fontSize:
                                                                            1.6.t,
                                                                      ),
                                                                      TextWidget(
                                                                        textValue: model
                                                                            .pharmacymyhistory![index]
                                                                            .delivery_status
                                                                            .toString(),
                                                                        textColor:
                                                                            ColorUtils.blackShade,
                                                                        fontFamily:
                                                                            FontUtils.interRegular,
                                                                        fontSize:
                                                                            1.6.t,
                                                                      ),
                                                                    ],
                                                                  ),
                                                                  SizedBox(
                                                                    height:
                                                                        0.75.h,
                                                                  ),
                                                                ],
                                                              ),
                                                            ),
                                                            Row(
                                                              children: [
                                                                TextWidget(
                                                                  textValue:
                                                                      "Rs. ",
                                                                  textColor:
                                                                      ColorUtils
                                                                          .lightGreen,
                                                                  fontFamily:
                                                                      FontUtils
                                                                          .interSemiBold,
                                                                  fontSize:
                                                                      1.8.t,
                                                                ),
                                                                TextWidget(
                                                                  textValue: model
                                                                      .pharmacymyhistory?[
                                                                          index]
                                                                      .amount
                                                                      .toString(),
                                                                  textColor:
                                                                      ColorUtils
                                                                          .lightGreen,
                                                                  fontFamily:
                                                                      FontUtils
                                                                          .interSemiBold,
                                                                  fontSize:
                                                                      1.8.t,
                                                                ),
                                                                ForwardButtonBlack(),
                                                              ],
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    ],
                                                  );
                                                },
                                                separatorBuilder:
                                                    (context, index) {
                                                  return Divider();
                                                },
                                                itemCount: model
                                                        .pharmacymyhistory
                                                        ?.length ??
                                                    0),
                                            // ListView.separated(
                                            //     shrinkWrap: true,
                                            //     physics:
                                            //         NeverScrollableScrollPhysics(),
                                            //     itemBuilder: (context, index) {
                                            //       return Column(
                                            //         crossAxisAlignment:
                                            //             CrossAxisAlignment
                                            //                 .start,
                                            //         children: [
                                            //           InkWell(
                                            //             onTap: () {
                                            //               Navigator.push(
                                            //                   context,
                                            //                   PageTransition(
                                            //                       type:
                                            //                           PageTransitionType
                                            //                               .fade,
                                            //                       child:
                                            //                           Appointment_Details()));
                                            //             },
                                            //             child: Row(
                                            //               mainAxisAlignment:
                                            //                   MainAxisAlignment
                                            //                       .spaceBetween,
                                            //               children: [
                                            //                 Padding(
                                            //                   padding: EdgeInsets
                                            //                       .only(
                                            //                           left:
                                            //                               2.w),
                                            //                   child: Column(
                                            //                     crossAxisAlignment:
                                            //                         CrossAxisAlignment
                                            //                             .start,
                                            //                     children: [
                                            //                       TextWidget(
                                            //                         textValue: model
                                            //                                 .activeBookings[index]
                                            //                             [
                                            //                             "orderType"],
                                            //                         textColor:
                                            //                             ColorUtils
                                            //                                 .red,
                                            //                         fontFamily:
                                            //                             FontUtils
                                            //                                 .interSemiBold,
                                            //                         fontSize:
                                            //                             1.8.t,
                                            //                       ),
                                            //                       SizedBox(
                                            //                         height:
                                            //                             0.75.h,
                                            //                       ),
                                            //                       TextWidget(
                                            //                         textValue: model
                                            //                                 .activeBookings[index]
                                            //                             [
                                            //                             "patient"],
                                            //                         textColor:
                                            //                             ColorUtils
                                            //                                 .blackShade,
                                            //                         fontFamily:
                                            //                             FontUtils
                                            //                                 .interRegular,
                                            //                         fontSize:
                                            //                             1.6.t,
                                            //                       ),
                                            //                     ],
                                            //                   ),
                                            //                 ),
                                            //                 Row(
                                            //                   children: [
                                            //                     TextWidget(
                                            //                       textValue: model
                                            //                                   .activeBookings[
                                            //                               index]
                                            //                           [
                                            //                           "amount"],
                                            //                       textColor:
                                            //                           ColorUtils
                                            //                               .lightGreen,
                                            //                       fontFamily:
                                            //                           FontUtils
                                            //                               .interSemiBold,
                                            //                       fontSize:
                                            //                           1.8.t,
                                            //                     ),
                                            //                     ForwardButtonBlack(),
                                            //                   ],
                                            //                 ),
                                            //               ],
                                            //             ),
                                            //           ),
                                            //         ],
                                            //       );
                                            //     },
                                            //     separatorBuilder:
                                            //         (context, index) {
                                            //       return Divider();
                                            //     },
                                            //     itemCount: model
                                            //         .activeBookings.length),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
      },
    );
  }
}
