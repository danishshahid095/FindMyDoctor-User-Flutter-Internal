import 'package:find_my_doctor/App/locator.dart';
import 'package:find_my_doctor/UI/Home/Pharmacy/pharmacy_payment_method.dart';
import 'package:find_my_doctor/Utils/color_utils.dart';
import 'package:find_my_doctor/Utils/extensions.dart';
import 'package:find_my_doctor/Utils/font_utils.dart';
import 'package:find_my_doctor/Utils/image_utils.dart';
import 'package:find_my_doctor/ViewModels/main_view_model.dart';
import 'package:find_my_doctor/Widgets/back_with_signleText.dart';
import 'package:find_my_doctor/Widgets/forward_button_black.dart';
import 'package:find_my_doctor/Widgets/page_horizontal_margin.dart';
import 'package:find_my_doctor/Widgets/red_button.dart';
import 'package:find_my_doctor/Widgets/text_widget.dart';
import 'package:find_my_doctor/Widgets/top_margin_home.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:page_transition/page_transition.dart';
import 'package:stacked/stacked.dart';

class PharmacyConfirmDetails extends StatelessWidget {
  const PharmacyConfirmDetails({Key? key}) : super(key: key);

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
                  Column(
                    children: [
                      SizedBox(
                        height: context.getPadding().top,
                      ),
                      BackSingleText(
                        backText: "Confirm Details",
                      ),
                      SizedBox(height: 1.h,),
                    ],
                  ),
                  Expanded(
                    child: PageHorizontalMargin(
                      widget: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          TopMarginHome(),
                          TextWidget(
                            textValue: "Booking Details",
                            fontFamily: FontUtils.poppinsSemiBold,
                            fontSize: 2.t,
                            textColor: ColorUtils.red,
                          ),
                          SizedBox(height: 2.h,),

                          //Recipient
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  TextWidget(
                                    textValue: "Recipient",
                                    textColor: ColorUtils.blackShade,
                                    fontFamily: FontUtils.interSemiBold,
                                    fontSize: 1.6.t,
                                  ),
                                  SizedBox(height: 1.h,),
                                  TextWidget(
                                    textValue: "Self",
                                    textColor: ColorUtils.blackShade,
                                    fontFamily: FontUtils.interRegular,
                                    fontSize: 1.8.t,
                                  ),
                                ],
                              ),
                              ForwardButtonBlack(),
                            ],
                          ),
                          SizedBox(height: 1.h),
                          Divider(
                            color: ColorUtils.silver,
                          ),

                          //Address
                          SizedBox(height: 2.h,),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  TextWidget(
                                    textValue: "Address",
                                    textColor: ColorUtils.blackShade,
                                    fontFamily: FontUtils.interSemiBold,
                                    fontSize: 1.6.t,
                                  ),
                                  SizedBox(height: 1.h,),
                                  TextWidget(
                                    textValue: "Self",
                                    textColor: ColorUtils.blackShade,
                                    fontFamily: FontUtils.interRegular,
                                    fontSize: 1.8.t,
                                  ),
                                ],
                              ),
                              ForwardButtonBlack(),
                            ],
                          ),
                          SizedBox(height: 1.h),
                          Divider(
                            color: ColorUtils.silver,
                          ),

                          SizedBox(height: 2.h,),
                          TextWidget(
                            textValue: "Promo Code / Policy Number",
                            fontFamily: FontUtils.poppinsSemiBold,
                            fontSize: 2.t,
                            textColor: ColorUtils.red,
                          ),
                          SizedBox(height: 2.h,),
                          Container(
                            padding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 2.h),
                            decoration: BoxDecoration(
                                shape: BoxShape.rectangle,
                                border: Border.all(
                                    color: ColorUtils.red,
                                    width: 1
                                ),
                                borderRadius: BorderRadius.circular(10)
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                TextWidget(
                                  textValue: "EFU12345-07",
                                  fontFamily: FontUtils.interRegular,
                                  fontSize: 1.8.t,
                                  textColor: ColorUtils.blackShade,
                                ),
                                Icon(Icons.check_circle,
                                color: ColorUtils.red,
                                )
                              ],
                            ),
                          ),

                          //Cart Items
                          SizedBox(height: 2.h,),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  TextWidget(
                                    textValue: "Cart Items",
                                    fontFamily: FontUtils.poppinsSemiBold,
                                    fontSize: 2.t,
                                    textColor: ColorUtils.red,
                                  ),
                                  SizedBox(height: 0.5.h,),
                                  TextWidget(
                                    textValue: "1 Items (s)",
                                    fontFamily: FontUtils.interRegular,
                                    fontSize: 1.6.t,
                                    textColor: ColorUtils.blackShade,
                                  ),
                                ],
                              ),
                              SvgPicture.asset(ImageUtils.arrowUp),
                            ],
                          ),
                          SizedBox(height: 1.h,),
                          Container(
                            padding: EdgeInsets.symmetric(horizontal: 3.w),
                            decoration: BoxDecoration(
                              shape: BoxShape.rectangle,
                              borderRadius: BorderRadius.circular(8),
                              color: ColorUtils.white,
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.withOpacity(0.5),
                                  spreadRadius: 5,
                                  blurRadius: 7,
                                  offset: Offset(0, 3), // changes position of shadow
                                ),
                              ],
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                SizedBox(
                                  width: 15.w,
                                  height: 15.h,
                                  child: Image.asset(ImageUtils.calpol,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                SizedBox(width: 2.w,),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    TextWidget(
                                      textValue: "Calpol Syrup",
                                      fontFamily: FontUtils.interSemiBold,
                                      fontSize: 1.8.t,
                                      textColor: ColorUtils.blackShade,
                                    ),
                                    SizedBox(height: 0.5.h,),
                                    TextWidget(
                                      textValue: "100ml x 1 bottle",
                                      fontFamily: FontUtils.interMedium,
                                      fontSize: 1.6.t,
                                      textColor: ColorUtils.silver2,
                                    ),
                                    SizedBox(height: 1.h,),
                                    TextWidget(
                                      textValue: "PKR. 720",
                                      fontFamily: FontUtils.interBold,
                                      fontSize: 2.2.t,
                                      textColor: ColorUtils.lightGreen,
                                    ),
                                    Text("/PKR. 120",
                                      style: TextStyle(
                                        fontFamily: FontUtils.interMedium,
                                        fontSize: 1.4.t,
                                        color: ColorUtils.silver2,
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(width: 2.w,),
                                Container(
                                  decoration: BoxDecoration(
                                    shape: BoxShape.rectangle,
                                    borderRadius: BorderRadius.circular(30),
                                    color: ColorUtils.white,
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.grey.withOpacity(0.5),
                                        spreadRadius: 5,
                                        blurRadius: 7,
                                        offset: Offset(0, 3), // changes position of shadow
                                      ),
                                    ],
                                  ),
                                  child: Padding(
                                    padding: EdgeInsets.symmetric(horizontal: 1.w, vertical: 1.h),
                                    child: Row(
                                      children: [
                                        Container(
                                          decoration: BoxDecoration(
                                            shape: BoxShape.circle,
                                            color: ColorUtils.red,
                                          ),
                                          child: Padding(
                                            padding: const EdgeInsets.all(4.0),
                                            child: Icon(
                                                Icons.horizontal_rule,
                                                color: Colors.white,
                                                size: 22
                                            ),
                                          ),
                                        ),
                                        SizedBox(width: 6.w,),
                                        TextWidget(
                                          textValue: "6",
                                          fontFamily: FontUtils.interBold,
                                          fontSize: 2.t,
                                          textColor: ColorUtils.blackShade,
                                        ),
                                        SizedBox(width: 6.w,),
                                        Container(
                                          decoration: BoxDecoration(
                                            shape: BoxShape.circle,
                                            color: ColorUtils.red,
                                          ),
                                          child: Padding(
                                            padding: const EdgeInsets.all(4.0),
                                            child: Icon(Icons.add,
                                            color: ColorUtils.white,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  PageHorizontalMargin(
                    widget: RedButton(
                      textValue: "Select Payment Method",
                      onButtonPressed: (){
                          Navigator.push(context,
                              PageTransition(type: PageTransitionType.fade, child:  PharmacyPaymentMethod()));
                      },

                    ),
                  ),
                  SizedBox(height: 2.h,)
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
