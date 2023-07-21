
import 'package:expand_tap_area/expand_tap_area.dart';
import 'package:find_my_doctor/Utils/color_utils.dart';
import 'package:find_my_doctor/Utils/extensions.dart';
import 'package:find_my_doctor/Utils/font_utils.dart';
import 'package:find_my_doctor/Utils/image_utils.dart';
import 'package:find_my_doctor/Widgets/custom_text_field.dart';
import 'package:find_my_doctor/Widgets/page_horizontal_margin.dart';
import 'package:find_my_doctor/Widgets/space_below_doctors.dart';
import 'package:find_my_doctor/Widgets/text_widget.dart';
import 'package:find_my_doctor/Widgets/top_margin_registration.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:stacked/stacked.dart';

import '../../App/locator.dart';
import '../../Utils/widget_loader.dart';
import '../../ViewModels/main_view_model.dart';

class Signup extends StatefulWidget {
  const Signup({Key? key}) : super(key: key);

  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  bool? checkboxState = false;


  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<MainViewModel>.reactive(
      viewModelBuilder: () => locator<MainViewModel>(),
      disposeViewModel: false,
      onViewModelReady: (model) {},
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
                  PageHorizontalMargin(
                    widget: Column(
                      children: [
                        SizedBox(
                          height: context.getPadding().top,
                        ),
                        SizedBox(
                          child:  Padding(
                            padding: EdgeInsets.only(left: 10),
                            child: Row(
                              children: [
                                ExpandTapWidget(
                                  onTap: (){
                                    Navigator.pop(context);
                                  },
                                  tapPadding: EdgeInsets.all(50),
                                  child:SvgPicture.asset(ImageUtils.backArrowRed),
                                ),
                                Expanded(child: Center(
                                  child: TextWidget(
                                    textValue: "Signup",
                                    fontFamily: FontUtils.poppinsBold,
                                    fontSize: 2.8.t,
                                    textColor: ColorUtils.red,
                                  ),
                                ),
                                ),
                                SizedBox(width: 2.w,),
                              ],
                            ),
                          ),
                        ),
                        TopMarginRegistration(),
                      ],
                    ),
                  ),
                  Expanded(
                    child: SingleChildScrollView(
                      child: PageHorizontalMargin(
                        widget: Column(
                          children: [
                            Image.asset(ImageUtils.femaleDoctor,
                              width: 60.i,
                              height: 60.i,
                            ),
                            SpaceBelowDoctors(),
                            TextWidget(
                              textValue: "Enter your Details",
                              fontFamily: FontUtils.poppinsBold,
                              fontSize: 2.4.t,
                              textColor: ColorUtils.red,
                            ),
                            SizedBox(height: 8.h,),
                            CustomTextField(
                              hintText: "Enter Full Name",
                              controller: model.signupNameController,
                            ),
                            SizedBox(height: 2.h,),
                            CustomTextField(
                              hintText: "Enter Email",
                              controller: model.signupEmailController,
                            ),
                            SizedBox(height: 2.h,),
                            CustomTextField(
                              hintText: "Enter Password",
                              controller: model.signupPasswordController,
                            ),
                            SizedBox(height: 2.h,),
                            CustomTextField(
                              hintText: "Confrim Password",
                              controller: model.signupConfirmPasswordController,
                            ),
                            SizedBox(height: 2.h,),
                            IntlPhoneField(
                              decoration: InputDecoration(
                                counter: Text(""),
                                floatingLabelBehavior:
                                FloatingLabelBehavior.never,
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(8),
                                  // width: 0.0 produces a thin "hairline" border
                                  borderSide: BorderSide(
                                      color: ColorUtils.lightBlue),
                                ),
                                labelText: 'Phone Number',
                                border: OutlineInputBorder(
                                  borderSide: BorderSide(),
                                ),
                              ),
                              initialCountryCode: 'PK',
                              controller: model.signupPhoneController,
                              onChanged: (phone) {
                                print(phone.completeNumber);
                              },
                            ),
                            Row(
                              children: <Widget>[
                                Checkbox(
                                  activeColor: Colors.red,
                                  value: this.checkboxState,
                                  onChanged: (bool? value) {
                                    setState(() {
                                      this.checkboxState = value;
                                    });
                                  },
                                ), //Checkbox//SizedBox
                                Expanded(
                                  child: RichText(
                                    text: TextSpan(
                                      children: [
                                        TextSpan(
                                          text: "I agree with all the",
                                          style: TextStyle(
                                            fontFamily: FontUtils.interBold,
                                            fontSize: 1.6.t,
                                            color: ColorUtils.blackShade,
                                          ),
                                        ),
                                        TextSpan(
                                          text: ' Terms & Conditions',
                                          style: TextStyle(
                                            fontFamily: FontUtils.interBold,
                                            fontSize: 1.6.t,
                                            color: ColorUtils.red,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ), //Text
                              ], //<Widget>[]
                            ),
                            SizedBox(height: 3.h,),
                            Padding(
                                padding: EdgeInsets.symmetric(horizontal: 0.w),
                                child: Container(
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
                                        borderRadius: BorderRadius.circular(10.5),
                                        color: ColorUtils.red
                                    ),
                                    child: MaterialButton(
                                        padding: EdgeInsets.zero,
                                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.5)),
                                        onPressed: () async{
                                          model.loadingWidget == true ? (){} :
                                          await model.doUserSignup(
                                              context,
                                              model.signupNameController.text,
                                              model.signupEmailController.text,
                                              model.signupPhoneController.text,
                                              model.signupPasswordController.text,
                                              model.signupConfirmPasswordController.text
                                          );
                                        },
                                        child: model.loadingWidget == false ? Text(
                                          "Signup",
                                          style: TextStyle(
                                            fontFamily: FontUtils.poppinsBold,
                                            fontSize: 2.t,
                                            color: ColorUtils.white,
                                          ),
                                        ) : WidgetLoader()
                                    ),
                                  ),
                                )
                            ),
                            SizedBox(height: 2.h,),
                            RichText(
                              text: TextSpan(
                                children: [
                                  TextSpan(
                                    text: "Already have an account?",
                                    style: TextStyle(
                                      fontFamily: FontUtils.interSemiBold,
                                      fontSize: 1.6.t,
                                      color: ColorUtils.lightGreen,
                                    ),
                                  ),
                                  TextSpan(
                                    text: ' Sign In',
                                    style: TextStyle(
                                      fontFamily: FontUtils.interBold,
                                      fontSize: 1.6.t,
                                      color: ColorUtils.lightGreen,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(height: 3.h,),
                          ],
                        ),
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
