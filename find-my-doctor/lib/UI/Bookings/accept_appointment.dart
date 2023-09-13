import 'package:find_my_doctor/UI/Bookings/accept_appointment_detail.dart';
import 'package:find_my_doctor/UI/Bookings/patient_appointment_history.dart';
import 'package:find_my_doctor/UI/Bookings/patient_rx_details.dart';
import 'package:flutter/material.dart';
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
import 'package:flutter_svg/flutter_svg.dart';
import 'package:page_transition/page_transition.dart';
import 'package:stacked/stacked.dart';
import 'package:url_launcher/url_launcher.dart';


class Accept_Appointment extends StatefulWidget {
  const Accept_Appointment({Key? key}) : super(key: key);

  @override
  State<Accept_Appointment> createState() => _Accept_AppointmentState();
}

class _Accept_AppointmentState extends State<Accept_Appointment> {
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
              body: SingleChildScrollView(
                child: Container(
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
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  TextWidget(
                                    textValue: "Doctor Review",
                                    fontFamily: FontUtils.interMedium,
                                    fontSize: 1.9.t,
                                    textColor: ColorUtils.black,
                                  ),
                                  ExpandTapWidget(
                                    onTap: (){

                                    },
                                    tapPadding: EdgeInsets.all(50),
                                    child:SvgPicture.asset(ImageUtils.edit),
                                  ),
                                ],
                              ),
                              SizedBox(height: 1.h,),
                              TextWidget(
                                textValue: "Lorem Ipsum is simply dummy text of the printing.",
                                fontFamily: FontUtils.interRegular,
                                fontSize: 1.8.t,
                                textColor: ColorUtils.black,
                              ),
                              SizedBox(height: 1.h,),
                              Divider(height: 0.5.h,color: ColorUtils.silver,),
                              SizedBox(height: 2.h,),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  TextWidget(
                                    textValue: "Details",
                                    fontFamily: FontUtils.interMedium,
                                    fontSize: 1.9.t,
                                    textColor: ColorUtils.black,
                                  ),
                                  ExpandTapWidget(
                                    onTap: (){
                                       Navigator.push(context,
                                           PageTransition(type: PageTransitionType.fade, child:  Accept_Appointment_Detail()));

                                    },
                                    tapPadding: EdgeInsets.all(50),
                                    child:SvgPicture.asset(ImageUtils.edit),
                                  )
                                ],
                              ),
                              SizedBox(height: 1.h,),
                              TextWidget(
                                textValue: "It is a long established fact that a reader will be\ndistracted by the readable content of a page.\nIt is a long established fact that a reader will be\ndistracted by the readable content of a page.",
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
                                textValue: "Call",
                                fontFamily: FontUtils.interMedium,
                                fontSize: 1.9.t,
                                textColor: ColorUtils.black,
                              ),
                              SizedBox(height: 1.h,),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  TextWidget(
                                    textValue: "+92 300 25 52 125",
                                    fontFamily: FontUtils.interRegular,
                                    fontSize: 1.8.t,
                                    textColor: ColorUtils.black,
                                  ),
                                  ExpandTapWidget(
                                    onTap: (){
                                      _launchCaller();
                                    },
                                    tapPadding: EdgeInsets.all(50),
                                    child:Icon(Icons.call , color: ColorUtils.red,),
                                  )
                                ],
                              ),
                              SizedBox(height: 1.h,),
                              Divider(height: 0.5.h,color: ColorUtils.silver,),
                              SizedBox(height: 2.h,),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  TextWidget(
                                    textValue: "Address",
                                    fontFamily: FontUtils.interMedium,
                                    fontSize: 1.9.t,
                                    textColor: ColorUtils.black,
                                  ),
                                  ExpandTapWidget(
                                    onTap: (){

                                    //  Navigator.push(context, PageTransition(type: PageTransitionType.fade, child:   Locations()));
                                    },
                                    tapPadding: EdgeInsets.all(50),
                                    child:SvgPicture.asset(ImageUtils.location),
                                  )
                                ],
                              ),
                              SizedBox(height: 1.h,),
                              TextWidget(
                                textValue: "F18, 5th Floor, XYZ Towers, St II, Block A, Khayban-e-Imtiaz, Karachi, 75321",
                                fontFamily: FontUtils.interRegular,
                                fontSize: 1.8.t,
                                textColor: ColorUtils.black,
                              ),
                              SizedBox(height: 1.h,),
                              Divider(height: 0.5.h,color: ColorUtils.silver,),
                              SizedBox(height: 2.h,),
                              TextWidget(
                                textValue: "Blood Group",
                                fontFamily: FontUtils.interMedium,
                                fontSize: 1.9.t,
                                textColor: ColorUtils.black,
                              ),
                              SizedBox(height: 1.h,),
                              TextWidget(
                                textValue: "AB+",
                                fontFamily: FontUtils.interRegular,
                                fontSize: 1.8.t,
                                textColor: ColorUtils.black,
                              ),
                              SizedBox(height: 1.h,),
                              Divider(height: 0.5.h,color: ColorUtils.silver,),
                              SizedBox(height: 2.h,),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  TextWidget(
                                    textValue: "Test",
                                    fontFamily: FontUtils.interMedium,
                                    fontSize: 1.9.t,
                                    textColor: ColorUtils.black,
                                  ),
                                  ExpandTapWidget(
                                    onTap: (){

                                    },
                                    tapPadding: EdgeInsets.all(50),
                                    child:SvgPicture.asset(ImageUtils.edit),
                                  )
                                ],
                              ),
                              SizedBox(height: 1.h,),
                              TextWidget(
                                textValue: "CBC",
                                fontFamily: FontUtils.interRegular,
                                fontSize: 1.8.t,
                                textColor: ColorUtils.black,
                              ),
                              SizedBox(height: 1.h,),
                              Divider(height: 0.5.h,color: ColorUtils.silver,),
                              SizedBox(height: 2.h,),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  TextWidget(
                                    textValue: "RX",
                                    fontFamily: FontUtils.interMedium,
                                    fontSize: 1.9.t,
                                    textColor: ColorUtils.black,
                                  ),
                                  ExpandTapWidget(
                                    onTap: (){
                                      Navigator.push(context, PageTransition(type: PageTransitionType.fade, child:  Patient_RX_Details()));
                                    },
                                    tapPadding: EdgeInsets.all(50),
                                    child:SvgPicture.asset(ImageUtils.edit),
                                  )
                                ],
                              ),
                              SizedBox(height: 1.h,),
                              TextWidget(
                                textValue: "Panadol",
                                fontFamily: FontUtils.interRegular,
                                fontSize: 1.8.t,
                                textColor: ColorUtils.black,
                              ),
                              SizedBox(height: 1.h,),
                              Divider(height: 0.5.h,color: ColorUtils.silver,),
                              SizedBox(height: 2.h,),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  TextWidget(
                                    textValue: "History",
                                    fontFamily: FontUtils.interMedium,
                                    fontSize: 1.9.t,
                                    textColor: ColorUtils.black,
                                  ),
                                  ExpandTapWidget(
                                    onTap: (){

                                      Navigator.push(context, PageTransition(type: PageTransitionType.fade, child:   Patient_Appointment_History()));
                                    },
                                    tapPadding: EdgeInsets.all(50),
                                    child:SvgPicture.asset(ImageUtils.edit),
                                  )
                                ],
                              ),
                              SizedBox(height: 1.h,),
                              TextWidget(
                                textValue: "Lorem Ipsum is simply dummy text of the printing and typesetting industry.",
                                fontFamily: FontUtils.interRegular,
                                fontSize: 1.8.t,
                                textColor: ColorUtils.black,
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
                                textValue: "Call The Patient",
                                onButtonPressed: (){
                                  _launchCaller();
                                  // Navigator.push(context,
                                  //     PageTransition(type: PageTransitionType.fade, child: ()));
                                },
                              ),
                              SizedBox(height: 2.h,),
                              ButtonWithBorder(
                                textValue: "Chat With Patient",
                                onButtonPressed: (){
                                  // Navigator.push(context,
                                  //     PageTransition(type: PageTransitionType.fade, child: HelpLineChat(orderId:,)));
                                },
                                borderColor: ColorUtils.red,
                                buttonTextColor: ColorUtils.red,
                              ),
                              SizedBox(height: 4.h,),
                            ],
                          ),
                        ),
                      ),


                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
  _launchCaller() async {
    const url = "1234567";
    if (await canLaunchUrl(Uri(scheme: "tel" , path: url))) {
      await launchUrl(Uri(scheme: "tel" , path: url));
    } else {
      throw 'Could not launch $url';
    }
  }
}
