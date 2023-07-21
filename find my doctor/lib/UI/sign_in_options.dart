import 'package:find_my_doctor/App/locator.dart';
import 'package:find_my_doctor/UI/Signup/signup_main.dart';
import 'package:find_my_doctor/UI/login.dart';
import 'package:find_my_doctor/Utils/color_utils.dart';
import 'package:find_my_doctor/Utils/extensions.dart';
import 'package:find_my_doctor/Utils/font_utils.dart';
import 'package:find_my_doctor/Utils/image_utils.dart';
import 'package:find_my_doctor/ViewModels/main_view_model.dart';
import 'package:find_my_doctor/Widgets/custom_button_two.dart';
import 'package:find_my_doctor/Widgets/page_horizontal_margin.dart';
import 'package:find_my_doctor/Widgets/red_button.dart';
import 'package:find_my_doctor/Widgets/space_below_doctors.dart';
import 'package:find_my_doctor/Widgets/text_widget.dart';
import 'package:find_my_doctor/Widgets/top_margin_registration.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:page_transition/page_transition.dart';
import 'package:stacked/stacked.dart';

class SignInOptions extends StatelessWidget {
  const SignInOptions({Key? key}) : super(key: key);

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
            backgroundColor: Colors.white,
            body: PageHorizontalMargin(
              widget: SingleChildScrollView(
                child: Column(
                  children: [
                    SizedBox(
                      height: context.getPadding().top,
                    ),
                    TopMarginRegistration(),
                    Image.asset(ImageUtils.userPic),
                    SpaceBelowDoctors(),
                    TextWidget(
                      textValue: "Sign up & find the best healthcare available online!",
                      fontFamily: FontUtils.poppinsBold,
                      fontSize: 2.4.t,
                      textColor: ColorUtils.red,
                    ),
                    SizedBox(height: 3.h,),
                    Container(
                      decoration: const BoxDecoration(
                        shape: BoxShape.rectangle,
                        borderRadius: BorderRadius.all(Radius.circular(25.0)),
                      ),
                      child: AnimatedContainer(
                        duration: const Duration(milliseconds: 400),
                        width: MediaQuery.of(context).size.width / 1,
                        height: 7.h,
                        //margin: EdgeInsets.symmetric(horizontal: 5.w),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color: ColorUtils.lightBlue,
                        ),
                        child: MaterialButton(
                          padding: EdgeInsets.zero,
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
                          onPressed: (){
                            Navigator.push(context,
                                PageTransition(type: PageTransitionType.fade, child:  Login()));
                          },
                          child: Text(
                            "Sign In",
                            style: TextStyle(
                                fontFamily: FontUtils.interSemiBold,
                                fontSize: 1.8.t,
                                color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 2.h,),
                    CustomButtonTwo(
                      onButtonPressed: (){},
                      textValue: "Sign in with Google",
                      assetName: ImageUtils.google,
                      buttonColor: ColorUtils.red,
                    ),
                    SizedBox(height: 2.h,),
                    CustomButtonTwo(
                      buttonColor: ColorUtils.blackShade,
                      assetName: ImageUtils.apple,
                      textValue: "Sign in with Apple",
                      onButtonPressed: (){},
                    ),
                    SizedBox(height: 2.h,),
                    CustomButtonTwo(
                      buttonColor: ColorUtils.lightBlue,
                      assetName: ImageUtils.faceBook,
                      textValue: "Sign in with Facebook",
                      onButtonPressed: (){},
                    ),
                    SizedBox(height: 3.h,),
                    Row(
                      mainAxisAlignment:
                      MainAxisAlignment.spaceBetween,
                      children: [
                        SvgPicture.asset(
                            ImageUtils.horizontalLine),
                        TextWidget(
                          textValue: "OR",
                          textColor: ColorUtils.silver,
                          fontSize: 1.6.t,
                          fontFamily: FontUtils.interMedium,
                        ),
                        SvgPicture.asset(
                            ImageUtils.horizontalLine),
                      ],
                    ),
                    SizedBox(height: 3.h,),
                    RedButton(
                      textValue: "Sign Up",
                      onButtonPressed: (){
                        Navigator.push(context,
                            PageTransition(type: PageTransitionType.fade, child:  Signup()));
                      },
                    ),
                    SizedBox(height: 1.h,),
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
