import 'package:find_my_doctor/App/locator.dart';
import 'package:find_my_doctor/UI/Home/Insurance/insurance_select_provider.dart';
import 'package:find_my_doctor/Utils/color_utils.dart';
import 'package:find_my_doctor/Utils/extensions.dart';
import 'package:find_my_doctor/Utils/font_utils.dart';
import 'package:find_my_doctor/Utils/image_utils.dart';
import 'package:find_my_doctor/ViewModels/main_view_model.dart';
import 'package:find_my_doctor/Widgets/back_with_signleText.dart';
import 'package:find_my_doctor/Widgets/custom_text_field.dart';
import 'package:find_my_doctor/Widgets/page_horizontal_margin.dart';
import 'package:find_my_doctor/Widgets/red_button.dart';
import 'package:find_my_doctor/Widgets/text_widget.dart';
import 'package:find_my_doctor/Widgets/top_margin_home.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:page_transition/page_transition.dart';
import 'package:stacked/stacked.dart';

class InsuranceEnterDetails extends StatelessWidget {
  const InsuranceEnterDetails({Key? key}) : super(key: key);

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
              resizeToAvoidBottomInset: false,
              backgroundColor: Colors.white,
              body: Column(
                children: [
                  Column(
                    children: [
                      SizedBox(
                        height: context.getPadding().top,
                      ),
                      BackSingleText(
                        backText: "Insurance Market Place (1/5)",
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
                            textValue: "1. Enter Details",
                            fontFamily: FontUtils.poppinsSemiBold,
                            fontSize: 2.t,
                            textColor: ColorUtils.red,
                          ),
                          SizedBox(height: 3.h,),
                          CustomTextField(
                            hintText: "Enter Full Name",
                          ),
                          SizedBox(height: 2.h,),
                          CustomTextField(
                            hintText: "Enter CNIC",
                          ),
                          SizedBox(height: 2.h,),
                          CustomTextField(
                            hintText: "Enter Email",
                          ),
                          SizedBox(height: 2.h,),
                          IntlPhoneField(
                            decoration: InputDecoration(
                              counter: Text(""),
                              floatingLabelBehavior:
                              FloatingLabelBehavior.never,
                              focusedBorder: OutlineInputBorder(
                                // width: 0.0 produces a thin "hairline" border
                                borderSide: BorderSide(
                                    color: ColorUtils.lightBlue),
                              ),
                              labelText: 'Phone Number',
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8),
                                borderSide: BorderSide(),
                              ),
                            ),
                            initialCountryCode: 'PK',
                            onChanged: (phone) {
                              print(phone.completeNumber);
                            },
                          ),
                          Container(
                            padding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 2.h),
                            decoration: BoxDecoration(
                                shape: BoxShape.rectangle,
                                border: Border.all(color: ColorUtils.black.withOpacity(0.5), width: 1),
                                borderRadius: BorderRadius.circular(10)
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                TextWidget(
                                  textValue: "Select City",
                                  fontFamily: FontUtils.poppinsSemiBold,
                                  fontSize: 1.6.t,
                                  textColor: ColorUtils.black.withOpacity(0.5),
                                ),
                                SvgPicture.asset(
                                  ImageUtils.forwardIcon,
                                ),
                              ],
                            ),
                          ),
                          SizedBox(height: 2.h,),
                          CustomTextField(
                            hintText: "Enter Address",
                          ),
                        ],
                      ),
                    ),
                  ),
                  PageHorizontalMargin(
                    widget: RedButton(
                      textValue: "Next",
                      onButtonPressed: (){
                        Navigator.push(context,
                            PageTransition(type: PageTransitionType.fade, child: InsuranceSelectProvider()));
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
