import 'package:find_my_doctor/App/locator.dart';
import 'package:find_my_doctor/UI/Signup/pin_text_field.dart';
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
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:stacked/stacked.dart';


class Edit_Password extends StatefulWidget {
  const Edit_Password({Key? key}) : super(key: key);

  @override
  State<Edit_Password> createState() => _Edit_PasswordState();
}

class _Edit_PasswordState extends State<Edit_Password> {
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
                children: [
                  Column(
                    children: [
                      SizedBox(
                        height: context.getPadding().top,
                      ),
                      BackSingleText(
                        backText: "Change Password ",
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
                              Image.asset(
                                ImageUtils.femaleDoctor,
                                width: 50.i,
                                height: 50.i,
                              ),
                              SizedBox(
                                height: 1.h,
                              ),
                              TextWidget(
                                textValue: "Enter New Password",
                                textColor: ColorUtils.red,
                                fontFamily: FontUtils.interBold,
                                fontSize: 2.4.t,
                              ),
                              SizedBox(height: 1.h,),
                              CustomTextField(
                                hintText: "Enter New Password",
                              ),
                              SizedBox(height: 1.h,),
                              CustomTextField(
                                hintText: "Confrim New Password",
                              ),
                              Padding(
                                padding: EdgeInsets.only(left: 10 , top: 20),
                                child: Row(
                                  children: [
                                    Image.asset(
                                      ImageUtils.required_icon,
                                    ),
                                    SizedBox(width: 2.w,),
                                    TextWidget(
                                      textValue: "Password Requirement",
                                      textColor: ColorUtils.black,
                                      fontFamily: FontUtils.interSemiBold,
                                      fontSize: 1.8.t,
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(height: 1.h,),
                              TextWidget(
                                textValue: "• At least 12 characters",
                                textColor: ColorUtils.black,
                                fontFamily: FontUtils.interRegular,
                                fontSize: 1.6.t,
                              ),
                              SizedBox(height: 0.5.h,),
                              TextWidget(
                                textValue: "• Mixture of both uppercase and lowercase letters.",
                                textColor: ColorUtils.black,
                                fontFamily: FontUtils.interRegular,
                                fontSize: 1.6.t,
                              ),
                              SizedBox(height: 0.5.h,),
                              TextWidget(
                                textValue: "• Mixture of letters and numbers.",
                                textColor: ColorUtils.black,
                                fontFamily: FontUtils.interRegular,
                                fontSize: 1.6.t,
                              ),
                              SizedBox(height: 0.5.h,),
                              TextWidget(
                                textValue: "• Inclusion of at least one special character, e.g., ! @ # ? ]",
                                textColor: ColorUtils.black,
                                fontFamily: FontUtils.interRegular,
                                fontSize: 1.6.t,
                              ),
                              SizedBox(
                                height: 12.h,
                              ),
                              RedButton(
                                textValue: "Confirm",
                                onButtonPressed: (){

                                  Navigator.push(context,
                                      PageTransition(type: PageTransitionType.fade, child: PinTextField()));
                                },
                              ),
                            ],
                          )
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
