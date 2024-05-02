import 'package:cached_network_image/cached_network_image.dart';
import 'package:find_my_doctor/App/locator.dart';
import 'package:find_my_doctor/UI/Home/Pharmacy/pharmacy_payment_method.dart';
import 'package:find_my_doctor/Utils/color_utils.dart';
import 'package:find_my_doctor/Utils/extensions.dart';
import 'package:find_my_doctor/Utils/font_utils.dart';
import 'package:find_my_doctor/Utils/image_utils.dart';
import 'package:find_my_doctor/ViewModels/main_view_model.dart';
import 'package:find_my_doctor/Widgets/back_with_signleText.dart';
import 'package:find_my_doctor/Widgets/custom_text_field.dart';
import 'package:find_my_doctor/Widgets/forward_button_black.dart';
import 'package:find_my_doctor/Widgets/page_horizontal_margin.dart';
import 'package:find_my_doctor/Widgets/red_button.dart';
import 'package:find_my_doctor/Widgets/text_widget.dart';
import 'package:find_my_doctor/Widgets/top_margin_home.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:page_transition/page_transition.dart';
import 'package:stacked/stacked.dart';
// import 'package:zego_uikit_prebuilt_call/zego_uikit_prebuilt_call.dart';

import '../../../Utils/constants.dart';
import '../../../Widgets/grey_background_button.dart';
import '../Insurance/payment_success.dart';

class PharmacyConfirmDetails extends StatelessWidget {
  const PharmacyConfirmDetails({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<MainViewModel>.reactive(
      viewModelBuilder: () => locator<MainViewModel>(),
      disposeViewModel: false,
      onModelReady: (model) {},
      builder: (context, model, child) {
        return GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: SafeArea(
            top: false,
            bottom: false,
            child: Scaffold(
              backgroundColor: Colors.white,
              body: SingleChildScrollView(
                physics: AlwaysScrollableScrollPhysics(),
                child: Column(
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
                    PageHorizontalMargin(
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

                          // Recipient
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
                                    textValue: model.beneficiaryIndex == -1
                                        ? "Self"
                                        : model.beneficry?[model.beneficiaryIndex ?? 0].fullname,
                                    textColor: ColorUtils.blackShade,
                                    fontFamily: FontUtils.interRegular,
                                    fontSize: 1.8.t,
                                  ),
                                ],
                              ),
                            ],
                          ),
                          SizedBox(height: 1.h),
                          Divider(
                            color: ColorUtils.silver,
                          ),

                          // Address
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
                                    textValue: model.beneficiaryIndex == -1
                                        ? model.address
                                        : model.beneficry?[model.beneficiaryIndex ?? 0].address,
                                    textColor: ColorUtils.blackShade,
                                    fontFamily: FontUtils.interRegular,
                                    fontSize: 1.8.t,
                                  ),
                                ],
                              ),
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
                          CustomTextField(
                            controller: model.promoCodeController,
                            hintText: "Enter Promo Code",
                          ),

                          // Cart Items
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
                                  // TextWidget(
                                  //   textValue: model.selectedProducts.toString(),
                                  //   fontFamily: FontUtils.poppinsSemiBold,
                                  //   fontSize: 2.t,
                                  //   textColor: ColorUtils.red,
                                  // ),
                                  SizedBox(height: 0.5.h,),
                                ],
                              ),
                            ],
                          ),
                          SizedBox(height: 1.h,),
                          Column(
                            children: List.generate(
                              model.cartItems.length ?? 0,
                                  (index) => Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
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
                                        CachedNetworkImage(
                                          placeholder: (context, url) {
                                            return Image.asset(
                                                ImageUtils.tablets);
                                          },
                                          width: 12.w,
                                          height: 12.h,
                                          fit: BoxFit.cover,
                                          imageUrl: model.prodmodel.data!
                                              .featured_img !=
                                              null
                                              ? Constants.imageUrl +
                                              model.prodmodel.data!
                                                  .featured_img
                                                  .toString()
                                              : '',
                                          errorWidget: (context, url, error) =>
                                              Image.asset(ImageUtils.tablets),
                                        ),
                                        Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            TextWidget(
                                              textValue: model.cartItems[index].data?.name ?? "",
                                              fontFamily: FontUtils.interSemiBold,
                                              fontSize: 1.8.t,
                                              textColor: ColorUtils.blackShade,
                                            ),
                                            SizedBox(height: 1.h,),
                                            TextWidget(
                                              textValue: 'Rs.' + (model.cartItems[index].data?.discountedPrice == 0.0 ? model.cartItems[index].data?.price.toString() ?? "" : (model.cartItems[index].data!.price!.toDouble()-((model.cartItems[index].data!.price!.toDouble()/100.0)*model.cartItems[index].data!.discountedPrice!.toDouble())).toString()), // "PKR. " + (model.cartItems[index].data?.price ?? 0).toString(),
                                              fontFamily: FontUtils.interBold,
                                              fontSize: 2.2.t,
                                              textColor: ColorUtils.lightGreen,
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
                                                SizedBox(width: 2.2.w,),
                                                TextWidget(
                                                  textValue: model.selectedProducts[index]["qty"].toString(),
                                                  fontFamily: FontUtils.interBold,
                                                  fontSize: 2.t,
                                                  textColor: ColorUtils.blackShade,
                                                ),
                                                SizedBox(width: 2.2.w,),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(height: 1.h,)
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 2.h,),
                    PageHorizontalMargin(
                      widget: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
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
                                        SvgPicture.asset(ImageUtils.cash),
                                        TextWidget(
                                          textValue: "Cash",
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
                          // RedButton(
                          //   textValue: "Select Payment Method",
                          //   onButtonPressed: () {
                          //     Navigator.push(
                          //       context,
                          //       PageTransition(type: PageTransitionType.fade, child: PharmacyPaymentMethod()),
                          //     );
                          //   },
                          // ),
                          GreyBackGroundButton(
                            text: "Confirm",
                            buttonTextColor: ColorUtils.white,
                            buttonColor: ColorUtils.red,
                            onButtonPressed: () {
                          model.addingBookingPharmacy(
                                  context,
                                  model.token!,
                                  model.beneficiaryIndex==-1 ? model.userID ?? 0 : model.beneficry?[model.beneficiaryIndex ?? 0].id ?? 0,
                                  model.userID!,
                                  '${DateTime.now()}',
                                  1, // model.promoCodeController.text.toString() ?? "",
                                  1,
                                  model.beneficiaryIndex==-1 ? "no" : "yes",
                                  model.beneficiaryIndex==-1 ? model.address ?? "" : model.beneficry?[model.beneficiaryIndex ?? 0].address ?? "",
                                  model.selectedProducts);
                              print('Pharmacy api');
                              if (model.responsePharmacy == 1) {
                                Navigator.push(
                                    context,
                                    PageTransition(
                                        type: PageTransitionType.fade,
                                        child: PaymentSuccess(
                                          date: '${DateTime.now()}',
                                          bookid: "1",
                                          fromInsurance: true,
                                          fromPharmacy: false,
                                          fromLabTest: false,
                                          fromPhysicalVisit: false,
                                        )));
                              } else {
                               print("Pharmacy Post Failed");
                               model.showErrorMessage(
                                   context, "Invalid Promo code");
                              }
                            },
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 2.h,)
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
