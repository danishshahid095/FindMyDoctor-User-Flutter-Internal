import 'package:find_my_doctor/App/locator.dart';
import 'package:find_my_doctor/UI/Home/Insurance/payment_success.dart';
import 'package:find_my_doctor/Utils/color_utils.dart';
import 'package:find_my_doctor/Utils/extensions.dart';
import 'package:find_my_doctor/Utils/font_utils.dart';
import 'package:find_my_doctor/Utils/image_utils.dart';
import 'package:find_my_doctor/ViewModels/main_view_model.dart';
import 'package:find_my_doctor/Widgets/back_with_signleText.dart';
import 'package:find_my_doctor/Widgets/forward_button_black.dart';
import 'package:find_my_doctor/Widgets/grey_background_button.dart';
import 'package:find_my_doctor/Widgets/page_horizontal_margin.dart';
import 'package:find_my_doctor/Widgets/text_widget.dart';
import 'package:find_my_doctor/Widgets/top_margin_home.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:page_transition/page_transition.dart';
import 'package:stacked/stacked.dart';

class LabTestConfirmDetails extends StatefulWidget {
  const LabTestConfirmDetails({Key? key}) : super(key: key);

  @override
  State<LabTestConfirmDetails> createState() => _LabTestConfirmDetailsState();
}

class _LabTestConfirmDetailsState extends State<LabTestConfirmDetails> {

  bool switchValue = true;

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
                    child: SingleChildScrollView(
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

                            // Date & Time
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    TextWidget(
                                      textValue: "Date & Time",
                                      textColor: ColorUtils.blackShade,
                                      fontFamily: FontUtils.interSemiBold,
                                      fontSize: 1.6.t,
                                    ),
                                    SizedBox(height: 1.h,),
                                    TextWidget(
                                      textValue: "5th June 2022 • 03:45 PM",
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

                            //Recipient
                            SizedBox(height: 2.h,),
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
                                      textValue: "F18, 5th Floor, XYZ Towers, St II, Block A, Kha...",
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

                            //Reminder
                            SizedBox(height: 2.h,),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      TextWidget(
                                        textValue: "Reminder",
                                        textColor: ColorUtils.blackShade,
                                        fontFamily: FontUtils.interSemiBold,
                                        fontSize: 1.6.t,
                                      ),
                                      SizedBox(height: 1.h,),
                                      Text("10 mins befor time",
                                        style: TextStyle(
                                            fontFamily: FontUtils.interRegular,
                                            fontSize: 1.8.t,
                                            color: ColorUtils.blackShade
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Switch(
                                  materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                                  activeColor: ColorUtils.red,
                                  value: switchValue,
                                  onChanged: (value) {
                                    setState(() {
                                      switchValue = value;
                                    });
                                  },
                                ),
                              ],
                            ),
                            SizedBox(height: 1.h),
                            Divider(
                              color: ColorUtils.silver,
                            ),

                            //Promo Code / Policy Number
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

                            //Payment Details
                            SizedBox(height: 2.h,),
                            TextWidget(
                              textValue: "Payment Details",
                              fontFamily: FontUtils.poppinsSemiBold,
                              fontSize: 2.t,
                              textColor: ColorUtils.red,
                            ),
                            SizedBox(height: 2.h,),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    TextWidget(
                                      textValue: "Total Tests Charges",
                                      fontFamily: FontUtils.interSemiBold,
                                      fontSize: 1.6.t,
                                      textColor: ColorUtils.blackShade,
                                    ),
                                    SizedBox(height: 1.h,),
                                    TextWidget(
                                      textValue: "Rs. 3,800",
                                      fontFamily: FontUtils.interSemiBold,
                                      fontSize: 2.t,
                                      textColor: ColorUtils.lightGreen,
                                    ),
                                  ],
                                ),
                                GestureDetector(
                                  onTap: (){
                                    showModalBottomSheet(
                                      isScrollControlled: true,
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.only(
                                          topLeft: Radius.circular(24.0),
                                          topRight: Radius.circular(24.0),
                                        ),
                                      ),
                                      backgroundColor: Colors.white, context: context, builder: (BuildContext context) {
                                      return PageHorizontalMargin(
                                        widget: Container(
                                          height: MediaQuery.of(context).size.height/2.8,
                                          child: Column(
                                            children: [
                                              SizedBox(height: 2.h,),
                                              Align(
                                                alignment: Alignment.centerLeft,
                                                child: TextWidget(
                                                  textValue: "Booked Test",
                                                  fontFamily: FontUtils.poppinsBold,
                                                  fontSize: 2.8.t,
                                                  textColor: ColorUtils.red,
                                                ),
                                              ),
                                              SizedBox(height: 2.h,),
                                              SizedBox(
                                            height: 25.h,
                                            child: ListView.separated(
                                              padding: EdgeInsets.zero,
                                              itemBuilder: (context, index) {
                                                return Row(
                                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                  children: [
                                                    Row(
                                                      children: [
                                                        SizedBox(
                                                            height: 15.i,
                                                            width: 15.i,
                                                            child: Image.asset(model.selectedTestsList[index]["testLabImage"])),
                                                        SizedBox(width: 2.w,),
                                                        Column(
                                                          crossAxisAlignment: CrossAxisAlignment.start,
                                                          children: [
                                                            TextWidget(
                                                              textValue: model.selectedTestsList[index]["name"],
                                                              fontFamily: FontUtils.poppinsBold,
                                                              fontSize: 1.8.t,
                                                              textColor: ColorUtils.red,
                                                            ),
                                                            SizedBox(height: 0.5.h,),
                                                            TextWidget(
                                                              textValue: model.selectedTestsList[index]["labDetails"],
                                                              fontFamily: FontUtils.interRegular,
                                                              fontSize: 1.6.t,
                                                              textColor: ColorUtils.blackShade,
                                                            ),
                                                          ],
                                                        ),
                                                      ],
                                                    ),
                                                    Row(
                                                      children: [
                                                        TextWidget(
                                                          textValue: model.selectedTestsList[index]["charges"],
                                                          fontFamily: FontUtils.interSemiBold,
                                                          fontSize: 2.t,
                                                          textColor: ColorUtils.lightGreen,
                                                        ),
                                                        SizedBox(width: 2.w,),
                                                        Icon(Icons.cancel_outlined,
                                                          color: ColorUtils.red,
                                                        )
                                                      ],
                                                    ),
                                                  ],
                                                );
                                              },
                                              separatorBuilder: (context, index) {
                                                return Divider(
                                                  color: ColorUtils.silver,
                                                );
                                              },
                                              itemCount: model.selectedTestsList.length,
                                            ),
                                          ),
                                              SizedBox(height: 2.h,),
                                            ],
                                          ),
                                        ),
                                      );
                                    },
                                    );
                                  },
                                  child: TextWidget(
                                    textValue: "View Test Details",
                                    fontFamily: FontUtils.interSemiBold,
                                    fontSize: 1.6.t,
                                    textColor: ColorUtils.red,
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 1.h,),
                            Divider(
                              color: ColorUtils.silver,
                            ),
                            SizedBox(height: 1.h,),

                            // Payment Method
                            TextWidget(
                              textValue: "Payment Method",
                              fontFamily: FontUtils.interSemiBold,
                              fontSize: 1.6.t,
                              textColor: ColorUtils.blackShade,
                            ),
                            SizedBox(height: 2.h,),
                            GestureDetector(
                              onTap: (){
                                showModalBottomSheet(
                                  isScrollControlled: true,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(24.0),
                                      topRight: Radius.circular(24.0),
                                    ),
                                  ),
                                  backgroundColor: Colors.white, context: context, builder: (BuildContext context) {
                                  return PageHorizontalMargin(
                                    widget: Container(
                                      height: MediaQuery.of(context).size.height/1.5,
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          SizedBox(height: 2.h,),
                                          SvgPicture.asset(ImageUtils.greyHandle),
                                          SizedBox(height: 1.h,),
                                          Align(
                                            alignment: Alignment.centerLeft,
                                            child: TextWidget(
                                              textValue: "Select Payment Method",
                                              fontFamily: FontUtils.poppinsBold,
                                              fontSize: 2.4.t,
                                              textColor: ColorUtils.red,
                                            ),
                                          ),
                                          SizedBox(height: 2.h,),
                                          LabTestPayment(),
                                          Divider(
                                            color: ColorUtils.silver,
                                          ),
                                          SizedBox(height: 2.h,),
                                          Row(
                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                            children: [
                                              Image.asset(ImageUtils.bankTransfer,
                                                width: 30.i,
                                              ),
                                              Padding(
                                                padding: EdgeInsets.only(right: 9.w),
                                                child: ForwardButtonBlack(),
                                              ),
                                            ],
                                          ),
                                          SizedBox(height: 2.h,),
                                          Divider(
                                            color: ColorUtils.silver,
                                          ),
                                          SizedBox(height: 2.h,),
                                          TextWidget(
                                            textValue: "+ Add new card Members",
                                            fontFamily: FontUtils.interSemiBold,
                                            fontSize: 1.8.t,
                                            textColor: ColorUtils.red,
                                          ),
                                          SizedBox(height: 2.h,),
                                          Divider(
                                            color: ColorUtils.silver,
                                          ),
                                          SizedBox(height: 2.h,),
                                          TextWidget(
                                            textValue: "+ Add Pay Pro Account",
                                            fontFamily: FontUtils.interSemiBold,
                                            fontSize: 1.8.t,
                                            textColor: ColorUtils.red,
                                          ),
                                          SizedBox(height: 2.h,),
                                        ],
                                      ),
                                    ),
                                  );
                                },
                                );
                              },
                              child: Container(
                                padding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 2.h),
                                decoration: BoxDecoration(
                                    shape: BoxShape.rectangle,
                                    border: Border.all(
                                        color: ColorUtils.blackShade.withOpacity(0.5),
                                        width: 1
                                    ),
                                    borderRadius: BorderRadius.circular(10)
                                ),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    if(model.pharmacyPaymentMethodSelected == false)
                                      TextWidget(
                                        textValue: "Select Method",
                                        fontFamily: FontUtils.interRegular,
                                        fontSize: 1.6.t,
                                        textColor: ColorUtils.silver,
                                      ),
                                    if(model.pharmacyPaymentMethodSelected == true)
                                      Row(
                                        children: [
                                          SvgPicture.asset(ImageUtils.masterCard),
                                          TextWidget(
                                            textValue: "Card",
                                            fontFamily: FontUtils.poppinsSemiBold,
                                            fontSize: 1.6.t,
                                            textColor: ColorUtils.black1,
                                          ),
                                        ],
                                      ),
                                    SvgPicture.asset(ImageUtils.forwardIcon),
                                  ],
                                ),
                              ),
                            ),

                            SizedBox(height: 3.h,),
                            GreyBackGroundButton(
                              text: "Confirm",
                              buttonTextColor: ColorUtils.white,
                              buttonColor:  model.labPaySelected == true ? ColorUtils.red : ColorUtils.white1,
                              onButtonPressed: (){
                                Navigator.push(context,
                                    PageTransition(
                                        type: PageTransitionType.fade,
                                        child:  PaymentSuccess(
                                          fromInsurance: false,
                                          fromPharmacy: false,
                                          fromLabTest: true,
                                        )
                                    ));
                              },
                            ),
                            SizedBox(height: 2.h,),
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

class LabTestPayment extends StatefulWidget {
  const LabTestPayment({Key? key}) : super(key: key);

  @override
  State<LabTestPayment> createState() => _LabTestPaymentState();
}

class _LabTestPaymentState extends State<LabTestPayment> {

  int? value;

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<MainViewModel>.reactive(
      viewModelBuilder: () => locator<MainViewModel>(),
      disposeViewModel: false,
      onModelReady: (model) {
      },
      builder: (context, model, child) {
        return SizedBox(
          height: 15.h,
          child: ListView.separated(
            physics: NeverScrollableScrollPhysics(),
            padding: EdgeInsets.zero,
            itemBuilder: (context, index) {
              return Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    flex: 4,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          child: Image.asset(model.paymentType[index],
                            width: index == 0 ? 12.i : 30.i,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: RadioListTile(
                        activeColor: ColorUtils.red,
                        value: index,
                        groupValue: value,
                        onChanged: (ind) {
                          model.labPaySelected = true;
                          model.notifyListeners();
                          return setState(() => value = ind as int?);
                        }
                    ),
                  ),
                ],
              );
            },
            itemCount: model.paymentType.length,
            separatorBuilder: (BuildContext context, int index) {
              return Divider(
                color: ColorUtils.silver,
              );
            },
          ),
        );
      },
    );
  }
}

