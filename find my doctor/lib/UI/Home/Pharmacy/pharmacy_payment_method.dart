import 'package:find_my_doctor/App/locator.dart';
import 'package:find_my_doctor/UI/Home/Insurance/payment_success.dart';
import 'package:find_my_doctor/Utils/color_utils.dart';
import 'package:find_my_doctor/Utils/extensions.dart';
import 'package:find_my_doctor/Utils/font_utils.dart';
import 'package:find_my_doctor/Utils/image_utils.dart';
import 'package:find_my_doctor/ViewModels/main_view_model.dart';
import 'package:find_my_doctor/Widgets/back_with_signleText.dart';
import 'package:find_my_doctor/Widgets/forward_button_black.dart';
import 'package:find_my_doctor/Widgets/page_horizontal_margin.dart';
import 'package:find_my_doctor/Widgets/text_widget.dart';
import 'package:find_my_doctor/Widgets/top_margin_home.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:page_transition/page_transition.dart';
import 'package:stacked/stacked.dart';

class PharmacyPaymentMethod extends StatelessWidget {
  const PharmacyPaymentMethod({Key? key}) : super(key: key);

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
                        backText: "Select Payment Method",
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
                            textValue: "Order Summary",
                            fontFamily: FontUtils.poppinsSemiBold,
                            fontSize: 2.t,
                            textColor: ColorUtils.red,
                          ),
                          SizedBox(height: 2.h,),

                          // Order Summary
                          Image.asset(ImageUtils.pharmacyOrderSummary),

                          // Payment Details
                          SizedBox(height: 2.h,),
                          TextWidget(
                            textValue: "Payment Details",
                            fontFamily: FontUtils.poppinsSemiBold,
                            fontSize: 2.t,
                            textColor: ColorUtils.red,
                          ),
                          SizedBox(height: 2.h,),
                          TextWidget(
                            textValue: "Total Amount",
                            fontFamily: FontUtils.interSemiBold,
                            fontSize: 1.6.t,
                            textColor: ColorUtils.blackShade,
                          ),
                          SizedBox(height: 1.h,),
                          TextWidget(
                            textValue: "Rs. 1,180",
                            fontFamily: FontUtils.interSemiBold,
                            fontSize: 2.t,
                            textColor: ColorUtils.lightGreen,
                          ),
                          SizedBox(height: 1.h,),
                          Divider(
                            color: ColorUtils.silver,
                          ),
                          SizedBox(height: 1.h,),
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
                                    height: MediaQuery.of(context).size.height/2,
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
                                        PharmacyPayment(),
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

                          SizedBox(height: 2.h,),
                          TextWidget(
                            textValue: "Note (Optional)",
                            fontFamily: FontUtils.interSemiBold,
                            fontSize: 1.6.t,
                            textColor: ColorUtils.blackShade,
                          ),
                          SizedBox(height: 2.h,),
                          Container(
                            padding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 2.h),
                            decoration: BoxDecoration(
                                shape: BoxShape.rectangle,
                                border: Border.all(
                                    color: ColorUtils.blackShade.withOpacity(0.5),
                                    width: 1
                                ),
                                borderRadius: BorderRadius.circular(10)
                            ),
                            child: Container(
                              width: MediaQuery.of(context).size.width/1,
                              child: Text(
                                "Enter Message",
                                style: TextStyle(
                                  fontFamily: FontUtils.interRegular,
                                  fontSize: 1.6.t,
                                  color: ColorUtils.silver,
                                ),
                              ),
                            ),
                          ),

                          //Address
                        ],
                      ),
                    ),
                  ),
                  PageHorizontalMargin(
                    widget: Container(
                      decoration: const BoxDecoration(
                        shape: BoxShape.rectangle,
                        borderRadius: BorderRadius.all(Radius.circular(8)),
                      ),
                      child: AnimatedContainer(
                        duration: const Duration(milliseconds: 400),
                        width: MediaQuery.of(context).size.width / 1,
                        height: 6.35.h,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color: model.pharmacyPaymentMethodSelected == false ? ColorUtils.white1 : ColorUtils.red,
                        ),
                        child: MaterialButton(
                          padding: EdgeInsets.zero,
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                          onPressed: (){
                            Navigator.push(context,
                                PageTransition(type: PageTransitionType.fade, child:  PaymentSuccess(
                                  fromPharmacy: true,
                                  fromInsurance: false,
                                )));
                          },
                          child: Text(
                            "Select Payment Method",
                            style: TextStyle(
                                fontFamily: FontUtils.interSemiBold,
                                fontSize: 1.8.t,
                                color: ColorUtils.white),
                          ),
                        ),
                      ),
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

class PaymentType extends StatefulWidget {
  const PaymentType({Key? key}) : super(key: key);

  @override
  State<PaymentType> createState() => _PaymentTypeState();
}

class _PaymentTypeState extends State<PaymentType> {

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
                            width: 30.i,
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
                          model.pharmacyPaymentMethodSelected = true;
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

class PharmacyPayment extends StatefulWidget {
  const PharmacyPayment({Key? key}) : super(key: key);

  @override
  State<PharmacyPayment> createState() => _PharmacyPaymentState();
}

class _PharmacyPaymentState extends State<PharmacyPayment> {

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
                            width: 30.i,
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
                          model.pharmacyPaymentMethodSelected = true;
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

