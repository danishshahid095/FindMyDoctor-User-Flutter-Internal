import 'package:expand_tap_area/expand_tap_area.dart';
import 'package:find_my_doctor/App/locator.dart';
import 'package:find_my_doctor/UI/Home/Pharmacy/pharmacy_confirm_details.dart';
import 'package:find_my_doctor/Utils/color_utils.dart';
import 'package:find_my_doctor/Utils/extensions.dart';
import 'package:find_my_doctor/Utils/font_utils.dart';
import 'package:find_my_doctor/Utils/image_utils.dart';
import 'package:find_my_doctor/ViewModels/main_view_model.dart';
import 'package:find_my_doctor/Widgets/page_horizontal_margin.dart';
import 'package:find_my_doctor/Widgets/text_widget.dart';
import 'package:find_my_doctor/Widgets/top_margin_home.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:page_transition/page_transition.dart';
import 'package:stacked/stacked.dart';

class MedicineDetails extends StatelessWidget {
  const MedicineDetails({Key? key}) : super(key: key);

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
              body: Column(
                children: [
                  Column(
                    children: [
                      SizedBox(
                        height: context.getPadding().top,
                      ),
                      Container(
                        height: 10.h,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.5),
                              spreadRadius: 3,
                              blurRadius: 7,
                              offset:
                                  Offset(0, 3), // changes position of shadow
                            ),
                          ],
                        ),
                        child: Padding(
                          padding:
                              EdgeInsets.only(left: 3.w, top: 2.h, right: 3.w),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  ExpandTapWidget(
                                    onTap: () {
                                      Navigator.pop(context);
                                    },
                                    tapPadding: EdgeInsets.all(50),
                                    child: SvgPicture.asset(
                                        ImageUtils.backArrowRed),
                                  ),
                                  SizedBox(
                                    width: 4.w,
                                  ),
                                  TextWidget(
                                    textValue: " Medicines Details",
                                    fontFamily: FontUtils.interSemiBold,
                                    fontSize: 2.t,
                                    textColor: ColorUtils.red,
                                  ),
                                ],
                              ),
                              GestureDetector(
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        PageTransition(
                                            type: PageTransitionType.fade,
                                            child: PharmacyConfirmDetails()));
                                  },
                                  child: SvgPicture.asset(ImageUtils.basket)),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  Expanded(
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          TopMarginHome(),
                          PageHorizontalMargin(
                            widget: Column(
                              children: [
                                Image.asset(ImageUtils.panadol),
                                SizedBox(
                                  height: 2.h,
                                ),
                              ],
                            ),
                          ),
                          // Frequently Bought
                          PageHorizontalMargin(
                            widget: Column(
                              children: [
                                SizedBox(
                                  height: 1.h,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    TextWidget(
                                      textValue: "Panadol",
                                      fontFamily: FontUtils.poppinsBold,
                                      fontSize: 3.t,
                                      textColor: ColorUtils.red,
                                    ),
                                    Container(
                                      height: 30,
                                      width: 100,
                                      decoration: BoxDecoration(
                                          color: Colors.white,
                                          boxShadow: [
                                            BoxShadow(
                                              color:
                                                  Colors.grey.withOpacity(0.25),
                                              spreadRadius: 2,
                                              blurRadius: 5,
                                              offset: Offset(0, 3),
                                            ),
                                          ],
                                          borderRadius:
                                              BorderRadius.circular(20)),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Container(
                                            decoration: BoxDecoration(
                                              shape: BoxShape.circle,
                                              color: ColorUtils.red,
                                            ),
                                            child: Center(
                                              child: Icon(
                                                Icons.add,
                                                color: ColorUtils.white,
                                              ),
                                            ),
                                          ),
                                          TextWidget(
                                            textValue: '6',
                                            fontFamily: FontUtils.interMedium,
                                            fontSize: 2.6.t,
                                            textColor: ColorUtils.black,
                                          ),
                                          Container(
                                            decoration: BoxDecoration(
                                              shape: BoxShape.circle,
                                              color: ColorUtils.red,
                                            ),
                                            child: Center(
                                              child: Icon(
                                                Icons.add,
                                                color: ColorUtils.white,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 1.h,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 10),
                            child: Row(
                              children: [
                                TextWidget(
                                  textValue: model.pharmacyFrequentlyBought1[0]
                                      ["quantity"],
                                  fontFamily: FontUtils.interMedium,
                                  fontSize: 1.6.t,
                                  textColor: ColorUtils.silver2,
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 1.h,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 10),
                            child: Row(
                              children: [
                                TextWidget(
                                  textValue: model.pharmacyFrequentlyBought1[0]
                                      ["price"],
                                  fontFamily: FontUtils.interMedium,
                                  fontSize: 2.2.t,
                                  textColor: ColorUtils.red,
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 1.h,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 10),
                            child: Row(
                              children: [
                                Text(
                                  "\PKR.900",
                                  style: TextStyle(
                                    fontFamily: FontUtils.interMedium,
                                    fontSize: 1.6.t,
                                    color: ColorUtils.silver2,
                                    decoration: TextDecoration.lineThrough,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 1.h,
                          ),

                          // Brands
                          PageHorizontalMargin(
                            widget: Column(
                              children: [
                                SizedBox(
                                  height: 2.h,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    TextWidget(
                                      textValue: "Description",
                                      fontFamily: FontUtils.poppinsBold,
                                      fontSize: 3.t,
                                      textColor: ColorUtils.red,
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),

                          PageHorizontalMargin(
                            widget: Column(
                              children: [
                                SizedBox(
                                  height: 2.h,
                                ),
                                TextWidget(
                                  textValue:
                                      "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Etiam eu turpis molestie, dictum est a, mattis tellus. Sed dignissim, metus nec fringilla accumsan, risus sem sollicitudin lacus, ut interdum tellus elit sed risus. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Etiam eu turpis molestie, dictum est a, mattis tellus. Sed dignissim, metus nec fringilla nec sed  accumsan, risus sem sollicitudin lacus, ut interdum tellus elit sed risus. ",
                                  fontFamily: FontUtils.interRegular,
                                  fontSize: 1.8.t,
                                  textColor: ColorUtils.black1,
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 4.h,
                          ),
                          Container(
                            child: Image.asset(ImageUtils.addtocart),
                          ),
                          SizedBox(
                            height: 5.h,
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
}
