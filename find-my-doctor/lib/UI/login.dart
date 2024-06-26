import 'package:find_my_doctor/App/locator.dart';
import 'package:find_my_doctor/Utils/color_utils.dart';
import 'package:find_my_doctor/Utils/extensions.dart';
import 'package:find_my_doctor/Utils/font_utils.dart';
import 'package:find_my_doctor/Utils/image_utils.dart';
import 'package:find_my_doctor/ViewModels/main_view_model.dart';
import 'package:find_my_doctor/Widgets/custom_text_field.dart';
import 'package:find_my_doctor/Widgets/page_horizontal_margin.dart';
import 'package:find_my_doctor/Widgets/space_below_doctors.dart';
import 'package:find_my_doctor/Widgets/text_widget.dart';
import 'package:find_my_doctor/Widgets/top_margin_registration.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:stacked/stacked.dart';

import '../Utils/widget_loader.dart';
import '../Widgets/bottom_navigation_bar.dart';
import '../Widgets/custom_password_text_field.dart';
import 'Signup/signup_main.dart';
import 'package:find_my_doctor/modules/navigation_service.dart'
as my_nav_service;

class Login extends StatelessWidget {
  const Login({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    var navigationService = my_nav_service.NavigationService();
    return ViewModelBuilder<MainViewModel>.reactive(
      viewModelBuilder: () => locator<MainViewModel>(),
      disposeViewModel: false,
      onModelReady: (model) async {
        // await model.gettingUserMeta(
        //     context, model.prefService.userToken.toString(), model.userID!);
      },
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
                    Image.asset(
                      ImageUtils.doctorNurse,
                    ),
                    SpaceBelowDoctors(),
                    TextWidget(
                      textValue: "Let's get started!",
                      fontFamily: FontUtils.poppinsBold,
                      fontSize: 2.4.t,
                      textColor: ColorUtils.red,
                    ),
                    SizedBox(
                      height: 8.h,
                    ),
                    CustomTextField(
                      hintText: "Enter Email",
                      controller: model.loginEmailController,
                    ),
                    SizedBox(
                      height: 2.h,
                    ),
                    CustomPasswordTextField(
                      hintText: "Enter Password",
                      controller: model.loginPasswordController,
                    ),
                    SizedBox(
                      height: 3.h,
                    ),
                    Container(
                      //margin: EdgeInsets.symmetric(horizontal: 12.w),
                      decoration: BoxDecoration(
                          shape: BoxShape.rectangle,
                          borderRadius: BorderRadius.all(Radius.circular(30.5)),
                          gradient: LinearGradient(
                            colors: [
                              ColorUtils.red.withOpacity(1),
                              ColorUtils.red3.withOpacity(1),
                            ],
                          )),
                      child: AnimatedContainer(
                        duration: const Duration(milliseconds: 400),
                        width: MediaQuery.of(context).size.width / 1,
                        height: 6.35.h,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            color: ColorUtils.red),
                        child: MaterialButton(
                            padding: EdgeInsets.zero,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30.5)),
                            onPressed: () {
                              navigationService.navigateToUntil(to: MyBottomNavBar());
                              // model.loadingWidget == true
                              //     ? () {}
                              //     : model.doUserLogin(
                              //         context,
                              //         model.loginEmailController.text
                              //             .toString(),
                              //         model.loginPasswordController.text
                              //             .toString());
                            },
                            child: model.loadingWidget == false
                                ? Text(
                                    "Sign in",
                                    style: TextStyle(
                                      fontFamily: FontUtils.poppinsBold,
                                      fontSize: 2.t,
                                      color: ColorUtils.white,
                                    ),
                                  )
                                : WidgetLoader()),
                      ),
                    ),
                    SizedBox(
                      height: 2.h,
                    ),
              // GestureDetector(
              //   onTap: () {
              //     // Define the action you want to perform when the text is clicked
              //     // For example, you can navigate to a different screen.
              //   },
              //   child: TextWidget(
              //     textValue: "Forgot your password?",
              //     fontFamily: FontUtils.poppinsBold,
              //     fontSize: 1.6.t,
              //     textColor: ColorUtils.red,
              //   ),
              // ),
                    SizedBox(
                      height: 1.h,
                    ),
                    MaterialButton(
                      padding: EdgeInsets.zero,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(25)),
                      onPressed: () {
                        Navigator.push(
                            context,
                            PageTransition(
                                type: PageTransitionType.fade,
                                child: Signup()));
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Don’t have an Account? ",
                            style: TextStyle(
                                fontFamily: FontUtils.interSemiBold,
                                fontSize: 1.8.t,
                                color: Colors.black),
                          ),
                          Text(
                            "Sign Up",
                            style: TextStyle(
                                fontFamily: FontUtils.interSemiBold,
                                fontSize: 1.8.t,
                                color: Colors.red),
                          ),
                        ],
                      )
                    ),
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
