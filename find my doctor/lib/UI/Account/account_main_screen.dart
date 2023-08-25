import 'package:find_my_doctor/App/locator.dart';
import 'package:find_my_doctor/UI/Account/account_detail.dart';
import 'package:find_my_doctor/UI/Account/beneficiaries.dart';
import 'package:find_my_doctor/UI/Account/faqs.dart';
import 'package:find_my_doctor/UI/Account/privacy_policy.dart';
import 'package:find_my_doctor/UI/Account/terms_condition.dart';
import 'package:find_my_doctor/Utils/color_utils.dart';
import 'package:find_my_doctor/Utils/extensions.dart';
import 'package:find_my_doctor/Utils/font_utils.dart';
import 'package:find_my_doctor/ViewModels/main_view_model.dart';
import 'package:find_my_doctor/Widgets/forward_button_black.dart';
import 'package:find_my_doctor/Widgets/page_horizontal_margin.dart';
import 'package:find_my_doctor/Widgets/red_button.dart';
import 'package:find_my_doctor/Widgets/text_widget.dart';
import 'package:find_my_doctor/Widgets/top_margin_registration.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:stacked/stacked.dart';

import '../../Utils/widget_loader.dart';

class AccountMainScreen extends StatefulWidget {
  const AccountMainScreen({Key? key}) : super(key: key);

  @override
  State<AccountMainScreen> createState() => _AccountMainScreenState();
}

class _AccountMainScreenState extends State<AccountMainScreen> {

  bool switchValue = false;

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
            body: Column(
              children: [
                PageHorizontalMargin(
                  widget: Column(
                    children: [
                      SizedBox(
                        height: context.getPadding().top,
                      ),
                      TopMarginRegistration(),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: TextWidget(
                          textValue: "Account Details",
                          fontFamily: FontUtils.poppinsBold,
                          fontSize: 2.t,
                          textColor: ColorUtils.red,
                        ),
                      ),
                      SizedBox(height: 2.h,),
                    ],
                  ),
                ),
                Expanded(
                  child: SingleChildScrollView(
                    child: PageHorizontalMargin(
                      widget: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  TextWidget(
                                    textValue: "Personal Information",
                                    textColor: ColorUtils.blackShade,
                                    fontFamily: FontUtils.interSemiBold,
                                    fontSize: 1.6.t,
                                  ),
                                  SizedBox(height: 0.75.h,),
                                  TextWidget(
                                    textValue:   model.fullname.toString(),
                                    //"Hussain Akhtar",
                                    textColor: ColorUtils.blackShade,
                                    fontFamily: FontUtils.interRegular,
                                    fontSize: 1.8.t,
                                  ),
                                ],
                              ),
                              InkWell(
                                onTap: (){

                                  Navigator.push(context,
                                      PageTransition(type: PageTransitionType.fade, child: Account_Detail()));
                                },
                                  child: ForwardButtonBlack()),
                            ],
                          ),
                          SizedBox(height: 1.h,),
                          Divider(
                            color: ColorUtils.silver,
                          ),

                          SizedBox(height: 1.h,),
                          GestureDetector(
                            onTap: () {
                              if (!model.loadingWidget) {
                                model.uploadFCM(context, model.token!, model.fcmToken!, model.userID!);
                              }
                            },
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    TextWidget(
                                      textValue: "Upload FCM Token",
                                      textColor: ColorUtils.blackShade,
                                      fontFamily: FontUtils.interSemiBold,
                                      fontSize: 1.6.t,
                                    ),
                                    SizedBox(height: 0.75.h,),
                                    TextWidget(
                                      textValue: "Token",
                                      textColor: ColorUtils.blackShade,
                                      fontFamily: FontUtils.interRegular,
                                      fontSize: 1.8.t,
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),

                          SizedBox(height: 1.h,),
                          Divider(
                            color: ColorUtils.silver,
                          ),

                          SizedBox(height: 1.h,),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  TextWidget(
                                    textValue: "Beneficiaries",
                                    textColor: ColorUtils.blackShade,
                                    fontFamily: FontUtils.interSemiBold,
                                    fontSize: 1.6.t,
                                  ),
                                  SizedBox(height: 0.75.h,),
                                  TextWidget(
                                    textValue: "No beneficiaries added",
                                    textColor: ColorUtils.red,
                                    fontFamily: FontUtils.interRegular,
                                    fontSize: 1.6.t,
                                  ),
                                ],
                              ),
                              InkWell(
                                onTap: (){
                                  Navigator.push(context,
                                      PageTransition(type: PageTransitionType.fade, child: Add_Beneficiaries()));
                                },
                                  child: ForwardButtonBlack()),
                            ],
                          ),
                          SizedBox(height: 1.h,),
                          Divider(
                            color: ColorUtils.silver,
                          ),

                          SizedBox(height: 1.h,),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  TextWidget(
                                    textValue: "Payment Details",
                                    textColor: ColorUtils.blackShade,
                                    fontFamily: FontUtils.interSemiBold,
                                    fontSize: 1.6.t,
                                  ),
                                  SizedBox(height: 0.75.h,),
                                  TextWidget(
                                    textValue: "No payment details added",
                                    textColor: ColorUtils.red,
                                    fontFamily: FontUtils.interRegular,
                                    fontSize: 1.6.t,
                                  ),
                                ],
                              ),
                              ForwardButtonBlack(),
                            ],
                          ),
                          SizedBox(height: 1.h,),
                          Divider(
                            color: ColorUtils.silver,
                          ),

                          SizedBox(height: 3.h,),
                          TextWidget(
                            textValue: "System Settings",
                            fontFamily: FontUtils.poppinsBold,
                            fontSize: 2.t,
                            textColor: ColorUtils.red,
                          ),

                          SizedBox(height: 2.h,),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  TextWidget(
                                    textValue: "Language",
                                    textColor: ColorUtils.blackShade,
                                    fontFamily: FontUtils.interSemiBold,
                                    fontSize: 1.6.t,
                                  ),
                                  SizedBox(height: 0.75.h,),
                                  TextWidget(
                                    textValue: "English",
                                    textColor: ColorUtils.blackShade,
                                    fontFamily: FontUtils.interRegular,
                                    fontSize: 1.8.t,
                                  ),
                                ],
                              ),
                              InkWell(
                                onTap: (){
                                  _SelectLanguagePopup(context);
                                },
                                  child: ForwardButtonBlack()),
                            ],
                          ),
                          SizedBox(height: 1.h,),
                          Divider(
                            color: ColorUtils.silver,
                          ),

                          SizedBox(height: 1.h,),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              TextWidget(
                                textValue: "Notifications",
                                textColor: ColorUtils.blackShade,
                                fontFamily: FontUtils.interSemiBold,
                                fontSize: 1.6.t,
                              ),
                              SizedBox(
                                width: 50,
                                height: 20,
                                child: Switch(
                                  materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                                  value: switchValue,
                                  activeColor: ColorUtils.red,
                                  onChanged: (value) {
                                    setState(() {
                                      switchValue = value;
                                    });
                                  },
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 1.h,),
                          Divider(
                            color: ColorUtils.silver,
                          ),

                          SizedBox(height: 3.h,),
                          TextWidget(
                            textValue: "Support",
                            fontFamily: FontUtils.poppinsBold,
                            fontSize: 2.t,
                            textColor: ColorUtils.red,
                          ),

                          SizedBox(height: 2.h,),
                          InkWell(
                            onTap: (){
                              Navigator.push(context,
                                  PageTransition(type: PageTransitionType.fade, child: Terms_Conditions()));

                            },
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                TextWidget(
                                  textValue: "Terms & Conditions",
                                  textColor: ColorUtils.blackShade,
                                  fontFamily: FontUtils.interSemiBold,
                                  fontSize: 1.6.t,
                                ),
                                ForwardButtonBlack(),
                              ],
                            ),
                          ),
                          SizedBox(height: 1.h,),
                          Divider(
                            color: ColorUtils.silver,
                          ),

                          SizedBox(height: 1.h,),
                          InkWell(
                            onTap: (){
                              Navigator.push(context,
                                  PageTransition(type: PageTransitionType.fade, child: FAQs()));

                            },
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                TextWidget(
                                  textValue: "FAQs",
                                  textColor: ColorUtils.blackShade,
                                  fontFamily: FontUtils.interSemiBold,
                                  fontSize: 1.6.t,
                                ),
                                ForwardButtonBlack(),
                              ],
                            ),
                          ),
                          SizedBox(height: 1.h,),
                          Divider(
                            color: ColorUtils.silver,
                          ),

                          SizedBox(height: 1.h,),
                          InkWell(
                            onTap: (){

                              Navigator.push(context,
                                  PageTransition(type: PageTransitionType.fade, child: Privacy_Policy()));
                            },
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                TextWidget(
                                  textValue: "Privacy Policy",
                                  textColor: ColorUtils.blackShade,
                                  fontFamily: FontUtils.interSemiBold,
                                  fontSize: 1.6.t,
                                ),
                                ForwardButtonBlack(),
                              ],
                            ),
                          ),
                          SizedBox(height: 1.h,),
                          Divider(
                            color: ColorUtils.silver,
                          ),

                          SizedBox(height: 1.h,),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              TextWidget(
                                textValue: "Blogs",
                                textColor: ColorUtils.blackShade,
                                fontFamily: FontUtils.interSemiBold,
                                fontSize: 1.6.t,
                              ),
                              ForwardButtonBlack()
                            ],
                          ),
                          SizedBox(height: 1.h,),
                          Divider(
                            color: ColorUtils.silver,
                          ),
                          SizedBox(height: 2.h,),
                          Container(
                            decoration: BoxDecoration(
                                shape: BoxShape.rectangle,
                                borderRadius:
                                BorderRadius.all(Radius.circular(8)),
                                border: Border.all(color: ColorUtils.red)
                            ),
                            child: AnimatedContainer(
                              duration: const Duration(milliseconds: 400),
                              width: MediaQuery.of(context).size.width / 1,
                              height: 6.35.h,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8),
                                border: Border.all(color: ColorUtils.red),
                                color: ColorUtils.white,
                              ),
                              child: MaterialButton(
                                padding: EdgeInsets.zero,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8)),
                                onPressed: () {
                                  model.onLogout();
                                },
                                child: Text(
                                  "Sign Out",
                                  style: TextStyle(
                                      fontFamily: FontUtils.interSemiBold,
                                      fontSize: 1.8.t,
                                      color: ColorUtils.red),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  void _SelectLanguagePopup(BuildContext ) {

    showModalBottomSheet(
      isScrollControlled: true,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(24.0),
          topRight: Radius.circular(24.0),
        ),
      ),
      backgroundColor: Colors.white, context: context, builder: (context) {
      return PageHorizontalMargin(
        widget: Container(
          height: MediaQuery.of(context).size.height/2.5,
          child: Column(
            children: [
              SizedBox(height: 2.h,),
              Align(
                alignment: Alignment.centerLeft,
                child: TextWidget(
                  textValue: "Select Language",
                  fontFamily: FontUtils.poppinsBold,
                  fontSize: 2.2.t,
                  textColor: ColorUtils.red,
                ),
              ),

              SizedBox(height: 2.h,),

              Row(
                children: [
                  Expanded(
                      flex: 4,
                      child: Text("English")),
                  Expanded(
                    flex: 1,
                    child: RadioListTile(
                      activeColor: ColorUtils.red,
                      value: 0,
                      groupValue: true,
                      onChanged: (ind) {

                      },
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Expanded(
                      flex: 4,
                      child: Text("Urdu (Roman)")),
                  Expanded(
                    flex: 1,
                    child: RadioListTile(
                      activeColor: ColorUtils.red,
                      value: 0,
                      groupValue: true,
                      onChanged: (ind) {

                      },
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Expanded(
                      flex: 4,
                      child: Text("اردو")),
                  Expanded(
                    flex: 1,
                    child: RadioListTile(
                      activeColor: ColorUtils.red,
                      value: 0,
                      groupValue: true,
                      onChanged: (ind) {

                      },
                    ),
                  ),
                ],
              ),
              SizedBox(height: 2.h,),
              RedButton(
                textValue: "Confirm",
                onButtonPressed: (){
                  Navigator.pop(context);
                },
              ),
              SizedBox(height: 2.h,),
            ],
          ),
        ),
      );
    },
    );
    // showCupertinoModalPopup(
    //    context: BuildContext,
    //     builder: (_) => Container(
    //       height: MediaQuery.of(context).size.height/2.5,
    //       color: Color.fromARGB(255, 255, 255, 255),
    //       child: Column(
    //         crossAxisAlignment: CrossAxisAlignment.start ,
    //         children: [
    //           TextWidget(
    //             textValue: "General Physisian",
    //             fontFamily: FontUtils.interSemiBold,
    //             fontSize: FontSize.size18,
    //             textColor: ColorUtils.red,
    //           ),
    //           SizedBox(height: 2.h,),
    //           Container(
    //             height: 180,
    //             child: CupertinoDatePicker(
    //                 initialDateTime: DateTime.now(),
    //                 onDateTimeChanged: (val) {
    //                   setState(() {
    //                     dateSelected = val.toString();
    //                   });
    //                 }),
    //           ),
    //         ],
    //       ),
    //     ));
  }
}
