import 'dart:io';

import 'package:expand_tap_area/expand_tap_area.dart';
import 'package:find_my_doctor/App/locator.dart';
import 'package:find_my_doctor/Utils/color_utils.dart';
import 'package:find_my_doctor/Utils/extensions.dart';
import 'package:find_my_doctor/Utils/font_utils.dart';
import 'package:find_my_doctor/Utils/image_utils.dart';
import 'package:find_my_doctor/ViewModels/main_view_model.dart';
import 'package:find_my_doctor/Widgets/button_with_border.dart';
import 'package:find_my_doctor/Widgets/page_horizontal_margin.dart';
import 'package:find_my_doctor/Widgets/red_button.dart';
import 'package:find_my_doctor/Widgets/text_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:page_transition/page_transition.dart';
import 'package:path_provider/path_provider.dart';
import 'package:stacked/stacked.dart';
import 'package:http/http.dart' as http;
import '../Helpline/chat.dart';
import 'package:path/path.dart' as path;

import 'pdf_screen.dart';

class Appointment_Details_Lab extends StatefulWidget {
  final String? oderId;
  const Appointment_Details_Lab({Key? key, this.oderId}) : super(key: key);

  @override
  State<Appointment_Details_Lab> createState() =>
      _Appointment_Details_LabState();
}

class _Appointment_Details_LabState extends State<Appointment_Details_Lab> {
  static Future<File> loadNetwork(String url) async {
    final response = await http.get(Uri.parse(url));
    final bytes = response.bodyBytes;

    return _storeFile(url, bytes);
  }

  static Future<File> _storeFile(String url, List<int> bytes) async {
    final filename = path.basename(url);
    final dir = await getApplicationDocumentsDirectory();

    final file = File('${dir.path}/$filename');
    await file.writeAsBytes(bytes, flush: true);
    return file;
  }

  void openPDF(BuildContext context, File file) => Navigator.of(context).push(
        MaterialPageRoute(builder: (context) => PDFViewerPage(file: file)),
      );

  var serverUrl = "http://fmd.arraydigitals.com/";
  String dateSelected = "";
  int orderID = 0;
  @override
  Widget build(BuildContext context) {
    var bookid = widget.oderId.toString();
    return ViewModelBuilder<MainViewModel>.reactive(
      viewModelBuilder: () => locator<MainViewModel>(),
      disposeViewModel: false,
      onViewModelReady: (model) async {
        await model.LabBookDetials(
            context, model.prefService.userToken.toString(), bookid);
        //await model.gettingLabBookingDetail(context, model.token!, orderID);
      },
      builder: (context, model, child) {
        return GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: SafeArea(
            top: false,
            bottom: false,
            child: Scaffold(
              backgroundColor: Colors.white,
              body: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        color: ColorUtils.white,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey,
                            offset: Offset(0.0, 1.0), //(x,y)
                            blurRadius: 6.0,
                          ),
                        ],
                      ),
                      child: Column(
                        children: [
                          SizedBox(
                            height: context.getPadding().top,
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 6.w, top: 2.h),
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
                                Padding(
                                  padding: EdgeInsets.only(left: 4.w),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(bookid),
                                      TextWidget(
                                        textValue: "Lab Booking",
                                        fontFamily: FontUtils.interSemiBold,
                                        fontSize: 2.t,
                                        textColor: ColorUtils.red,
                                      ),
                                      SizedBox(
                                        height: 1.h,
                                      ),
                                      TextWidget(
                                        textValue:
                                            "Tue, 29 Nov 2022 • 02:30 pm",
                                        fontFamily: FontUtils.interRegular,
                                        fontSize: 1.6.t,
                                        textColor: ColorUtils.black,
                                      ),
                                    ],
                                  ),
                                ),
                                Spacer(),
                                SizedBox(
                                  width: 2.w,
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 1.h,
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 1.h,
                    ),
                    model.loadingWidget
                        ? Center(child: Text('loading......'))
                        : PageHorizontalMargin(
                            widget: Padding(
                              padding: EdgeInsets.only(top: 3.h),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  TextWidget(
                                    textValue: "Appintment Details",
                                    fontFamily: FontUtils.interSemiBold,
                                    fontSize: 2.2.t,
                                    textColor: ColorUtils.red,
                                  ),
                                  SizedBox(
                                    height: 2.h,
                                  ),
                                  TextWidget(
                                    textValue: "Patient",
                                    fontFamily: FontUtils.interMedium,
                                    fontSize: 1.9.t,
                                    textColor: ColorUtils.black,
                                  ),
                                  SizedBox(
                                    height: 1.h,
                                  ),
                                  TextWidget(
                                    textValue:
                                        model.labmodel.data!.name.toString(),
                                    //"Farah Hussain",
                                    fontFamily: FontUtils.interRegular,
                                    fontSize: 1.8.t,
                                    textColor: ColorUtils.black,
                                  ),
                                  SizedBox(
                                    height: 1.h,
                                  ),
                                  Divider(
                                    height: 0.5.h,
                                    color: ColorUtils.silver,
                                  ),
                                  SizedBox(
                                    height: 2.h,
                                  ),
                                  TextWidget(
                                    textValue: "Test",
                                    fontFamily: FontUtils.interMedium,
                                    fontSize: 1.9.t,
                                    textColor: ColorUtils.black,
                                  ),
                                  SizedBox(
                                    height: 1.h,
                                  ),
                                  // TextWidget(
                                  //   textValue: model
                                  //           .labmodel.data!.tests![0].testName
                                  //           .toString()
                                  //           .isEmpty
                                  //       ? 'No Test avaiable'
                                  //       : model
                                  //           .labmodel.data!.tests![0].testName
                                  //           .toString(),
                                  //   // "CBC",
                                  //   fontFamily: FontUtils.interRegular,
                                  //   fontSize: 1.8.t,
                                  //   textColor: ColorUtils.black,
                                  // ),
                                  SizedBox(
                                    height: 1.h,
                                  ),
                                  Divider(
                                    height: 0.5.h,
                                    color: ColorUtils.silver,
                                  ),
                                  SizedBox(
                                    height: 2.h,
                                  ),
                                  TextWidget(
                                    textValue: "Test_report",
                                    fontFamily: FontUtils.interMedium,
                                    fontSize: 1.9.t,
                                    textColor: ColorUtils.black,
                                  ),
                                  SizedBox(
                                    height: 1.h,
                                  ),
                                  // model.labmodel.data!.tests![0].testReport ==
                                  //         null
                                  //     ? Text('No test report available')
                                  //     : TextButton(
                                  //         onPressed: () async {
                                  //           final url = serverUrl +
                                  //               model.labmodel.data!.tests![0]
                                  //                   .testReport
                                  //                   .toString();

                                  //           final file = await loadNetwork(url);
                                  //           openPDF(context, file);
                                  //         },
                                  //         child: Text(' Test Report Pdf')),
                                  SizedBox(
                                    height: 1.h,
                                  ),
                                  Divider(
                                    height: 0.5.h,
                                    color: ColorUtils.silver,
                                  ),
                                  SizedBox(
                                    height: 2.h,
                                  ),
                                  TextWidget(
                                    textValue: "Status",
                                    fontFamily: FontUtils.interMedium,
                                    fontSize: 1.9.t,
                                    textColor: ColorUtils.black,
                                  ),
                                  SizedBox(
                                    height: 1.h,
                                  ),
                                  TextWidget(
                                    textValue: "Tue, 29 Nov 2022 At 02:30 pm",
                                    fontFamily: FontUtils.interRegular,
                                    fontSize: 1.8.t,
                                    textColor: ColorUtils.lightGreen,
                                  ),
                                  SizedBox(
                                    height: 1.h,
                                  ),
                                  Divider(
                                    height: 0.5.h,
                                    color: ColorUtils.silver,
                                  ),
                                  SizedBox(
                                    height: 2.h,
                                  ),
                                  TextWidget(
                                    textValue: "Call",
                                    fontFamily: FontUtils.interMedium,
                                    fontSize: 1.9.t,
                                    textColor: ColorUtils.black,
                                  ),
                                  SizedBox(
                                    height: 1.h,
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      TextWidget(
                                        textValue: model.labmodel.data!.phone
                                            .toString(),
                                        //"+92 300 25 52 125",
                                        fontFamily: FontUtils.interRegular,
                                        fontSize: 1.8.t,
                                        textColor: ColorUtils.black,
                                      ),
                                      ExpandTapWidget(
                                        onTap: () {
                                          // _launchCaller();
                                        },
                                        tapPadding: EdgeInsets.all(50),
                                        child: Icon(
                                          Icons.call,
                                          color: ColorUtils.red,
                                        ),
                                      )
                                    ],
                                  ),
                                  SizedBox(
                                    height: 1.h,
                                  ),
                                  Divider(
                                    height: 0.5.h,
                                    color: ColorUtils.silver,
                                  ),
                                  SizedBox(
                                    height: 2.h,
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      TextWidget(
                                        textValue: "Address",
                                        fontFamily: FontUtils.interMedium,
                                        fontSize: 1.9.t,
                                        textColor: ColorUtils.black,
                                      ),
                                      ExpandTapWidget(
                                        onTap: () {
                                          // Navigator.push(
                                          //     context,
                                          //     PageTransition(
                                          //         type: PageTransitionType.fade,
                                          //         child: Locations()));
                                        },
                                        tapPadding: EdgeInsets.all(50),
                                        child: SvgPicture.asset(
                                            ImageUtils.location),
                                      )
                                    ],
                                  ),
                                  SizedBox(
                                    height: 1.h,
                                  ),
                                  TextWidget(
                                    textValue:
                                        model.labmodel.data!.address.toString(),
                                    // "F18, 5th Floor, XYZ Towers, St II, Block A, Khayban-e-Imtiaz, Karachi, 75321",
                                    fontFamily: FontUtils.interRegular,
                                    fontSize: 1.8.t,
                                    textColor: ColorUtils.black,
                                  ),
                                  SizedBox(
                                    height: 1.h,
                                  ),
                                  Divider(
                                    height: 0.5.h,
                                    color: ColorUtils.silver,
                                  ),
                                  SizedBox(
                                    height: 2.h,
                                  ),
                                  // TextWidget(
                                  //   textValue: "Blood Group",
                                  //   fontFamily: FontUtils.interMedium,
                                  //   fontSize: 1.9.t,
                                  //   textColor: ColorUtils.black,
                                  // ),
                                  InkWell(
                                    onTap: () {
                                      // _show_Statusbox(context);
                                    },
                                    child: Column(
                                      children: [
                                        Row(
                                          children: [
                                            TextWidget(
                                              textValue: "Status",
                                              fontFamily: FontUtils.interMedium,
                                              fontSize: 1.9.t,
                                              textColor: ColorUtils.black,
                                            ),
                                          ],
                                        ),
                                        SizedBox(
                                          height: 1.h,
                                        ),
                                        Row(
                                          children: [
                                            TextWidget(
                                              textValue: model.labmodel.data!.bStatus.toString(),
                                                  //model.prefService.labId.toString(),
                                                 // "Pending",
                                              //"AB+",
                                              fontFamily:
                                                  FontUtils.interRegular,
                                              fontSize: 1.8.t,
                                              textColor: ColorUtils.black,
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                  // InkWell(
                                  //   onTap: () {
                                  //     _show_Statusbox(context);
                                  //   },
                                  //   child: Row(
                                  //     children: [
                                  //       TextWidget(
                                  //         textValue: "Status",
                                  //         fontFamily: FontUtils.interMedium,
                                  //         fontSize: 1.9.t,
                                  //         textColor: ColorUtils.black,
                                  //       ),
                                  //     ],
                                  //   ),
                                  // ),
                                  // SizedBox(
                                  //   height: 1.h,
                                  // ),
                                  // TextWidget(
                                  //   textValue:
                                  //       //model.prefService.labId.toString(),
                                  //       "Pending",
                                  //   //"AB+",
                                  //   fontFamily: FontUtils.interRegular,
                                  //   fontSize: 1.8.t,
                                  //   textColor: ColorUtils.black,
                                  // ),
                                  SizedBox(
                                    height: 1.h,
                                  ),
                                  Divider(
                                    height: 0.5.h,
                                    color: ColorUtils.silver,
                                  ),
                                  SizedBox(
                                    height: 2.h,
                                  ),
                                  TextWidget(
                                    textValue: "Payment_Method",
                                    fontFamily: FontUtils.interMedium,
                                    fontSize: 1.9.t,
                                    textColor: ColorUtils.black,
                                  ),
                                  SizedBox(
                                    height: 1.h,
                                  ),
                                  TextWidget(
                                    textValue: model
                                        .labmodel.data!.paymentMethod
                                        .toString(),
                                    fontFamily: FontUtils.interRegular,
                                    fontSize: 1.8.t,
                                    textColor: ColorUtils.lightGreen,
                                  ),
                                  SizedBox(
                                    height: 1.h,
                                  ),
                                  Divider(
                                    height: 0.5.h,
                                    color: ColorUtils.silver,
                                  ),
                                  SizedBox(
                                    height: 2.h,
                                  ),
                                  TextWidget(
                                    textValue: "Appintment Details",
                                    fontFamily: FontUtils.interSemiBold,
                                    fontSize: 2.2.t,
                                    textColor: ColorUtils.red,
                                  ),
                                  SizedBox(
                                    height: 2.h,
                                  ),
                                  TextWidget(
                                    textValue: "Amount",
                                    fontFamily: FontUtils.interMedium,
                                    fontSize: 1.9.t,
                                    textColor: ColorUtils.black,
                                  ),
                                  SizedBox(
                                    height: 1.h,
                                  ),
                                  TextWidget(
                                    textValue:
                                        model.labmodel.data!.amount.toString(),
                                    //"Rs. 1,500",
                                    fontFamily: FontUtils.interRegular,
                                    fontSize: 1.8.t,
                                    textColor: ColorUtils.lightGreen,
                                  ),
                                  SizedBox(
                                    height: 1.h,
                                  ),
                                  Divider(
                                    height: 0.5.h,
                                    color: ColorUtils.silver,
                                  ),
                                  SizedBox(
                                    height: 2.h,
                                  ),
                                  TextWidget(
                                    textValue: "Method",
                                    fontFamily: FontUtils.interMedium,
                                    fontSize: 1.9.t,
                                    textColor: ColorUtils.black,
                                  ),
                                  SizedBox(
                                    height: 1.h,
                                  ),
                                  TextWidget(
                                    textValue: "COD",
                                    fontFamily: FontUtils.interRegular,
                                    fontSize: 1.8.t,
                                    textColor: ColorUtils.black,
                                  ),
                                  SizedBox(
                                    height: 1.h,
                                  ),
                                  Divider(
                                    height: 0.5.h,
                                    color: ColorUtils.silver,
                                  ),
                                  SizedBox(
                                    height: 2.h,
                                  ),
                                  RedButton(
                                    textValue: "Chat With Doctor",
                                    onButtonPressed: () {
                                      //  _launchCaller();
                                      Navigator.push(
                                          context,
                                          PageTransition(
                                              type: PageTransitionType.fade,
                                              child: HelpLineChat()));
                                    },
                                  ),
                                  SizedBox(
                                    height: 2.h,
                                  ),
                                  ButtonWithBorder(
                                    textValue: "Edit Booking",
                                    onButtonPressed: () {
                                      Navigator.push(
                                          context,
                                          PageTransition(
                                              type: PageTransitionType.fade,
                                              child: HelpLineChat()));
                                    },
                                    borderColor: ColorUtils.red,
                                    buttonTextColor: ColorUtils.red,
                                  ),
                                  SizedBox(
                                    height: 4.h,
                                  ),
                                ],
                              ),
                            ),
                          ),

                    // PageHorizontalMargin(
                    //   widget: Padding(
                    //     padding: EdgeInsets.only(top: 2.h),
                    //     child: Column(
                    //       crossAxisAlignment: CrossAxisAlignment.start,
                    //       children: [
                    // TextWidget(
                    //   textValue: "Appintment Details",
                    //   fontFamily: FontUtils.interSemiBold,
                    //   fontSize: 2.2.t,
                    //   textColor: ColorUtils.red,
                    // ),
                    // SizedBox(height: 2.h,),
                    // TextWidget(
                    //   textValue: "Patient",
                    //   fontFamily: FontUtils.interMedium,
                    //   fontSize: 1.9.t,
                    //   textColor: ColorUtils.black,
                    // ),
                    // SizedBox(height: 1.h,),
                    // TextWidget(
                    //   textValue: "Farah Hussain",
                    //   fontFamily: FontUtils.interRegular,
                    //   fontSize: 1.8.t,
                    //   textColor: ColorUtils.black,
                    // ),
                    // SizedBox(height: 1.h,),
                    // Divider(height: 0.5.h,color: ColorUtils.silver,),
                    // SizedBox(height: 2.h,),
                    // TextWidget(
                    //   textValue: "Doctor Review",
                    //   fontFamily: FontUtils.interMedium,
                    //   fontSize: 1.9.t,
                    //   textColor: ColorUtils.black,
                    // ),
                    // SizedBox(height: 1.h,),
                    // TextWidget(
                    //   textValue: "...",
                    //   fontFamily: FontUtils.interRegular,
                    //   fontSize: 1.8.t,
                    //   textColor: ColorUtils.black,
                    // ),
                    // SizedBox(height: 1.h,),
                    // Divider(height: 0.5.h,color: ColorUtils.silver,),
                    // SizedBox(height: 2.h,),
                    // TextWidget(
                    //   textValue: "Details",
                    //   fontFamily: FontUtils.interMedium,
                    //   fontSize: 1.9.t,
                    //   textColor: ColorUtils.black,
                    // ),
                    // SizedBox(height: 1.h,),
                    // TextWidget(
                    //   textValue: "It is a long established fact that a reader will be\ndistracted by the readable content of a page.",
                    //   fontFamily: FontUtils.interRegular,
                    //   fontSize: 1.8.t,
                    //   textColor: ColorUtils.black,
                    // ),
                    // SizedBox(height: 1.h,),
                    // Divider(height: 0.5.h,color: ColorUtils.silver,),
                    // SizedBox(height: 2.h,),
                    // TextWidget(
                    //   textValue: "Status",
                    //   fontFamily: FontUtils.interMedium,
                    //   fontSize: 1.9.t,
                    //   textColor: ColorUtils.black,
                    // ),
                    // SizedBox(height: 1.h,),
                    // TextWidget(
                    //   textValue: "Tue, 29 Nov 2022 At 02:30 pm",
                    //   fontFamily: FontUtils.interRegular,
                    //   fontSize: 1.8.t,
                    //   textColor: ColorUtils.lightGreen,
                    // ),
                    // SizedBox(height: 1.h,),
                    // Divider(height: 0.5.h,color: ColorUtils.silver,),
                    // SizedBox(height: 2.h,),
                    // TextWidget(
                    //   textValue: "Appintment Details",
                    //   fontFamily: FontUtils.interSemiBold,
                    //   fontSize: 2.2.t,
                    //   textColor: ColorUtils.red,
                    // ),
                    // SizedBox(height: 2.h,),
                    // TextWidget(
                    //   textValue: "Amount",
                    //   fontFamily: FontUtils.interMedium,
                    //   fontSize: 1.9.t,
                    //   textColor: ColorUtils.black,
                    // ),
                    // SizedBox(height: 1.h,),
                    // TextWidget(
                    //   textValue: "Rs. 1,500",
                    //   fontFamily: FontUtils.interRegular,
                    //   fontSize: 1.8.t,
                    //   textColor: ColorUtils.lightGreen,
                    // ),
                    // SizedBox(height: 1.h,),
                    // Divider(height: 0.5.h,color: ColorUtils.silver,),
                    // SizedBox(height: 2.h,),
                    // TextWidget(
                    //   textValue: "Method",
                    //   fontFamily: FontUtils.interMedium,
                    //   fontSize: 1.9.t,
                    //   textColor: ColorUtils.black,
                    // ),
                    // SizedBox(height: 1.h,),
                    // TextWidget(
                    //   textValue: "COD",
                    //   fontFamily: FontUtils.interRegular,
                    //   fontSize: 1.8.t,
                    //   textColor: ColorUtils.black,
                    // ),
                    //         SizedBox(
                    //           height: 1.h,
                    //         ),
                    //         Divider(
                    //           height: 0.5.h,
                    //           color: ColorUtils.silver,
                    //         ),
                    //         SizedBox(
                    //           height: 2.h,
                    //         ),
                    //         RedButton(
                    //           textValue: "Chat With Doctor",
                    //           onButtonPressed: () {
                    //             Navigator.push(
                    //                 context,
                    //                 PageTransition(
                    //                     type: PageTransitionType.fade,
                    //                     child: HelpLineChat()));
                    //           },
                    //         ),
                    //         SizedBox(
                    //           height: 2.h,
                    //         ),
                    //         ButtonWithBorder(
                    //           textValue: "Edit Booking",
                    //           onButtonPressed: () {},
                    //           borderColor: ColorUtils.red,
                    //           buttonTextColor: ColorUtils.red,
                    //         ),
                    //       ],
                    //     ),
                    //   ),
                    // ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  void _showIOS_DatePicker(BuildContext) {
    showModalBottomSheet(
      isScrollControlled: true,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(24.0),
          topRight: Radius.circular(24.0),
        ),
      ),
      backgroundColor: Colors.white,
      context: context,
      builder: (context) {
        return PageHorizontalMargin(
          widget: Container(
            height: MediaQuery.of(context).size.height / 2,
            child: Column(
              children: [
                SizedBox(
                  height: 2.h,
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: TextWidget(
                    textValue: "Reschedule the Appointment",
                    fontFamily: FontUtils.poppinsBold,
                    fontSize: 2.2.t,
                    textColor: ColorUtils.red,
                  ),
                ),
                SizedBox(
                  height: 2.h,
                ),
                Container(
                  height: 180,
                  child: CupertinoDatePicker(
                      initialDateTime: DateTime.now(),
                      onDateTimeChanged: (val) {
                        setState(() {
                          dateSelected = val.toString();
                        });
                      }),
                ),
                SizedBox(
                  height: 2.h,
                ),
                RedButton(
                  textValue: "Confirm",
                  onButtonPressed: () {},
                ),
                SizedBox(
                  height: 2.h,
                ),
                ButtonWithBorder(
                  textValue: "Cancel",
                  onButtonPressed: () {},
                  borderColor: ColorUtils.red,
                  buttonTextColor: ColorUtils.red,
                ),
                SizedBox(
                  height: 2.h,
                ),
              ],
            ),
          ),
        );
      },
    );
    // showCupertinoModalPopup(
    //    context: BuildContext,
    //     builder: (_) => Container(
    //       height: MediaQuery.of(context).size.height/2.5,
    //       color: Color.fromARGB(255, 255, 255, 255),
    //       child: Column(
    //         crossAxisAlignment: CrossAxisAlignment.start ,
    //         children: [
    //           TextWidget(
    //             textValue: "General Physisian",
    //             fontFamily: FontUtils.interSemiBold,
    //             fontSize: FontSize.size18,
    //             textColor: ColorUtils.red,
    //           ),
    //           SizedBox(height: 2.h,),
    //           Container(
    //             height: 180,
    //             child: CupertinoDatePicker(
    //                 initialDateTime: DateTime.now(),
    //                 onDateTimeChanged: (val) {
    //                   setState(() {
    //                     dateSelected = val.toString();
    //                   });
    //                 }),
    //           ),
    //         ],
    //       ),
    //     ));
  }
}
