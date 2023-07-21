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
import 'package:stacked/stacked.dart';

import '../Utils/widget_loader.dart';

class Login extends StatelessWidget {
  const Login({Key? key}) : super(key: key);

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
                    Image.asset(ImageUtils.doctorNurse,
                    ),
                    SpaceBelowDoctors(),
                    TextWidget(
                      textValue: "Let's get started!",
                      fontFamily: FontUtils.poppinsBold,
                      fontSize: 2.4.t,
                      textColor: ColorUtils.red,
                    ),
                    SizedBox(height: 8.h,),
                    CustomTextField(
                      hintText: "Enter Email",
                      controller: model.loginEmailController,
                    ),
                    SizedBox(height: 2.h,),
                    CustomTextField(
                      hintText: "Enter Password",
                      controller: model.loginPasswordController,
                    ),
                    SizedBox(height: 3.h,),
                    Container(
                      //margin: EdgeInsets.symmetric(horizontal: 12.w),
                      decoration:  BoxDecoration(
                          shape: BoxShape.rectangle,
                          borderRadius: BorderRadius.all(Radius.circular(30.5)),
                          gradient: LinearGradient(
                            colors: [
                              ColorUtils.red.withOpacity(1),
                              ColorUtils.red3.withOpacity(1),
                            ],
                          )
                      ),
                      child: AnimatedContainer(
                        duration: const Duration(milliseconds: 400),
                        width: MediaQuery.of(context).size.width / 1,
                        height: 6.35.h,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            color: ColorUtils.red
                        ),
                        child: MaterialButton(
                            padding: EdgeInsets.zero,
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.5)),
                            onPressed: (){
                              model.loadingWidget == true ? (){} :
                              model.doUserLogin(context, model.loginEmailController.text.toString(), model.loginPasswordController.text.toString());
                            },
                            child: model.loadingWidget == false ? Text(
                              "Sign in",
                              style: TextStyle(
                                fontFamily: FontUtils.poppinsBold,
                                fontSize: 2.t,
                                color: ColorUtils.white,
                              ),
                            ) : WidgetLoader()
                        ),
                      ),
                    ),
                    SizedBox(height: 2.h,),
                    TextWidget(
                      textValue: "Forgot your password?",
                      fontFamily: FontUtils.poppinsBold,
                      fontSize: 1.6.t,
                      textColor: ColorUtils.red,
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
