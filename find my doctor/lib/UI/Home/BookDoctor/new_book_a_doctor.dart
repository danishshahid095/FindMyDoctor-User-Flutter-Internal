import 'package:find_my_doctor/App/locator.dart';
import 'package:find_my_doctor/Utils/color_utils.dart';
import 'package:find_my_doctor/Utils/extensions.dart';
import 'package:find_my_doctor/Utils/font_utils.dart';
import 'package:find_my_doctor/Utils/image_utils.dart';
import 'package:find_my_doctor/ViewModels/main_view_model.dart';
import 'package:find_my_doctor/Widgets/back_with_signleText.dart';

import 'package:find_my_doctor/Widgets/text_widget.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:stacked/stacked.dart';

import '../../../Utils/whole_page_loader.dart';
import '../../../Widgets/button_with_border.dart';
import '../../../Widgets/forward_button_black.dart';
import '../../../Widgets/my_bottom_model_sheet.dart';
import '../../../Widgets/page_horizontal_margin.dart';
import '../../../Widgets/red_button.dart';
import '../Pharmacy/search_medicine.dart';
import '../Pharmacy/select_city_pharmacy.dart';
import 'select_city.dart';
import 'select_consultation_type.dart';

class BookADoctorNew extends StatefulWidget {
  const BookADoctorNew({Key? key}) : super(key: key);

  @override
  State<BookADoctorNew> createState() => _BookADoctorNewState();
}

class _BookADoctorNewState extends State<BookADoctorNew> {
  String? newaddress;
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<MainViewModel>.reactive(
      viewModelBuilder: () => locator<MainViewModel>(),
      disposeViewModel: false,
      onModelReady: (model) async {
        await model.gettingBencfiy(
            context, model.prefService.userToken!.toString());
      },
      builder: (context, model, child) {
        return model.beneficryLoader == true
            ? WholePageLoader()
            : GestureDetector(
                onTap: () => FocusScope.of(context).unfocus(),
                child: SafeArea(
                  top: false,
                  bottom: false,
                  child: Scaffold(
                    backgroundColor: Colors.white,
                    body: Column(
                      children: [
                        Column(
                          children: [
                            SizedBox(
                              height: context.getPadding().top,
                            ),
                            BackSingleText(
                              backText: "Beneficiaries",
                            ),
                            SizedBox(
                              height: 1.h,
                            ),
                          ],
                        ),
                        Expanded(
                          child: SingleChildScrollView(
                            child: PageHorizontalMargin(
                              widget: Column(
                                children: [
                                  PageHorizontalMargin(
                                    widget: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        SizedBox(
                                          height: 3.h,
                                        ),
                                        Image.asset(
                                          ImageUtils.femaleDoctor,
                                          width: 60.i,
                                          height: 60.i,
                                        ),
                                        TextWidget(
                                          textValue:
                                              "Who are you booking this appointment for?",
                                          fontFamily: FontUtils.poppinsBold,
                                          fontSize: 2.4.t,
                                          textColor: ColorUtils.red,
                                        ),
                                        SizedBox(
                                          height: 5.h,
                                        ),
                                        // InkWell(
                                        //   onTap: () {
                                        //     MyBottomModelSheet.showModelSheet(
                                        //       context,
                                        //       MediaQuery.of(context)
                                        //               .size
                                        //               .height /
                                        //           1.6,
                                        //       "Confirm Address",
                                        //       Column(
                                        //         children: [
                                        //           Padding(
                                        //             padding:
                                        //                 EdgeInsets.symmetric(
                                        //                     horizontal: 3.w),
                                        //             child: TextWidget(
                                        //               textValue:
                                        //                   //newaddress,
                                        //                   //  model
                                        //                   //     .beneficry![
                                        //                   //         index]
                                        //                   // .address
                                        //                   // .toString(),
                                        //                   "F18, 5th Floor, XYZ Towers, St II, Block A, Khayban-e-Imtiaz, Karachi, 75321",
                                        //               fontFamily: FontUtils
                                        //                   .interRegular,
                                        //               fontSize: 1.8.t,
                                        //               textColor:
                                        //                   ColorUtils.blackShade,
                                        //             ),
                                        //           ),
                                        //           SizedBox(
                                        //             height: 2.h,
                                        //           ),
                                        //           RedButton(
                                        //             textValue: "Confirm",
                                        //             onButtonPressed: () {
                                        //               if (model
                                        //                       .fromDoctorBook ==
                                        //                   true) {
                                        //                 Navigator.pop(context);
                                        //                 Navigator.push(
                                        //                     context,
                                        //                     PageTransition(
                                        //                         type:
                                        //                             PageTransitionType
                                        //                                 .fade,
                                        //                         child:
                                        //                             SelectConsultationType()));
                                        //               } else if (model
                                        //                       .fromPharmacy ==
                                        //                   true) {
                                        //                 Navigator.pop(context);
                                        //                 Navigator.push(
                                        //                     context,
                                        //                     PageTransition(
                                        //                         type:
                                        //                             PageTransitionType
                                        //                                 .fade,
                                        //                         child:
                                        //                             SearchMedicine()));
                                        //               } else {
                                        //                 Navigator.pop(context);
                                        //                 Navigator.push(
                                        //                     context,
                                        //                     // PageTransition(type: PageTransitionType.fade, child: SelectPrescription()));
                                        //                     PageTransition(
                                        //                         type:
                                        //                             PageTransitionType
                                        //                                 .fade,
                                        //                         child:
                                        //                             SelectCityPharmacy()));
                                        //               }
                                        //             },
                                        //           ),
                                        //           SizedBox(
                                        //             height: 2.h,
                                        //           ),
                                        //           ButtonWithBorder(
                                        //             textValue: "Edit",
                                        //             onButtonPressed: () {
                                        //               Navigator.pop(context);
                                        //               Navigator.push(
                                        //                   context,
                                        //                   PageTransition(
                                        //                       type:
                                        //                           PageTransitionType
                                        //                               .fade,
                                        //                       child:
                                        //                           SelectCity()));
                                        //             },
                                        //             borderColor: ColorUtils.red,
                                        //             buttonTextColor:
                                        //                 ColorUtils.red,
                                        //           ),
                                        //         ],
                                        //       ),
                                        //     );
                                        //   },
                                        //   child: Column(
                                        //     children: [
                                        //       Row(
                                        //         mainAxisAlignment:
                                        //             MainAxisAlignment
                                        //                 .spaceBetween,
                                        //         children: [
                                        //           TextWidget(
                                        //             textValue: "Self",
                                        //             textColor: ColorUtils.red,
                                        //             fontFamily:
                                        //                 FontUtils.interBold,
                                        //             fontSize: 1.8.t,
                                        //           ),
                                        //           ForwardButtonBlack(),
                                        //           //SizedBox(width: 2.w,),
                                        //         ],
                                        //       ),
                                        //     ],
                                        //   ),
                                        // ),

                                        InkWell(
                                          onTap: () {
                                            MyBottomModelSheet.showModelSheet(
                                              context,
                                              MediaQuery.of(context)
                                                      .size
                                                      .height /
                                                  1.6,
                                              "Confirm Address",
                                              Column(
                                                children: [
                                                  Padding(
                                                    padding:
                                                        EdgeInsets.symmetric(
                                                            horizontal: 3.w),
                                                    child: TextWidget(
                                                      textValue:
                                                          // newaddress,
                                                          // model
                                                          //     .beneficry![index].address
                                                          //     .toString(),
                                                          "F18, 5th Floor, XYZ Towers, St II, Block A, Khayban-e-Imtiaz, Karachi, 75321",
                                                      fontFamily: FontUtils
                                                          .interRegular,
                                                      fontSize: 1.8.t,
                                                      textColor:
                                                          ColorUtils.blackShade,
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    height: 2.h,
                                                  ),
                                                  RedButton(
                                                    textValue: "Confirm",
                                                    onButtonPressed: () {
                                                      if (model
                                                              .fromDoctorBook ==
                                                          true) {
                                                        Navigator.pop(context);
                                                        Navigator.push(
                                                            context,
                                                            PageTransition(
                                                                type:
                                                                    PageTransitionType
                                                                        .fade,
                                                                child:
                                                                    SelectConsultationType()));
                                                      } else if (model
                                                              .fromPharmacy ==
                                                          true) {
                                                        Navigator.pop(context);
                                                        Navigator.push(
                                                            context,
                                                            PageTransition(
                                                                type:
                                                                    PageTransitionType
                                                                        .fade,
                                                                child:
                                                                    SearchMedicine()));
                                                      } else {
                                                        Navigator.pop(context);
                                                        Navigator.push(
                                                            context,
                                                            // PageTransition(type: PageTransitionType.fade, child: SelectPrescription()));
                                                            PageTransition(
                                                                type:
                                                                    PageTransitionType
                                                                        .fade,
                                                                child:
                                                                    SelectCityPharmacy()));
                                                      }
                                                    },
                                                  ),
                                                  SizedBox(
                                                    height: 2.h,
                                                  ),
                                                  ButtonWithBorder(
                                                    textValue: "Edit",
                                                    onButtonPressed: () {
                                                      Navigator.pop(context);
                                                      Navigator.push(
                                                          context,
                                                          PageTransition(
                                                              type:
                                                                  PageTransitionType
                                                                      .fade,
                                                              child:
                                                                  SelectCity()));
                                                    },
                                                    borderColor: ColorUtils.red,
                                                    buttonTextColor:
                                                        ColorUtils.red,
                                                  ),
                                                ],
                                              ),
                                            );
                                          },
                                          child: Column(
                                            children: [
                                              InkWell(
                                                onTap: () {
                                                  MyBottomModelSheet
                                                      .showModelSheet(
                                                    context,
                                                    MediaQuery.of(context)
                                                            .size
                                                            .height /
                                                        1.6,
                                                    "Confirm Address",
                                                    Column(
                                                      children: [
                                                        Padding(
                                                          padding: EdgeInsets
                                                              .symmetric(
                                                                  horizontal:
                                                                      3.w),
                                                          child: TextWidget(
                                                            textValue:
                                                                //newaddress,
                                                                //  model
                                                                //     .beneficry![
                                                                //         index]
                                                                // .address
                                                                // .toString(),
                                                                "F18, 5th Floor, XYZ Towers, St II, Block A, Khayban-e-Imtiaz, Karachi, 75321",
                                                            fontFamily: FontUtils
                                                                .interRegular,
                                                            fontSize: 1.8.t,
                                                            textColor:
                                                                ColorUtils
                                                                    .blackShade,
                                                          ),
                                                        ),
                                                        SizedBox(
                                                          height: 2.h,
                                                        ),
                                                        RedButton(
                                                          textValue: "Confirm",
                                                          onButtonPressed: () {
                                                            if (model
                                                                    .fromDoctorBook ==
                                                                true) {
                                                              Navigator.pop(
                                                                  context);
                                                              Navigator.push(
                                                                  context,
                                                                  PageTransition(
                                                                      type: PageTransitionType
                                                                          .fade,
                                                                      child:
                                                                          SelectConsultationType()));
                                                            } else if (model
                                                                    .fromPharmacy ==
                                                                true) {
                                                              Navigator.pop(
                                                                  context);
                                                              Navigator.push(
                                                                  context,
                                                                  PageTransition(
                                                                      type: PageTransitionType
                                                                          .fade,
                                                                      child:
                                                                          SearchMedicine()));
                                                            } else {
                                                              Navigator.pop(
                                                                  context);
                                                              Navigator.push(
                                                                  context,
                                                                  // PageTransition(type: PageTransitionType.fade, child: SelectPrescription()));
                                                                  PageTransition(
                                                                      type: PageTransitionType
                                                                          .fade,
                                                                      child:
                                                                          SelectCityPharmacy()));
                                                            }
                                                          },
                                                        ),
                                                        SizedBox(
                                                          height: 2.h,
                                                        ),
                                                        ButtonWithBorder(
                                                          textValue: "Edit",
                                                          onButtonPressed: () {
                                                            Navigator.pop(
                                                                context);
                                                            Navigator.push(
                                                                context,
                                                                PageTransition(
                                                                    type: PageTransitionType
                                                                        .fade,
                                                                    child:
                                                                        SelectCity()));
                                                          },
                                                          borderColor:
                                                              ColorUtils.red,
                                                          buttonTextColor:
                                                              ColorUtils.red,
                                                        ),
                                                      ],
                                                    ),
                                                  );
                                                },
                                                child: Column(
                                                  children: [
                                                    Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceBetween,
                                                      children: [
                                                        TextWidget(
                                                          textValue: "Self",
                                                          textColor:
                                                              ColorUtils.red,
                                                          fontFamily: FontUtils
                                                              .interBold,
                                                          fontSize: 1.8.t,
                                                        ),
                                                        ForwardButtonBlack(),
                                                        //SizedBox(width: 2.w,),
                                                      ],
                                                    ),
                                                    // Divider(
                                                    //   color: ColorUtils.silver,
                                                    // ),
                                                  ],
                                                ),
                                              ),
                                              // Divider(
                                              //   color: ColorUtils.silver,
                                              // ),
                                              ListView.separated(
                                                  shrinkWrap: true,
                                                  physics:
                                                      NeverScrollableScrollPhysics(),
                                                  itemBuilder:
                                                      (context, index) {
                                                    newaddress = model
                                                        .beneficry![index]
                                                        .address
                                                        .toString();
                                                    return Column(
                                                      children: [
                                                        // Divider(
                                                        //   color: ColorUtils.silver,
                                                        // ),

                                                        AppointmentFor(
                                                          appointmentFor: model
                                                              .beneficry![index]
                                                              .relation
                                                              .toString(),
                                                          //"Self",
                                                          name: model
                                                              .beneficry![index]
                                                              .fullname
                                                              .toString(),
                                                          // "Tooba Akhtar",
                                                        ),
                                                      ],
                                                    );
                                                  },
                                                  separatorBuilder:
                                                      (context, index) {
                                                    return Divider(
                                                      color: ColorUtils.silver,
                                                    );
                                                  },
                                                  itemCount:
                                                      model.beneficry?.length ??
                                                          0),
                                            ],
                                          ),
                                        ),
                                        Divider(
                                          color: ColorUtils.silver,
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
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

class AppointmentFor extends StatelessWidget {
  String? appointmentFor;
  String? name;

  AppointmentFor({this.appointmentFor, this.name, Key? key}) : super(key: key);
  final MainViewModel model = locator<MainViewModel>();
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // SizedBox(
        //   height: 1.h,
        // ),
        // Divider(
        //   color: ColorUtils.silver,
        // ),
        // SizedBox(
        //   height: 1.h,
        // ),
        // SizedBox(
        //   height: 1.h,
        // ),
        // Divider(
        //   color: ColorUtils.silver,
        // ),
        // Divider(
        //   color: ColorUtils.silver,
        // ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextWidget(
                  textValue: appointmentFor,
                  textColor: ColorUtils.red,
                  fontFamily: FontUtils.interBold,
                  fontSize: 1.8.t,
                ),
                SizedBox(
                  height: 0.75.h,
                ),
                TextWidget(
                  textValue: name,
                  textColor: ColorUtils.blackShade,
                  fontFamily: FontUtils.interRegular,
                  fontSize: 1.8.t,
                ),
              ],
            ),
            ForwardButtonBlack(),
          ],
        )

        // Divider(
        //   color: ColorUtils.silver,
        // ),
      ],
    );
  }
}
