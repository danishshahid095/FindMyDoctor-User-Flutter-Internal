import 'package:find_my_doctor/App/locator.dart';
import 'package:find_my_doctor/Utils/color_utils.dart';
import 'package:find_my_doctor/Utils/extensions.dart';
import 'package:find_my_doctor/Utils/font_utils.dart';
import 'package:find_my_doctor/Utils/image_utils.dart';
import 'package:find_my_doctor/ViewModels/main_view_model.dart';
import 'package:find_my_doctor/Widgets/bottom_navigation_bar.dart';
import 'package:find_my_doctor/Widgets/page_horizontal_margin.dart';
import 'package:find_my_doctor/Widgets/red_button.dart';
import 'package:find_my_doctor/Widgets/space_below_doctors.dart';
import 'package:find_my_doctor/Widgets/text_widget.dart';
import 'package:find_my_doctor/Widgets/top_margin_registration.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:pin_code_text_field/pin_code_text_field.dart';
import 'package:stacked/stacked.dart';

class PinTextField extends StatefulWidget {
  PinTextField({Key? key}) : super(key: key);

  @override
  State<PinTextField> createState() => _PinTextFieldState();

  bool textFieldFilled = false;

}

class _PinTextFieldState extends State<PinTextField> {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<MainViewModel>.reactive(
      viewModelBuilder: () => locator<MainViewModel>(),
      disposeViewModel: false,
      onModelReady: (model) {},
      builder: (context, model, child) {
        return SafeArea(
          top: false,
          bottom: false,
          child: Scaffold(
            resizeToAvoidBottomInset: false,
            backgroundColor: Colors.white,
            body: Column(
              children: [
                Expanded(
                  child: PageHorizontalMargin(
                    widget: SingleChildScrollView(
                      child: Column(
                        children: [
                          SizedBox(
                            height: context.getPadding().top,
                          ),
                          TopMarginRegistration(),
                          Image.asset(
                            ImageUtils.doctorVerification,
                          ),
                          SpaceBelowDoctors(),
                          TextWidget(
                            textValue: "Verifying to make sure\n everything is alright",
                            fontFamily: FontUtils.poppinsBold,
                            fontSize: 2.4.t,
                            textColor: ColorUtils.red,
                          ),
                          SizedBox(
                            height: 4.h,
                          ),
                          TextWidget(
                            textValue: "Verification code shared via SMS.",
                            fontFamily: FontUtils.interRegular,
                            fontSize: 1.8.t,
                            textColor: ColorUtils.blackShade,
                          ),
                          SizedBox(
                            height: 3.h,
                          ),
                          PinCodeTextField(
                            onDone: (value){
                              setState(() {
                                widget.textFieldFilled = true;
                              });
                              },
                            pinBoxOuterPadding: EdgeInsets.symmetric(horizontal: 2.w),
                            controller: model.forgotPasswordController,
                            pinTextAnimatedSwitcherTransition:
                            ProvidedPinBoxTextAnimation.scalingTransition,
                            pinTextAnimatedSwitcherDuration:
                            Duration(milliseconds: 300),
                            highlightPinBoxColor: ColorUtils.silver,
                            maxLength: 4,
                            pinBoxWidth: 16.w,
                            pinBoxRadius: 6,
                            pinBoxHeight: 7.5.h,
                            pinBoxColor: Colors.transparent,
                            defaultBorderColor: ColorUtils.black.withOpacity(0.2),
                            hasTextBorderColor: ColorUtils.red,
                            pinBoxBorderWidth: 1.5,
                            keyboardType: TextInputType.number,
                            pinTextStyle: TextStyle(
                              fontFamily: FontUtils.poppinsBold,
                              //fontWeight: FontWeight.w400,
                              fontSize: 3.t,
                            ),
                          ),
                          SizedBox(
                            height: 3.h,
                          ),
                          RichText(
                            text: TextSpan(
                              children: [
                                TextSpan(
                                  text: "The code expires in:",
                                  style: TextStyle(
                                    fontFamily: FontUtils.interRegular,
                                    fontSize: 1.6.t,
                                    color: ColorUtils.blackShade,
                                  ),
                                ),
                                TextSpan(
                                  text: ' 02:32 sec',
                                  style: TextStyle(
                                    fontFamily: FontUtils.interSemiBold,
                                    fontSize: 1.6.t,
                                    color: ColorUtils.red,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 1.h,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                PageHorizontalMargin(
                  widget: Column(
                    children: [
                      widget.textFieldFilled == true ?
                      RedButton(
                        onButtonPressed: (){},
                        textValue: "Continue",
                      ) :
                      AnimatedContainer(
                        duration: const Duration(milliseconds: 400),
                        width: MediaQuery.of(context).size.width / 1,
                        height: 6.35.h,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color: ColorUtils.white1,
                        ),
                        child: MaterialButton(
                          padding: EdgeInsets.zero,
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                          onPressed: (){
                            Navigator.push(context,
                                PageTransition(type: PageTransitionType.fade, child: MyBottomNavBar()));
                          },
                          child: Text(
                            "Continue",
                            style: TextStyle(
                                fontFamily: FontUtils.interSemiBold,
                                fontSize: 1.8.t,
                                color: ColorUtils.white),
                          ),
                        ),
                      ),
                      SizedBox(height: 2.h,),
                      Center(
                        child: TextWidget(
                          textValue: "Share code via call    |    Share code via email",
                          fontFamily: FontUtils.interMedium,
                          fontSize: 1.6.t,
                          textColor: ColorUtils.blackShade,
                        ),
                      ),
                      SizedBox(height: 2.h,),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
