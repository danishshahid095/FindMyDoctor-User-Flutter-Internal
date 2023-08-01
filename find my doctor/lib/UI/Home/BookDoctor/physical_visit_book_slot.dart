import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:expand_tap_area/expand_tap_area.dart';
import 'package:find_my_doctor/App/locator.dart';
import 'package:find_my_doctor/UI/Home/BookDoctor/physical_visit_confirm_details.dart';
import 'package:find_my_doctor/Utils/color_utils.dart';
import 'package:find_my_doctor/Utils/extensions.dart';
import 'package:find_my_doctor/Utils/font_utils.dart';
import 'package:find_my_doctor/Utils/image_utils.dart';
import 'package:find_my_doctor/ViewModels/main_view_model.dart';
import 'package:find_my_doctor/Widgets/page_horizontal_margin.dart';
import 'package:find_my_doctor/Widgets/red_button.dart';
import 'package:find_my_doctor/Widgets/square_date_text_field.dart';
import 'package:find_my_doctor/Widgets/text_widget.dart';
import 'package:find_my_doctor/Widgets/top_margin_home.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:page_transition/page_transition.dart';
import 'package:stacked/stacked.dart';

import '../../../modules/dio_service.dart';
import '../../../modules/navigation_service.dart' as my_nav_service;

class PhysicalVisitBookSlot extends StatefulWidget {
  const PhysicalVisitBookSlot({Key? key}) : super(key: key);

  @override
  State<PhysicalVisitBookSlot> createState() => _PhysicalVisitBookSlotState();
}

class _PhysicalVisitBookSlotState extends State<PhysicalVisitBookSlot> {
  bool pmTapped = true;
  bool amTapped = false;
  bool doneTapped = false;
  var slotdata;
  DateTime selectedDate = DateTime.now();
  TimeOfDay selectedTime = TimeOfDay.now();
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<MainViewModel>.reactive(
      viewModelBuilder: () => locator<MainViewModel>(),
      disposeViewModel: false,
      onModelReady: (model) {
        var model1 = model;
        //.doAvailableSlot(context, 76, selectedDate);
        //slotdata = model.doAvailableSlot(context, '2023-08-04', 76);
      },
      builder: (context, model, child) {
        return GestureDetector(
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
                      TopMarginHome(),
                      SizedBox(
                        child: Padding(
                          padding: EdgeInsets.only(left: 10),
                          child: Row(
                            children: [
                              ExpandTapWidget(
                                onTap: () {
                                  Navigator.pop(context);
                                },
                                tapPadding: EdgeInsets.all(50),
                                child:
                                    SvgPicture.asset(ImageUtils.backArrowRed),
                              ),
                              Expanded(
                                child: Center(
                                  child: TextWidget(
                                    textValue: "Book your slot",
                                    fontFamily: FontUtils.poppinsBold,
                                    fontSize: 2.8.t,
                                    textColor: ColorUtils.red,
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: 2.w,
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 3.h,
                      ),
                    ],
                  ),
                  Expanded(
                    child: SingleChildScrollView(
                      child: PageHorizontalMargin(
                        widget: Column(
                          children: [
                            TextWidget(
                              textValue:
                                  "Select preffered date & time, to get the service at your convinence.",
                              fontFamily: FontUtils.interRegular,
                              fontSize: 1.6.t,
                              textColor: ColorUtils.silver2,
                            ),
                            SizedBox(
                              height: 5.h,
                            ),
                            SizedBox(
                                width: 60.i,
                                height: 60.i,
                                child: Image.asset(
                                  ImageUtils.labTestFemaleDoctor,
                                )),
                            SizedBox(
                              height: 4.h,
                            ),

                            // visit Date
                            Row(
                              children: [
                                SvgPicture.asset(ImageUtils.addContainer),
                                SizedBox(
                                  width: 2.w,
                                ),
                                TextWidget(
                                  textValue: "Enter Visit Date",
                                  fontFamily: FontUtils.poppinsBold,
                                  fontSize: 2.2.t,
                                  textColor: ColorUtils.red,
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 3.h,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Expanded(
                                  child: SquareDateTextField(
                                    onTap: () => _selectDate(context),
                                    hint: doneTapped == false
                                        ? "00"
                                        : selectedDate
                                            .toString()
                                            .substring(8, 10),
                                    unit: "DD",
                                    // hint: "00",
                                    // unit: "HH",
                                  ),
                                ),
                                SvgPicture.asset(ImageUtils.dateSlash),
                                Expanded(
                                  child: SquareDateTextField(
                                    onTap: () => _selectDate(context),
                                    hint: doneTapped == false
                                        ? "00"
                                        : selectedDate
                                            .toString()
                                            .substring(5, 7),
                                    unit: "MM",
                                  ),
                                ),
                                SvgPicture.asset(ImageUtils.dateSlash),
                                Expanded(
                                  child: SquareDateTextField(
                                    onTap: () => _selectDate(context),
                                    hint: doneTapped == false
                                        ? "0000"
                                        : selectedDate
                                            .toString()
                                            .substring(0, 4),
                                    unit: "YYYY",
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 3.h,
                            ),

                            // visit Time
                            Row(
                              children: [
                                SvgPicture.asset(ImageUtils.visitClock),
                                SizedBox(
                                  width: 2.w,
                                ),
                                TextWidget(
                                  textValue: "Enter Visit Time",
                                  fontFamily: FontUtils.poppinsBold,
                                  fontSize: 2.2.t,
                                  textColor: ColorUtils.red,
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 3.h,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Expanded(
                                  child: SquareDateTextField(
                                    hint: "00",
                                    unit: "HH",
                                  ),
                                ),
                                SvgPicture.asset(ImageUtils.clockColon),
                                Expanded(
                                  child: SquareDateTextField(
                                    hint: "00",
                                    unit: "MM",
                                  ),
                                ),
                                Expanded(
                                  child: Column(
                                    children: [
                                      GestureDetector(
                                        onTap: () {
                                          setState(() {
                                            pmTapped = true;
                                            amTapped = false;
                                          });
                                        },
                                        child: Container(
                                          decoration: BoxDecoration(
                                              shape: BoxShape.rectangle,
                                              borderRadius: BorderRadius.only(
                                                  topLeft: Radius.circular(8),
                                                  topRight: Radius.circular(8)),
                                              color: ColorUtils.silver1),
                                          child: Padding(
                                            padding: EdgeInsets.symmetric(
                                                horizontal: 4.w, vertical: 1.h),
                                            child: TextWidget(
                                              textValue: "PM",
                                              fontFamily: FontUtils.poppinsBold,
                                              fontSize: 2.2.t,
                                              textColor: pmTapped == true
                                                  ? ColorUtils.red
                                                  : ColorUtils.blackShade,
                                            ),
                                          ),
                                        ),
                                      ),
                                      GestureDetector(
                                        onTap: () {
                                          setState(() {
                                            pmTapped = false;
                                            amTapped = true;
                                          });
                                        },
                                        child: Container(
                                          decoration: BoxDecoration(
                                              shape: BoxShape.rectangle,
                                              borderRadius: BorderRadius.only(
                                                  bottomLeft:
                                                      Radius.circular(8),
                                                  bottomRight:
                                                      Radius.circular(8)),
                                              color: ColorUtils.white1),
                                          child: Padding(
                                            padding: EdgeInsets.symmetric(
                                                horizontal: 4.w, vertical: 1.h),
                                            child: TextWidget(
                                              textValue: "AM",
                                              fontFamily: FontUtils.poppinsBold,
                                              fontSize: 2.2.t,
                                              textColor: amTapped == true
                                                  ? ColorUtils.red
                                                  : ColorUtils.blackShade,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  height: 2.h,
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 5.h,
                            ),
                            RedButton(
                              textValue: "Next",
                              onButtonPressed: () {
                                Navigator.push(
                                    context,
                                    PageTransition(
                                        type: PageTransitionType.fade,
                                        child: PhysicalVisitConfirmDetails()));
                              },
                            ),
                            SizedBox(
                              height: 2.h,
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

  void _selectDate(BuildContext context) async {
    final MainViewModel model = locator<MainViewModel>();
    final DateTime? pickedDate = await showModalBottomSheet(
      context: context,
      builder: (BuildContext builder) {
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              height: 200,
              child: CupertinoDatePicker(
                initialDateTime: selectedDate,
                onDateTimeChanged: (DateTime newDate) {
                  setState(() {
                    selectedDate = newDate;
                  });
                },
                mode: CupertinoDatePickerMode.date,
              ),
            ),
            CupertinoButton(
              onPressed: () async {
                print('this is date');
                print(selectedDate);
                setState(() {
                  doneTapped = true;
                });
                //slotdata;
                Navigator.pop(context, selectedDate);
                await model.doAvailableSlot(
                    context, 76, selectedDate.toString());
                // await slotdata.doAvailableSlot(
                //     context,
                //      76,
                //     selectedDate);
              },
              child: Text('Done'),
            ),
          ],
        );
      },
    );

    if (pickedDate != null && pickedDate != selectedDate) {
      setState(() {
        selectedDate = pickedDate;
      });
    }
  }

  void _selectTime(BuildContext context) async {
    final TimeOfDay? pickedTime = await showModalBottomSheet(
      context: context,
      builder: (BuildContext builder) {
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              height: 200,
              child: CupertinoDatePicker(
                initialDateTime: DateTime(
                  selectedDate.year,
                  selectedDate.month,
                  selectedDate.day,
                  selectedTime.hour,
                  selectedTime.minute,
                ),
                onDateTimeChanged: (DateTime newDateTime) {
                  setState(() {
                    selectedTime = TimeOfDay.fromDateTime(newDateTime);
                  });
                },
                mode: CupertinoDatePickerMode.time,
              ),
            ),
            CupertinoButton(
              onPressed: () {
                print(selectedTime);
                setState(() {
                  doneTapped = true;
                  if (selectedTime.hour > 12) {
                    pmTapped = true;
                    amTapped = false;
                  } else {
                    pmTapped = false;
                    amTapped = true;
                  }
                });
                Navigator.pop(context, selectedTime);
              },
              child: Text('Done'),
            ),
          ],
        );
      },
    );

    if (pickedTime != null && pickedTime != selectedTime) {
      setState(() {
        selectedTime = pickedTime;
      });
    }
  }
}
