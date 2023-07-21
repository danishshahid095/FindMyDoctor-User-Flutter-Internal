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
import 'package:stacked/stacked.dart';

import '../Helpline/chat.dart';

class Appointment_Details extends StatefulWidget {
  const Appointment_Details({Key? key}) : super(key: key);

  @override
  State<Appointment_Details> createState() => _Appointment_DetailsState();
}

class _Appointment_DetailsState extends State<Appointment_Details> {

  String dateSelected = "";
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<MainViewModel>.reactive(
      viewModelBuilder: () => locator<MainViewModel>(),
      disposeViewModel: false,
      onModelReady: (model) {
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
                                onTap: (){
                                  Navigator.pop(context);
                                },
                                tapPadding: EdgeInsets.all(50),
                                child:SvgPicture.asset(ImageUtils.backArrowRed),
                              ),
                              Padding(
                                padding:EdgeInsets.only(left: 4.w),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    TextWidget(
                                      textValue: "General Physisian",
                                      fontFamily: FontUtils.interSemiBold,
                                      fontSize: 2.t,
                                      textColor: ColorUtils.red,
                                    ),
                                    SizedBox(height: 1.h,),
                                    TextWidget(
                                      textValue: "Tue, 29 Nov 2022 • 02:30 pm",
                                      fontFamily: FontUtils.interRegular,
                                      fontSize: 1.6.t,
                                      textColor: ColorUtils.black,
                                    ),
                                  ],
                                ),
                              ),
                              Spacer(),
                              SizedBox(width: 2.w,),
                            ],
                          ),
                        ),
                        SizedBox(height: 1.h,),
                      ],
                    ),
                  ),
                  PageHorizontalMargin(
                    widget: Padding(
                      padding: EdgeInsets.only(top: 2.h ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          TextWidget(
                            textValue: "Appintment Details",
                            fontFamily: FontUtils.interSemiBold,
                            fontSize: 2.2.t,
                            textColor: ColorUtils.red,
                          ),
                          SizedBox(height: 2.h,),
                          TextWidget(
                            textValue: "Patient",
                            fontFamily: FontUtils.interMedium,
                            fontSize: 1.9.t,
                            textColor: ColorUtils.black,
                          ),
                          SizedBox(height: 1.h,),
                          TextWidget(
                            textValue: "Farah Hussain",
                            fontFamily: FontUtils.interRegular,
                            fontSize: 1.8.t,
                            textColor: ColorUtils.black,
                          ),
                          SizedBox(height: 1.h,),
                          Divider(height: 0.5.h,color: ColorUtils.silver,),
                          SizedBox(height: 2.h,),
                          TextWidget(
                            textValue: "Doctor Review",
                            fontFamily: FontUtils.interMedium,
                            fontSize: 1.9.t,
                            textColor: ColorUtils.black,
                          ),
                          SizedBox(height: 1.h,),
                          TextWidget(
                            textValue: "...",
                            fontFamily: FontUtils.interRegular,
                            fontSize: 1.8.t,
                            textColor: ColorUtils.black,
                          ),
                          SizedBox(height: 1.h,),
                          Divider(height: 0.5.h,color: ColorUtils.silver,),
                          SizedBox(height: 2.h,),
                          TextWidget(
                            textValue: "Details",
                            fontFamily: FontUtils.interMedium,
                            fontSize: 1.9.t,
                            textColor: ColorUtils.black,
                          ),
                          SizedBox(height: 1.h,),
                          TextWidget(
                            textValue: "It is a long established fact that a reader will be\ndistracted by the readable content of a page.",
                            fontFamily: FontUtils.interRegular,
                            fontSize: 1.8.t,
                            textColor: ColorUtils.black,
                          ),
                          SizedBox(height: 1.h,),
                          Divider(height: 0.5.h,color: ColorUtils.silver,),
                          SizedBox(height: 2.h,),
                          TextWidget(
                            textValue: "Status",
                            fontFamily: FontUtils.interMedium,
                            fontSize: 1.9.t,
                            textColor: ColorUtils.black,
                          ),
                          SizedBox(height: 1.h,),
                          TextWidget(
                            textValue: "Tue, 29 Nov 2022 At 02:30 pm",
                            fontFamily: FontUtils.interRegular,
                            fontSize: 1.8.t,
                            textColor: ColorUtils.lightGreen,
                          ),
                          SizedBox(height: 1.h,),
                          Divider(height: 0.5.h,color: ColorUtils.silver,),
                          SizedBox(height: 2.h,),
                          TextWidget(
                            textValue: "Appintment Details",
                            fontFamily: FontUtils.interSemiBold,
                            fontSize: 2.2.t,
                            textColor: ColorUtils.red,
                          ),
                          SizedBox(height: 2.h,),
                          TextWidget(
                            textValue: "Amount",
                            fontFamily: FontUtils.interMedium,
                            fontSize: 1.9.t,
                            textColor: ColorUtils.black,
                          ),
                          SizedBox(height: 1.h,),
                          TextWidget(
                            textValue: "Rs. 1,500",
                            fontFamily: FontUtils.interRegular,
                            fontSize: 1.8.t,
                            textColor: ColorUtils.lightGreen,
                          ),
                          SizedBox(height: 1.h,),
                          Divider(height: 0.5.h,color: ColorUtils.silver,),
                          SizedBox(height: 2.h,),
                          TextWidget(
                            textValue: "Method",
                            fontFamily: FontUtils.interMedium,
                            fontSize: 1.9.t,
                            textColor: ColorUtils.black,
                          ),
                          SizedBox(height: 1.h,),
                          TextWidget(
                            textValue: "COD",
                            fontFamily: FontUtils.interRegular,
                            fontSize: 1.8.t,
                            textColor: ColorUtils.black,
                          ),
                          SizedBox(height: 1.h,),
                          Divider(height: 0.5.h,color: ColorUtils.silver,),
                          SizedBox(height: 2.h,),
                          RedButton(
                            textValue: "Chat With Doctor",
                            onButtonPressed: (){
                               Navigator.push(context,
                                   PageTransition(type: PageTransitionType.fade, child: HelpLineChat()));
                            },
                          ),
                          SizedBox(height: 2.h,),
                          ButtonWithBorder(
                            textValue: "Edit Booking",
                            onButtonPressed: (){
                            },
                            borderColor: ColorUtils.red,
                            buttonTextColor: ColorUtils.red,
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
  void _showIOS_DatePicker(BuildContext ) {
    showModalBottomSheet(
      isScrollControlled: true,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(24.0),
          topRight: Radius.circular(24.0),
        ),
      ),
      backgroundColor: Colors.white, context: context, builder: (context) {
      return PageHorizontalMargin(
        widget: Container(
          height: MediaQuery.of(context).size.height/2,
          child: Column(
            children: [
              SizedBox(height: 2.h,),
              Align(
                alignment: Alignment.centerLeft,
                child: TextWidget(
                  textValue: "Reschedule the Appointment",
                  fontFamily: FontUtils.poppinsBold,
                  fontSize: 2.2.t,
                  textColor: ColorUtils.red,
                ),
              ),
              SizedBox(height: 2.h,),
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
              SizedBox(height: 2.h,),
              RedButton(
                textValue: "Confirm",
                onButtonPressed: (){

                },
              ),
              SizedBox(height: 2.h,),
              ButtonWithBorder(
                textValue: "Cancel",
                onButtonPressed: (){
                },
                borderColor: ColorUtils.red,
                buttonTextColor: ColorUtils.red,
              ),
              SizedBox(height: 2.h,),
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
