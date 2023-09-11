import 'package:find_my_doctor/App/locator.dart';
import 'package:find_my_doctor/UI/Home/Pharmacy/pharmacy_track_order.dart';
import 'package:find_my_doctor/Utils/color_utils.dart';
import 'package:find_my_doctor/Utils/extensions.dart';
import 'package:find_my_doctor/Utils/font_utils.dart';
import 'package:find_my_doctor/Utils/image_utils.dart';
import 'package:find_my_doctor/ViewModels/main_view_model.dart';
import 'package:find_my_doctor/Widgets/button_with_border.dart';
import 'package:find_my_doctor/Widgets/page_horizontal_margin.dart';
import 'package:find_my_doctor/Widgets/red_button.dart';
import 'package:find_my_doctor/Widgets/text_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:page_transition/page_transition.dart';
import 'package:stacked/stacked.dart';

import '../../../Widgets/bottom_navigation_bar.dart';

class PaymentSuccess extends StatefulWidget {

  bool? fromPharmacy = false;
  bool? fromInsurance = false;
  bool? fromLabTest = false;
  bool? fromPhysicalVisit = false;

  PaymentSuccess({Key? key, this.fromPharmacy, this.fromInsurance, this.fromLabTest, this.fromPhysicalVisit}) : super(key: key);

  @override
  State<PaymentSuccess> createState() => _PaymentSuccessState();
}

class _PaymentSuccessState extends State<PaymentSuccess> {
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
                children: [
                  Column(
                    children: [
                      SizedBox(
                        height: context.getPadding().top,
                      ),
                      SizedBox(height: 2.h,),
                      Center(
                        child: Image.asset(ImageUtils.maleDoctor,
                          width: 60.i,
                          height: 60.i,
                        ),
                      ),
                      TextWidget(
                        textValue: "Success!",
                        fontFamily: FontUtils.poppinsSemiBold,
                        fontSize: 4.t,
                        textColor: ColorUtils.red,
                      ),
                      TextWidget(
                        textValue: "Your policy request has been recieved.",
                        fontFamily: FontUtils.interRegular,
                        fontSize: 1.6.t,
                        textColor: ColorUtils.blackShade,
                      ),
                      SizedBox(height: 4.h,),
                    ],
                  ),
                  Expanded(
                    child: SingleChildScrollView(
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: PageHorizontalMargin(
                          widget: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              TextWidget(
                                textValue: "Booking Details",
                                fontFamily: FontUtils.poppinsBold,
                                fontSize: 2.2.t,
                                textColor: ColorUtils.red,
                              ),

                              // Date and Id
                              SizedBox(height: 2.h,),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      TextWidget(
                                        textValue: "Date & Time",
                                        fontFamily: FontUtils.poppinsSemiBold,
                                        fontSize: 1.6.t,
                                        textColor: ColorUtils.black1,
                                      ),
                                      SizedBox(height: 1.h,),
                                      TextWidget(
                                        textValue: "5th June 2022 • 03:45 PM",
                                        fontFamily: FontUtils.interRegular,
                                        fontSize: 1.8.t,
                                        textColor: ColorUtils.black1,
                                      ),
                                    ],
                                  ),
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      TextWidget(
                                        textValue: "Booking ID",
                                        fontFamily: FontUtils.poppinsSemiBold,
                                        fontSize: 1.6.t,
                                        textColor: ColorUtils.black1,
                                      ),
                                      SizedBox(height: 1.h,),
                                      TextWidget(
                                        textValue: "PLC#123456",
                                        fontFamily: FontUtils.interRegular,
                                        fontSize: 1.8.t,
                                        textColor: ColorUtils.black1,
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              SizedBox(height: 1.h,),
                              Divider(
                                color: ColorUtils.silver,
                              ),

                              // Provider and Status
                              SizedBox(height: 1.h,),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      TextWidget(
                                        textValue: widget.fromInsurance == true ? "Provider" : "Patient",
                                        fontFamily: FontUtils.poppinsSemiBold,
                                        fontSize: 1.6.t,
                                        textColor: ColorUtils.black1,
                                      ),
                                      SizedBox(height: 1.h,),
                                      TextWidget(
                                        textValue:widget.fromInsurance == true ? "Provider 1 | Insurance" : "Self",
                                        fontFamily: FontUtils.interRegular,
                                        fontSize: 1.8.t,
                                        textColor: ColorUtils.black1,
                                      ),
                                    ],
                                  ),
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      TextWidget(
                                        textValue: "Status",
                                        fontFamily: FontUtils.poppinsSemiBold,
                                        fontSize: 1.6.t,
                                        textColor: ColorUtils.black1,
                                      ),
                                      SizedBox(height: 1.h,),
                                      Row(
                                        children: [
                                          Icon(Icons.circle,
                                          size: 2.i,
                                            color: ColorUtils.yellow,
                                          ),
                                          SizedBox(width: 1.w,),
                                          TextWidget(
                                            textValue: "In Process",
                                            fontFamily: FontUtils.interRegular,
                                            fontSize: 1.8.t,
                                            textColor: ColorUtils.yellow,
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              SizedBox(height: 1.h,),
                              Divider(
                                color: ColorUtils.silver,
                              ),

                              // Plan
                              SizedBox(height: 1.h,),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      TextWidget(
                                        textValue: "Plan",
                                        fontFamily: FontUtils.poppinsSemiBold,
                                        fontSize: 1.6.t,
                                        textColor: ColorUtils.black1,
                                      ),
                                      SizedBox(height: 1.h,),
                                      TextWidget(
                                        textValue: "Basic Plan",
                                        fontFamily: FontUtils.interRegular,
                                        fontSize: 1.8.t,
                                        textColor: ColorUtils.black1,
                                      ),
                                    ],
                                  ),
                                  SvgPicture.asset(ImageUtils.forwardIcon),
                                ],
                              ),
                              SizedBox(height: 1.h,),
                              Divider(
                                color: ColorUtils.silver,
                              ),

                              // Address
                              SizedBox(height: 1.h,),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  TextWidget(
                                    textValue: "Address",
                                    fontFamily: FontUtils.poppinsSemiBold,
                                    fontSize: 1.6.t,
                                    textColor: ColorUtils.black1,
                                  ),
                                  SizedBox(height: 0.5.h,),
                                  Text("F18, 5th Floor, XYZ Towers, St II, Block A, Khayban-e-Imtiaz, Karachi, 75321",
                                  style: TextStyle(
                                    height: 0.2.h,
                                    fontFamily: FontUtils.interRegular,
                                    fontSize: 1.8.t,
                                    color: ColorUtils.black1,
                                  ),
                                  ),
                                ],
                              ),
                              SizedBox(height: 1.h,),
                              Divider(
                                color: ColorUtils.silver,
                              ),

                              // Payment Details
                              TextWidget(
                                textValue: "Payment Details",
                                fontFamily: FontUtils.poppinsBold,
                                fontSize: 2.2.t,
                                textColor: ColorUtils.red,
                              ),
                              SizedBox(height: 2.h,),
                              Padding(
                                padding: EdgeInsets.symmetric(horizontal: 5.w),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        TextWidget(
                                          textValue: "Payment Method",
                                          fontFamily: FontUtils.poppinsSemiBold,
                                          fontSize: 1.6.t,
                                          textColor: ColorUtils.black1,
                                        ),
                                        if(widget.fromPhysicalVisit == false)
                                        Row(
                                          children: [
                                            SvgPicture.asset(ImageUtils.masterCard),
                                            SizedBox(width: 1.5.w,),
                                            TextWidget(
                                              textValue: "Card",
                                              fontFamily: FontUtils.poppinsSemiBold,
                                              fontSize: 1.6.t,
                                              textColor: ColorUtils.black1,
                                            ),
                                          ],
                                        ),
                                        if(widget.fromPhysicalVisit == true)
                                          Row(
                                            children: [
                                              SizedBox(
                                                width: 10.i,
                                                  child: Image.asset(ImageUtils.cash)),
                                              SizedBox(width: 1.5.w,),
                                              TextWidget(
                                                textValue: "Cash on Delivery",
                                                fontFamily: FontUtils.poppinsSemiBold,
                                                fontSize: 1.6.t,
                                                textColor: ColorUtils.black1,
                                              ),
                                            ],
                                          ),
                                      ],
                                    ),
                                    Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        TextWidget(
                                          textValue: "Total Test Charges",
                                          fontFamily: FontUtils.poppinsSemiBold,
                                          fontSize: 1.6.t,
                                          textColor: ColorUtils.black1,
                                        ),
                                        TextWidget(
                                          textValue: "Rs. 1.180",
                                          fontFamily: FontUtils.interSemiBold,
                                          fontSize: 1.8.t,
                                          textColor: ColorUtils.lightGreen,
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),

                              SizedBox(height: 3.h,),
                              if(widget.fromPharmacy == true)
                                RedButton(
                                  textValue: "Track Order",
                                  onButtonPressed: (){
                                    Navigator.push(context,
                                        PageTransition(type: PageTransitionType.fade, child:  PharmacyTrackOrder()));
                                  },
                                ),
                              if(widget.fromInsurance == true || widget.fromLabTest == true || widget.fromPhysicalVisit == true)
                              RedButton(
                                textValue: "Back to Home",
                                onButtonPressed: (){
                                  Navigator.push(context,
                                      PageTransition(type: PageTransitionType.fade, child:  MyBottomNavBar()));
                                },
                              ),
                              SizedBox(height: 2.h,),
                              ButtonWithBorder(
                                textValue: "Save To Gallery",
                                buttonTextColor: ColorUtils.red,
                                borderColor: ColorUtils.red,
                                onButtonPressed: (){},
                              ),
                              SizedBox(height: 1.h,),
                            ],
                          ),
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
