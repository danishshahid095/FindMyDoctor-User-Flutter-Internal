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

import '../../../Widgets/grey_background_button.dart';

class PaymentMethod extends StatefulWidget {
  int packageID;
  int packageAmount;

  PaymentMethod({required this.packageID,required this.packageAmount,Key? key}) : super(key: key);

  @override
  State<PaymentMethod> createState() => _PaymentMethodState();
}

class _PaymentMethodState extends State<PaymentMethod> {

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
                        backText: "Payment Method",
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
                            textValue: "5. Select Payment Method",
                            fontFamily: FontUtils.poppinsSemiBold,
                            fontSize: 2.t,
                            textColor: ColorUtils.red,
                          ),
                          SizedBox(height: 3.h,),
                          TextWidget(
                            textValue: "Payment Details",
                            fontFamily: FontUtils.poppinsBold,
                            fontSize: 1.8.t,
                            textColor: ColorUtils.red,
                          ),
                          SizedBox(height: 2.h,),
                          TextWidget(
                            textValue: "Total Charges",
                            fontFamily: FontUtils.interSemiBold,
                            fontSize: 1.6.t,
                            textColor: ColorUtils.blackShade,
                          ),
                          SizedBox(height: 1.h,),
                          TextWidget(
                            textValue: "${widget.packageAmount}",
                            fontFamily: FontUtils.interSemiBold,
                            fontSize: 2.t,
                            textColor: ColorUtils.lightGreen,
                          ),
                          SizedBox(height: 1.h,),
                          Divider(
                            color: ColorUtils.silver,
                          ),
                          SizedBox(height: 2.h,),
                          TextWidget(
                            textValue: "Payment Method",
                            fontFamily: FontUtils.interSemiBold,
                            fontSize: 1.6.t,
                            textColor: ColorUtils.blackShade,
                          ),
                          SizedBox(height: 2.h,),
                          InkWell(
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
                                        PaymentType(),
                                        Divider(
                                          color: ColorUtils.silver,
                                        ),
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
                                      color: model.insurancePaymentMethodSelected == false ? ColorUtils.black.withOpacity(0.5) : ColorUtils.red,
                                      width: 1
                                  ),
                                  borderRadius: BorderRadius.circular(10)
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  if(model.insurancePaymentMethodSelected == false)
                                  TextWidget(
                                    textValue: "Select Method",
                                    fontFamily: FontUtils.poppinsSemiBold,
                                    fontSize: 1.6.t,
                                    textColor: ColorUtils.black1,
                                  ),
                                  if(model.insurancePaymentMethodSelected == true)
                                    Row(
                                      children: [
                                        SvgPicture.asset(ImageUtils.cash),
                                        TextWidget(
                                          textValue: "Cash",
                                          fontFamily: FontUtils.poppinsSemiBold,
                                          fontSize: 1.6.t,
                                          textColor: ColorUtils.black1,
                                        ),
                                      ],
                                    ),
                                  SvgPicture.asset(
                                    ImageUtils.forwardIcon,
                                  ),
                                ],
                              ),
                            ),
                          ),
                          SizedBox(height: 2.h,),
                        ],
                      ),
                    ),
                  ),
                  GreyBackGroundButton(
                    text: "Confirm",
                    buttonTextColor: ColorUtils.white,
                    buttonColor:
                    model.insurancePaymentMethodSelected == true
                        ? ColorUtils.red
                        : ColorUtils.white1,
                    onButtonPressed: () {
                      model.addingBookingInsurance(
                          context,
                          model.token!,
                          model.beneficiaryIndex==-1 ? model.userID! : model.beneficry?[model.beneficiaryIndex ?? 0].id ?? 0,
                          model.userID!,
                          model.beneficiaryIndex==-1 ? model.address ?? "" : model.beneficry?[model.beneficiaryIndex ?? 0].address ?? "",
                          '${DateTime.now()}',
                          widget.packageAmount,
                          1,
                          widget.packageID,
                        model.beneficiaryIndex==-1 ? "no" : "yes",);
                      print('Insurance api ');
                      Navigator.push(
                          context,
                          PageTransition(
                              type: PageTransitionType.fade,
                              child: PaymentSuccess(
                                date: '${DateTime.now()}',
                                bookid: widget.packageID!.toString(),
                                charges: widget.packageAmount.toString(),
                                fromInsurance: true,
                                fromPharmacy: false,
                                fromLabTest: false,
                                fromPhysicalVisit: false,
                              )));
                    },
                  ),
                  SizedBox(height: 1.h,)
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
                        model.insurancePaymentMethodSelected = true;
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

