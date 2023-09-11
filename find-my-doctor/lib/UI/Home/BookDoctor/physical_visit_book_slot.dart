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
import 'package:intl/intl.dart';
import 'package:page_transition/page_transition.dart';
import 'package:stacked/stacked.dart';

import '../../../modules/dio_service.dart';
import '../../../modules/navigation_service.dart' as my_nav_service;
import 'online_visit_confirm_details.dart';

class PhysicalVisitBookSlot extends StatefulWidget {
  int? id;
  String? start_time;
  String? end_time;
  //late DateTime selectedDate;
  PhysicalVisitBookSlot({Key? key, this.start_time, this.end_time, this.id})
      : super(key: key);

  @override
  State<PhysicalVisitBookSlot> createState() => _PhysicalVisitBookSlotState();
}

class _PhysicalVisitBookSlotState extends State<PhysicalVisitBookSlot> {
  // DateTime selectedDate = DateTime.now();
  // @override
  // void initState() {
  //   // TODO: implement initState
  //   super.initState();
  //   // scheduleBreaks();
  // }

  bool pmTapped = true;
  bool amTapped = false;
  bool doneTapped = false;
  var slotdata;
  var date;
  var apitime;
  DateTime selectedDate = DateTime.now();
  String? selectedtime;
  TimeOfDay selectedTime = TimeOfDay.now();
  var startTime;
  var endTime;

  List<String> timeEntries = [];
  // List<String> testList = [];
  void scheduleBreaks() {
    // Convert the start time to minutes
    int currentMinutes = int.parse(widget.start_time!.split(":")[0]) * 60 +
        int.parse(widget.start_time!.split(":")[1]);

    // Convert the end time to minutes
    int endMinutes = int.parse(widget.end_time!.split(":")[0]) * 60 +
        int.parse(widget.end_time!.split(":")[1]);

    // Use a set to store time entries to avoid duplicates
    Set<String> uniqueTimeEntries = Set();

    // Use a while loop to add time entries to the set every 15 minutes
    while (currentMinutes <= endMinutes) {
      String timeEntry = widget.start_time!;

      // Add the time entry to the set
      uniqueTimeEntries.add(timeEntry);

      if (currentMinutes % 60 == 15) {
        timeEntry = _addMinutesToTime(widget.start_time!, 15);

        // Add the time entry to the set
        uniqueTimeEntries.add(timeEntry);

        currentMinutes += 15;
      }

      widget.start_time = _addMinutesToTime(widget.start_time!, 15);
      currentMinutes += 15;
    }

    // Convert the set to a list and store it in timeEntries
    timeEntries = uniqueTimeEntries.toList();

    // Print the time entries list in the terminal
    // timeEntries.forEach((entry) {
    //   print(entry);
    // });
    print(timeEntries);

    
  }

  

  String _addMinutesToTime(String timeStr, int minutes) {
    // Convert the time string to a DateTime object
    DateTime time = DateTime.parse("2023-01-01 " + timeStr);

    // Add the specified number of minutes to the time
    time = time.add(Duration(minutes: minutes));

    // Convert the new time to a string in "HH:mm" format
    String newTimeStr =
        "${time.hour.toString().padLeft(2, '0')}:${time.minute.toString().padLeft(2, '0')}";

    return newTimeStr;
  }

  

  @override
  Widget build(BuildContext context) {
    String formattedDate = DateFormat('yyyy-MM-dd').format(selectedDate);
    date = formattedDate;
    // var apitime;
    //print(date);

    return ViewModelBuilder<MainViewModel>.reactive(
      viewModelBuilder: () => locator<MainViewModel>(),
      disposeViewModel: false,
      onModelReady: (model) {
        //scheduleBreaks();
        var model1 = model;
        //.doAvailableSlot(context, 76, selectedDate);
        //slotdata = model.doAvailableSlot(context, '2023-08-04', 76);
      },
      builder: (context, model, child) {
        startTime = widget.start_time;
        endTime = widget.end_time;

        // apitime = model.docslotModel![0].booked_slots_time.toString();
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
                            // Text(
                            //   selectedTime != null
                            //       ? 'Selected Time: ${selectedTime.format(context)}'
                            //       : 'No time selected',
                            //   style: TextStyle(fontSize: 18),
                            // ),
                            // Text(model.docslotModel![0].booked_slots_time
                            //  .toString()),
                            //Text(apitime),
                            //  Text(slots.toString()),
                            //  generateTimeSlots(startTime, endTime),
                            // Text(startTime),
                            // Text(endTime),
                            // Text(widget.start_time.toString()),
                            // Text(widget.end_time.toString()),
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
                                        : date.toString().substring(8, 10),
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
                                        : date.toString().substring(5, 7),
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
                                    onTap: () => _selectTime(context),
                                    hint: doneTapped == false
                                        ? "00"
                                        : selectedTime.hourOfPeriod.toString(),
                                    unit: "HH",
                                    // hint: "00",
                                    // unit: "HH",
                                  ),
                                ),
                                SvgPicture.asset(ImageUtils.clockColon),
                                Expanded(
                                  child: SquareDateTextField(
                                    onTap: () => _selectTime(context),
                                    hint: doneTapped == false
                                        ? "00"
                                        : selectedTime.minute.toString(),
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
                                String formattedDate = DateFormat("yyyy-MM-dd")
                                    .format(selectedDate);

                                // Format the selectedTime
                                String formattedTime = selectedTime
                                    .format(context)
                                    .substring(0, 4);

                                // Combine the formatted date and time
                                String combinedDateTime =
                                    "$formattedDate $formattedTime:00";
                                Navigator.push(
                                    context,
                                    PageTransition(
                                        type: PageTransitionType.fade,
                                        child: PhysicalVisitConfirmDetails(
                                          date: combinedDateTime.toString(),
                                          time: selectedTime.toString(),
                                          consultationId: widget.id,
                                        )));
                                // Navigator.push(
                                //     context,
                                //     PageTransition(
                                //         type: PageTransitionType.fade,
                                //         child: OnlineVisitConfirmDetails(
                                //           date: selectedDate.toString(),
                                //           time: selectedTime.toString(),
                                //           consultationId: widget.id,
                                //         )));
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

                //print(selectedDate);
                print(date);
                setState(() {
                  doneTapped = true;
                });
                //slotdata;
                Navigator.pop(context, selectedDate);
                // await model.doAvailableSlot(
                //     context,
                //     251,
                //     //'2023-08-15'
                //     date.toString());

                // if (timeEntries.contains(model.bookig_slot_time)) {
                //   timeEntries.remove(model.bookig_slot_time);
                // }
                // print("this is remove time ${timeEntries}");
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

  // void _showTimePicker(BuildContext context) {
  //   showModalBottomSheet(
  //     context: context,
  //     builder: (BuildContext builder) {
  //       return Container(
  //         height: 200,
  //         child: Column(
  //           children: [
  //             Expanded(
  //               child: ListView.builder(
  //                 itemCount: timeEntries.length,
  //                 itemBuilder: (context, index) {
  //                   return ListTile(
  //                     title: Text(timeEntries[index]),
  //                     onTap: () {
  //                       setState(() {
  //                         List<String> timeParts =
  //                             timeEntries[index].split(':');
  //                         int hour = int.parse(timeParts[0]);
  //                         int minute = int.parse(timeParts[1]);
  //                         selectedTime = TimeOfDay(hour: hour, minute: minute);
  //                         //selectedTime = timeEntries[index];
  //                       });
  //                     },
  //                   );
  //                 },
  //               ),
  //             ),
  //             ElevatedButton(
  //               onPressed: () {
  //                 // _showTimePicker(context);
  //                 Navigator.pop(context, selectedTime);
  //                 print(selectedTime);
  //               },
  //               child: Text('Done'),
  //             ),
  //           ],
  //         ),
  //       );
  //     },
  //   ).then((value) {
  //     if (value != null) {
  //       // Do something with the selected time
  //       print('Selected time: $value');
  //     }
  //   });
  // }
}
