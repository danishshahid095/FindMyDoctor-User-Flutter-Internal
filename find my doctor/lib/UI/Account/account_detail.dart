import 'package:find_my_doctor/App/locator.dart';
import 'package:find_my_doctor/UI/Account/Edit_Profile/edit_email.dart';
import 'package:find_my_doctor/UI/Account/Edit_Profile/edit_name.dart';
import 'package:find_my_doctor/UI/Account/Edit_Profile/edit_number.dart';
import 'package:find_my_doctor/UI/Account/Edit_Profile/edit_password.dart';
import 'package:find_my_doctor/UI/Home/BookDoctor/enter_address.dart';
import 'package:find_my_doctor/UI/Home/BookDoctor/select_city.dart';
import 'package:find_my_doctor/Utils/color_utils.dart';
import 'package:find_my_doctor/Utils/extensions.dart';
import 'package:find_my_doctor/Utils/font_utils.dart';
import 'package:find_my_doctor/Utils/image_utils.dart';
import 'package:find_my_doctor/ViewModels/main_view_model.dart';
import 'package:find_my_doctor/Widgets/back_with_signleText.dart';
import 'package:find_my_doctor/Widgets/forward_button_black.dart';
import 'package:find_my_doctor/Widgets/page_horizontal_margin.dart';
import 'package:find_my_doctor/Widgets/red_button.dart';
import 'package:find_my_doctor/Widgets/square_date_text_field.dart';
import 'package:find_my_doctor/Widgets/text_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:page_transition/page_transition.dart';
import 'package:stacked/stacked.dart';

import 'Edit_Profile/Edit_address.dart';
import 'Edit_Profile/edit_age.dart';
import 'Edit_Profile/edit_height.dart';
import 'Edit_Profile/edit_weight.dart';

class Account_Detail extends StatefulWidget {
  const Account_Detail({Key? key}) : super(key: key);

  @override
  State<Account_Detail> createState() => _Account_DetailState();
}

class _Account_DetailState extends State<Account_Detail> {
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
                      BackSingleText(
                        backText: "Personal Information",
                      ),
                      SizedBox(
                        height: 1.h,
                      ),
                    ],
                  ),
                  Expanded(
                    child: SingleChildScrollView(
                      child: PageHorizontalMargin(
                          widget: Column(
                        children: [
                          SizedBox(
                            height: 2.h,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  TextWidget(
                                    textValue: "Full Name",
                                    textColor: ColorUtils.blackShade,
                                    fontFamily: FontUtils.interSemiBold,
                                    fontSize: 1.6.t,
                                  ),
                                  SizedBox(
                                    height: 0.75.h,
                                  ),
                                  TextWidget(
                                    textValue: model.fullname.toString(),
                                    // "Hussain Akhtar",
                                    textColor: ColorUtils.blackShade,
                                    fontFamily: FontUtils.interRegular,
                                    fontSize: 1.8.t,
                                  ),
                                ],
                              ),
                              InkWell(
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        PageTransition(
                                            type: PageTransitionType.fade,
                                            child: Edit_Name()));
                                  },
                                  child: ForwardButtonBlack()),
                            ],
                          ),
                          // SizedBox(
                          //   height: 1.h,
                          // ),
                          // Divider(
                          //   color: ColorUtils.silver,
                          // ),
                          // SizedBox(
                          //   height: 1.h,
                          // ),
                          // Row(
                          //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          //   children: [
                          //     Column(
                          //       crossAxisAlignment: CrossAxisAlignment.start,
                          //       children: [
                          //         TextWidget(
                          //           textValue: "Gender",
                          //           textColor: ColorUtils.blackShade,
                          //           fontFamily: FontUtils.interSemiBold,
                          //           fontSize: 1.6.t,
                          //         ),
                          //         SizedBox(
                          //           height: 0.75.h,
                          //         ),
                          //         TextWidget(
                          //           textValue: "Select Gender",
                          //           textColor: ColorUtils.red,
                          //           fontFamily: FontUtils.interRegular,
                          //           fontSize: 1.8.t,
                          //         ),
                          //       ],
                          //     ),
                          //     InkWell(
                          //         onTap: () {
                          //           _SelectgenderPopup(context);
                          //           // Navigator.push(context,
                          //           //     PageTransition(type: PageTransitionType.fade, child: Edit_Name()));
                          //         },
                          //         child: ForwardButtonBlack()),
                          //   ],
                          // ),
                          // SizedBox(
                          //   height: 1.h,
                          // ),
                          // Divider(
                          //   color: ColorUtils.silver,
                          // ),
                          // SizedBox(
                          //   height: 1.h,
                          // ),
                          // Row(
                          //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          //   children: [
                          //     Column(
                          //       crossAxisAlignment: CrossAxisAlignment.start,
                          //       children: [
                          //         TextWidget(
                          //           textValue: "Date",
                          //           textColor: ColorUtils.blackShade,
                          //           fontFamily: FontUtils.interSemiBold,
                          //           fontSize: 1.6.t,
                          //         ),
                          //         SizedBox(
                          //           height: 0.75.h,
                          //         ),
                          //         TextWidget(
                          //           textValue: "dd/mm/yyyy",
                          //           textColor: ColorUtils.red,
                          //           fontFamily: FontUtils.interRegular,
                          //           fontSize: 1.8.t,
                          //         ),
                          //       ],
                          //     ),
                          //     InkWell(
                          //         onTap: () {
                          //           _SelectdatePopup(context);
                          //           // Navigator.push(context,
                          //           //     PageTransition(type: PageTransitionType.fade, child: Account_Detail()));
                          //         },
                          //         child: ForwardButtonBlack()),
                          //   ],
                          // ),
                          SizedBox(
                            height: 1.h,
                          ),
                          Divider(
                            color: ColorUtils.silver,
                          ),
                          SizedBox(
                            height: 1.h,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  TextWidget(
                                    textValue: "Email",
                                    textColor: ColorUtils.blackShade,
                                    fontFamily: FontUtils.interSemiBold,
                                    fontSize: 1.6.t,
                                  ),
                                  SizedBox(
                                    height: 0.75.h,
                                  ),
                                  TextWidget(
                                    textValue:
                                        model.prefService.userEmail.toString(),
                                    //"hussain.ak073@gmail.com",
                                    textColor: ColorUtils.blackShade,
                                    fontFamily: FontUtils.interRegular,
                                    fontSize: 1.8.t,
                                  ),
                                ],
                              ),
                              // InkWell(
                              //     onTap: () {
                              //       Navigator.push(
                              //           context,
                              //           PageTransition(
                              //               type: PageTransitionType.fade,
                              //               child: Edit_Email()
                              //               ));
                              //     },
                              //     child: ForwardButtonBlack()),
                            ],
                          ),
                          SizedBox(
                            height: 1.h,
                          ),
                          Divider(
                            color: ColorUtils.silver,
                          ),
                          SizedBox(
                            height: 1.h,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  TextWidget(
                                    textValue: "Change Password",
                                    textColor: ColorUtils.blackShade,
                                    fontFamily: FontUtils.interSemiBold,
                                    fontSize: 1.6.t,
                                  ),
                                ],
                              ),
                              InkWell(
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        PageTransition(
                                            type: PageTransitionType.fade,
                                            child: Edit_Password()));
                                  },
                                  child: ForwardButtonBlack()),
                            ],
                          ),
                          SizedBox(
                            height: 1.h,
                          ),
                          Divider(
                            color: ColorUtils.silver,
                          ),
                          SizedBox(
                            height: 1.h,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  TextWidget(
                                    textValue: "Phone",
                                    textColor: ColorUtils.blackShade,
                                    fontFamily: FontUtils.interSemiBold,
                                    fontSize: 1.6.t,
                                  ),
                                  SizedBox(
                                    height: 0.75.h,
                                  ),
                                  TextWidget(
                                    textValue: model.phone.toString(),
                                    //"+92 345 3048539",
                                    textColor: ColorUtils.blackShade,
                                    fontFamily: FontUtils.interRegular,
                                    fontSize: 1.8.t,
                                  ),
                                ],
                              ),
                              InkWell(
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        PageTransition(
                                            type: PageTransitionType.fade,
                                            child: Edit_Number()));
                                  },
                                  child: ForwardButtonBlack()),
                            ],
                          ),
                          SizedBox(
                            height: 1.h,
                          ),
                          Divider(
                            color: ColorUtils.silver,
                          ),
                          SizedBox(
                            height: 1.h,
                          ),
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
                                  SizedBox(
                                    height: 0.75.h,
                                  ),
                                  TextWidget(
                                    textValue:
                                        //"karachi",
                                        model.address.toString(),
                                    //"hussain.ak073@gmail.com",
                                    textColor: ColorUtils.blackShade,
                                    fontFamily: FontUtils.interRegular,
                                    fontSize: 1.8.t,
                                  ),
                                ],
                              ),
                              InkWell(
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        PageTransition(
                                            type: PageTransitionType.fade,
                                            child: Edit_Address()));
                                  },
                                  child: ForwardButtonBlack()),
                            ],
                          ),
                          SizedBox(
                            height: 1.h,
                          ),
                          Divider(
                            color: ColorUtils.silver,
                          ),
                          SizedBox(
                            height: 1.h,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  TextWidget(
                                    textValue: "Age",
                                    textColor: ColorUtils.blackShade,
                                    fontFamily: FontUtils.interSemiBold,
                                    fontSize: 1.6.t,
                                  ),
                                  SizedBox(
                                    height: 0.75.h,
                                  ),
                                  TextWidget(
                                    textValue: model.age.toString(),
                                    // model.phone.toString(),
                                    //"+92 345 3048539",
                                    textColor: ColorUtils.blackShade,
                                    fontFamily: FontUtils.interRegular,
                                    fontSize: 1.8.t,
                                  ),
                                ],
                              ),
                              InkWell(
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        PageTransition(
                                            type: PageTransitionType.fade,
                                            child: Edit_Age()));
                                  },
                                  child: ForwardButtonBlack()),
                            ],
                          ),
                          SizedBox(
                            height: 1.h,
                          ),
                          Divider(
                            color: ColorUtils.silver,
                          ),
                          SizedBox(
                            height: 1.h,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  TextWidget(
                                    textValue: "Height",
                                    textColor: ColorUtils.blackShade,
                                    fontFamily: FontUtils.interSemiBold,
                                    fontSize: 1.6.t,
                                  ),
                                  SizedBox(
                                    height: 0.75.h,
                                  ),
                                  TextWidget(
                                    textValue: model.height.toString(),
                                    // "5",
                                    //model.phone.toString(),
                                    //"+92 345 3048539",
                                    textColor: ColorUtils.blackShade,
                                    fontFamily: FontUtils.interRegular,
                                    fontSize: 1.8.t,
                                  ),
                                ],
                              ),
                              InkWell(
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        PageTransition(
                                            type: PageTransitionType.fade,
                                            child: Edit_Height()));
                                  },
                                  child: ForwardButtonBlack()),
                            ],
                          ),
                          SizedBox(
                            height: 1.h,
                          ),
                          Divider(
                            color: ColorUtils.silver,
                          ),
                          SizedBox(
                            height: 1.h,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  TextWidget(
                                    textValue: "Weight",
                                    textColor: ColorUtils.blackShade,
                                    fontFamily: FontUtils.interSemiBold,
                                    fontSize: 1.6.t,
                                  ),
                                  SizedBox(
                                    height: 0.75.h,
                                  ),
                                  TextWidget(
                                    textValue: model.weight.toString(),
                                    //"11",
                                    textColor: ColorUtils.blackShade,
                                    fontFamily: FontUtils.interRegular,
                                    fontSize: 1.8.t,
                                  ),
                                ],
                              ),
                              InkWell(
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        PageTransition(
                                            type: PageTransitionType.fade,
                                            child: Edit_Weight()));
                                  },
                                  child: ForwardButtonBlack()),
                            ],
                          ),
                          SizedBox(
                            height: 1.h,
                          ),
                          Divider(
                            color: ColorUtils.silver,
                          ),
                          SizedBox(
                            height: 1.h,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  TextWidget(
                                    textValue: "City",
                                    textColor: ColorUtils.blackShade,
                                    fontFamily: FontUtils.interSemiBold,
                                    fontSize: 1.6.t,
                                  ),
                                  SizedBox(
                                    height: 0.75.h,
                                  ),
                                  TextWidget(
                                    textValue: "No City Selected",
                                    textColor: ColorUtils.red,
                                    fontFamily: FontUtils.interRegular,
                                    fontSize: 1.8.t,
                                  ),
                                ],
                              ),
                              InkWell(
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        PageTransition(
                                            type: PageTransitionType.fade,
                                            child: SelectCity()));
                                  },
                                  child: ForwardButtonBlack()),
                            ],
                          ),
                          SizedBox(
                            height: 1.h,
                          ),
                          Divider(
                            color: ColorUtils.silver,
                          ),
                          SizedBox(
                            height: 1.h,
                          ),
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
                                  SizedBox(
                                    height: 0.75.h,
                                  ),
                                  TextWidget(
                                    textValue: "No address details added",
                                    textColor: ColorUtils.blackShade,
                                    fontFamily: FontUtils.interRegular,
                                    fontSize: 1.8.t,
                                  ),
                                ],
                              ),
                              InkWell(
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        PageTransition(
                                            type: PageTransitionType.fade,
                                            child: EnterAddress()));
                                  },
                                  child: ForwardButtonBlack()),
                            ],
                          ),
                          SizedBox(
                            height: 1.h,
                          ),
                          Divider(
                            color: ColorUtils.silver,
                          ),
                          SizedBox(
                            height: 1.h,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  TextWidget(
                                    textValue: "Policy Number",
                                    textColor: ColorUtils.blackShade,
                                    fontFamily: FontUtils.interSemiBold,
                                    fontSize: 1.6.t,
                                  ),
                                  SizedBox(
                                    height: 0.75.h,
                                  ),
                                  TextWidget(
                                    textValue: "No policy details added",
                                    textColor: ColorUtils.blackShade,
                                    fontFamily: FontUtils.interRegular,
                                    fontSize: 1.8.t,
                                  ),
                                ],
                              ),
                              InkWell(
                                  onTap: () {
                                    // Navigator.push(context,
                                    //     PageTransition(type: PageTransitionType.fade, child: Account_Detail()));
                                  },
                                  child: ForwardButtonBlack()),
                            ],
                          ),
                          SizedBox(
                            height: 1.h,
                          ),
                          Divider(
                            color: ColorUtils.silver,
                          ),
                        ],
                      )),
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

  void _SelectgenderPopup(BuildContext) {
    showModalBottomSheet(
      isScrollControlled: true,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(24.0),
          topRight: Radius.circular(24.0),
        ),
      ),
      backgroundColor: Colors.white,
      context: context,
      builder: (context) {
        return PageHorizontalMargin(
          widget: Container(
            height: MediaQuery.of(context).size.height / 1.5,
            child: Column(
              children: [
                SizedBox(
                  height: 2.h,
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: TextWidget(
                    textValue: "Select Gender",
                    fontFamily: FontUtils.poppinsBold,
                    fontSize: 2.2.t,
                    textColor: ColorUtils.red,
                  ),
                ),
                Image.asset(
                  ImageUtils.femaleDoctor,
                  width: 50.i,
                  height: 50.i,
                ),
                SizedBox(
                  height: 2.h,
                ),
                Row(
                  children: [
                    Expanded(flex: 4, child: Text("Male")),
                    Expanded(
                      flex: 1,
                      child: RadioListTile(
                        activeColor: ColorUtils.red,
                        value: 0,
                        groupValue: true,
                        onChanged: (ind) {},
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Expanded(flex: 4, child: Text("Female")),
                    Expanded(
                      flex: 1,
                      child: RadioListTile(
                        activeColor: ColorUtils.red,
                        value: 0,
                        groupValue: true,
                        onChanged: (ind) {},
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Expanded(flex: 4, child: Text("Other")),
                    Expanded(
                      flex: 1,
                      child: RadioListTile(
                        activeColor: ColorUtils.red,
                        value: 0,
                        groupValue: true,
                        onChanged: (ind) {},
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 2.h,
                ),
                RedButton(
                  textValue: "Confirm",
                  onButtonPressed: () {},
                ),
                SizedBox(
                  height: 2.h,
                ),
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

  void _SelectdatePopup(BuildContext) {
    showModalBottomSheet(
      isScrollControlled: true,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(24.0),
          topRight: Radius.circular(24.0),
        ),
      ),
      backgroundColor: Colors.white,
      context: context,
      builder: (context) {
        return PageHorizontalMargin(
          widget: Container(
            height: MediaQuery.of(context).size.height / 1.5,
            child: Column(
              children: [
                SizedBox(
                  height: 2.h,
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: TextWidget(
                    textValue: "Select Date of Birth",
                    fontFamily: FontUtils.poppinsBold,
                    fontSize: 2.2.t,
                    textColor: ColorUtils.red,
                  ),
                ),
                Image.asset(
                  ImageUtils.femaleDoctor,
                  width: 50.i,
                  height: 50.i,
                ),
                SizedBox(
                  height: 2.h,
                ),
                Row(
                  children: [
                    Image.asset(
                      ImageUtils.addIcon,
                    ),
                    SizedBox(
                      width: 2.w,
                    ),
                    TextWidget(
                      textValue: "Enter Date of Birth",
                      fontFamily: FontUtils.poppinsBold,
                      fontSize: 2.2.t,
                      textColor: ColorUtils.red,
                    ),
                  ],
                ),
                SizedBox(
                  height: 3.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: SquareDateTextField(
                        hint: "00",
                        unit: "HH",
                      ),
                    ),
                    SvgPicture.asset(ImageUtils.dateSlash),
                    Expanded(
                      child: SquareDateTextField(
                        hint: "00",
                        unit: "MM",
                      ),
                    ),
                    SvgPicture.asset(ImageUtils.dateSlash),
                    Expanded(
                      child: SquareDateTextField(
                        hint: "2022",
                        unit: "YYYY",
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 4.h,
                ),
                RedButton(
                  textValue: "Confirm",
                  onButtonPressed: () {},
                ),
                SizedBox(
                  height: 2.h,
                ),
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
