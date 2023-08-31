import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:find_my_doctor/App/locator.dart';
import 'package:find_my_doctor/UI/Account/Edit_Profile/edit_name.dart';
import 'package:find_my_doctor/UI/Account/Edit_Profile/edit_number.dart';
import 'package:find_my_doctor/UI/Account/Edit_Profile/edit_password.dart';
import 'package:find_my_doctor/Utils/color_utils.dart';
import 'package:find_my_doctor/Utils/extensions.dart';
import 'package:find_my_doctor/Utils/font_utils.dart';
import 'package:find_my_doctor/Utils/image_utils.dart';
import 'package:find_my_doctor/ViewModels/main_view_model.dart';
import 'package:find_my_doctor/Widgets/back_with_signleText.dart';
import 'package:find_my_doctor/Widgets/forward_button_black.dart';
import 'package:find_my_doctor/Widgets/page_horizontal_margin.dart';
import 'package:find_my_doctor/Widgets/red_button.dart';
import 'package:find_my_doctor/Widgets/text_widget.dart';
import 'package:flutter/material.dart';

import 'package:page_transition/page_transition.dart';
import 'package:stacked/stacked.dart';

import '../../model/get_user_meta_model.dart';
import '../../modules/dio_service.dart';
import 'Edit_Profile/Edit_address.dart';
import 'Edit_Profile/edit_age.dart';
import 'Edit_Profile/edit_height.dart';
import 'Edit_Profile/edit_weight.dart';

class Account_Detail_Test extends StatefulWidget {
  const Account_Detail_Test({Key? key}) : super(key: key);

  @override
  State<Account_Detail_Test> createState() => _Account_Detail_TestState();
}

class _Account_Detail_TestState extends State<Account_Detail_Test> {
  var _dioService = DioService.getInstance();

  Future<UserDetailsModel> getUserApi(String token, int usreId) async {
    final response = await _dioService.get(
      'user-meta/$usreId',
      options: Options(headers: {
        HttpHeaders.authorizationHeader: 'Bearer $token',
        'content-Type': 'application/json'
        // HttpHeaders.contentTypeHeader: "application/json",
        // 'Charset': 'utf-8'
      }),
    );
    var data = json.decode(response.toString());
    if (response.statusCode == 200) {
      return UserDetailsModel.fromJson(data);
    } else {
      return UserDetailsModel.fromJson(data);
    }
  }

  @override
  Widget build(BuildContext context) {
    // String? newaddress = '';
    return ViewModelBuilder<MainViewModel>.reactive(
      viewModelBuilder: () => locator<MainViewModel>(),
      disposeViewModel: false,
      onModelReady: (model) async {
        // await model.gettingUserMeta(
        //     context, model.prefService.userToken.toString(), model.userID!);
      },
      builder: (context, model, child) {
        String? metaKey = '';
        String? metaValue = '';
        String? metaKey1 = '';
        String? metaValue1 = '';
        String? metaKey2 = '';
        String? metaValue2 = '';
        String? metaKey3 = '';
        String? metaValue3 = '';
        return
            // model.getuserLoader == true
            //     ? WholePageLoader()
            GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: SafeArea(
            top: false,
            bottom: false,
            child: Scaffold(
              backgroundColor: Colors.white,
              body: Column(
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
                  Expanded(
                    flex: 1,
                    child: FutureBuilder<UserDetailsModel>(
                        future: getUserApi(
                            model.prefService.userToken.toString(),
                            model.userID!),
                        builder: (context, snapshot) {
                          if (snapshot.hasData) {
                            return ListView.builder(
                                itemCount: 1,
                                itemBuilder: (context, index) {
                                  //age
                                  int index = snapshot.data!.data!.indexWhere(
                                      (item) =>
                                          item.metaKey.toString() == 'age');
                                  if (index != -1) {
                                    metaKey = snapshot
                                        .data!.data![index].metaKey
                                        .toString();
                                    metaValue = snapshot
                                        .data!.data![index].metaValue
                                        .toString();
                                  }
                                  //address
                                  int index1 = snapshot.data!.data!.indexWhere(
                                      (item) =>
                                          item.metaKey.toString() == 'address');
                                  if (index1 != -1) {
                                    metaKey1 = snapshot
                                        .data!.data![index1].metaKey
                                        .toString();
                                    metaValue1 = snapshot
                                        .data!.data![index1].metaValue
                                        .toString();
                                  }
                                  //height

                                  int index2 = snapshot.data!.data!.indexWhere(
                                      (item) =>
                                          item.metaKey.toString() == 'height');
                                  if (index2 != -1) {
                                    metaKey2 = snapshot
                                        .data!.data![index2].metaKey
                                        .toString();
                                    metaValue2 = snapshot
                                        .data!.data![index2].metaValue
                                        .toString();
                                  }
                                  //weight
                                  int index3 = snapshot.data!.data!.indexWhere(
                                      (item) =>
                                          item.metaKey.toString() == 'weight');
                                  if (index3 != -1) {
                                    metaKey3 = snapshot
                                        .data!.data![index3].metaKey
                                        .toString();
                                    metaValue3 = snapshot
                                        .data!.data![index3].metaValue
                                        .toString();
                                  }
                                  return Padding(
                                    padding: const EdgeInsets.only(
                                        left: 20, right: 20),
                                    child: Column(
                                      children: [
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                TextWidget(
                                                  textValue: "Full Name",
                                                  textColor:
                                                      ColorUtils.blackShade,
                                                  fontFamily:
                                                      FontUtils.interSemiBold,
                                                  fontSize: 1.6.t,
                                                ),
                                                SizedBox(
                                                  height: 0.75.h,
                                                ),
                                                TextWidget(
                                                  textValue:
                                                      model.fullname.toString(),
                                                  // "Hussain Akhtar",
                                                  textColor:
                                                      ColorUtils.blackShade,
                                                  fontFamily:
                                                      FontUtils.interRegular,
                                                  fontSize: 1.8.t,
                                                ),
                                              ],
                                            ),
                                            InkWell(
                                                onTap: () {
                                                  Navigator.push(
                                                      context,
                                                      PageTransition(
                                                          type:
                                                              PageTransitionType
                                                                  .fade,
                                                          child: Edit_Name()));
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
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                TextWidget(
                                                  textValue: "Email",
                                                  textColor:
                                                      ColorUtils.blackShade,
                                                  fontFamily:
                                                      FontUtils.interSemiBold,
                                                  fontSize: 1.6.t,
                                                ),
                                                SizedBox(
                                                  height: 0.75.h,
                                                ),
                                                TextWidget(
                                                  textValue: model
                                                      .prefService.userEmail
                                                      .toString(),
                                                  //"hussain.ak073@gmail.com",
                                                  textColor:
                                                      ColorUtils.blackShade,
                                                  fontFamily:
                                                      FontUtils.interRegular,
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
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                TextWidget(
                                                  textValue: "Change Password",
                                                  textColor:
                                                      ColorUtils.blackShade,
                                                  fontFamily:
                                                      FontUtils.interSemiBold,
                                                  fontSize: 1.6.t,
                                                ),
                                              ],
                                            ),
                                            InkWell(
                                                onTap: () {
                                                  Navigator.push(
                                                      context,
                                                      PageTransition(
                                                          type:
                                                              PageTransitionType
                                                                  .fade,
                                                          child:
                                                              Edit_Password()));
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
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                TextWidget(
                                                  textValue: "Phone",
                                                  textColor:
                                                      ColorUtils.blackShade,
                                                  fontFamily:
                                                      FontUtils.interSemiBold,
                                                  fontSize: 1.6.t,
                                                ),
                                                SizedBox(
                                                  height: 0.75.h,
                                                ),
                                                TextWidget(
                                                  textValue:
                                                      model.phone.toString(),
                                                  //"+92 345 3048539",
                                                  textColor:
                                                      ColorUtils.blackShade,
                                                  fontFamily:
                                                      FontUtils.interRegular,
                                                  fontSize: 1.8.t,
                                                ),
                                              ],
                                            ),
                                            InkWell(
                                                onTap: () {
                                                  Navigator.push(
                                                      context,
                                                      PageTransition(
                                                          type:
                                                              PageTransitionType
                                                                  .fade,
                                                          child:
                                                              Edit_Number()));
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
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                TextWidget(
                                                  textValue: metaKey == 'age'
                                                      ? metaKey
                                                      : '',
                                                  textColor:
                                                      ColorUtils.blackShade,
                                                  fontFamily:
                                                      FontUtils.interRegular,
                                                  fontSize: 1.8.t,
                                                ),
                                                SizedBox(
                                                  height: 0.90.h,
                                                ),
                                                TextWidget(
                                                  textValue: metaValue!.isEmpty
                                                      ? 'Enter age'
                                                      : metaValue,
                                                  textColor:
                                                      ColorUtils.blackShade,
                                                  fontFamily:
                                                      FontUtils.interRegular,
                                                  fontSize: 1.8.t,
                                                ),
                                              ],
                                            ),
                                            InkWell(
                                                onTap: () {
                                                  if (metaKey!.isEmpty) {
                                                    model.usersMetaUpdateAge(
                                                        context,
                                                        model.prefService
                                                            .userToken
                                                            .toString(),
                                                        'age'.toString(),
                                                        model.userageController
                                                            .text
                                                            .toString(),
                                                        model.userID!);

                                                    Navigator.push(
                                                        context,
                                                        PageTransition(
                                                            type:
                                                                PageTransitionType
                                                                    .fade,
                                                            child: Edit_Age()));
                                                  } else {}
                                                  Navigator.push(
                                                      context,
                                                      PageTransition(
                                                          type:
                                                              PageTransitionType
                                                                  .fade,
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
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                TextWidget(
                                                  textValue:
                                                      metaKey1 == 'address'
                                                          ? metaKey1
                                                          : '',
                                                  textColor:
                                                      ColorUtils.blackShade,
                                                  fontFamily:
                                                      FontUtils.interRegular,
                                                  fontSize: 1.8.t,
                                                ),
                                                SizedBox(
                                                  height: 0.90.h,
                                                ),
                                                TextWidget(
                                                  textValue: metaValue1!.isEmpty
                                                      ? 'Enter address'
                                                      : metaValue1,
                                                  textColor:
                                                      ColorUtils.blackShade,
                                                  fontFamily:
                                                      FontUtils.interRegular,
                                                  fontSize: 1.8.t,
                                                ),
                                              ],
                                            ),
                                            InkWell(
                                                onTap: () {
                                                  if (metaKey1!.isEmpty) {
                                                    model.usersMetaUpdateAge(
                                                        context,
                                                        model.prefService
                                                            .userToken
                                                            .toString(),
                                                        'address'.toString(),
                                                        model
                                                            .useraddressController
                                                            .text
                                                            .toString(),
                                                        model.userID!);

                                                    Navigator.push(
                                                        context,
                                                        PageTransition(
                                                            type:
                                                                PageTransitionType
                                                                    .fade,
                                                            child:
                                                                Edit_Address()));
                                                  } else {}
                                                  Navigator.push(
                                                      context,
                                                      PageTransition(
                                                          type:
                                                              PageTransitionType
                                                                  .fade,
                                                          child:
                                                              Edit_Address()));
                                                },
                                                child: ForwardButtonBlack()),
                                          ],
                                        ),
                                        //heiht
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
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                TextWidget(
                                                  textValue:
                                                      metaKey2 == 'height'
                                                          ? metaKey2
                                                          : '',
                                                  textColor:
                                                      ColorUtils.blackShade,
                                                  fontFamily:
                                                      FontUtils.interRegular,
                                                  fontSize: 1.8.t,
                                                ),
                                                SizedBox(
                                                  height: 0.90.h,
                                                ),
                                                TextWidget(
                                                  textValue: metaValue2!.isEmpty
                                                      ? 'Enter height'
                                                      : metaValue2,
                                                  textColor:
                                                      ColorUtils.blackShade,
                                                  fontFamily:
                                                      FontUtils.interRegular,
                                                  fontSize: 1.8.t,
                                                ),
                                              ],
                                            ),
                                            InkWell(
                                                onTap: () {
                                                  if (metaKey2!.isEmpty) {
                                                    model.usersMetaUpdateAge(
                                                        context,
                                                        model.prefService
                                                            .userToken
                                                            .toString(),
                                                        'height'.toString(),
                                                        model
                                                            .userheightController
                                                            .text
                                                            .toString(),
                                                        model.userID!);

                                                    Navigator.push(
                                                        context,
                                                        PageTransition(
                                                            type:
                                                                PageTransitionType
                                                                    .fade,
                                                            child:
                                                                Edit_Height()));
                                                  } else {}
                                                  Navigator.push(
                                                      context,
                                                      PageTransition(
                                                          type:
                                                              PageTransitionType
                                                                  .fade,
                                                          child:
                                                              Edit_Height()));
                                                },
                                                child: ForwardButtonBlack()),
                                          ],
                                        ),
                                        //weight
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
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                TextWidget(
                                                  textValue:
                                                      metaKey3 == 'weight'
                                                          ? metaKey3
                                                          : '',
                                                  textColor:
                                                      ColorUtils.blackShade,
                                                  fontFamily:
                                                      FontUtils.interRegular,
                                                  fontSize: 1.8.t,
                                                ),
                                                SizedBox(
                                                  height: 0.90.h,
                                                ),
                                                TextWidget(
                                                  textValue: metaValue3!.isEmpty
                                                      ? 'Enter weight'
                                                      : metaValue3,
                                                  textColor:
                                                      ColorUtils.blackShade,
                                                  fontFamily:
                                                      FontUtils.interRegular,
                                                  fontSize: 1.8.t,
                                                ),
                                              ],
                                            ),
                                            InkWell(
                                                onTap: () {
                                                  if (metaKey3!.isEmpty) {
                                                    model.usersMetaUpdateAge(
                                                        context,
                                                        model.prefService
                                                            .userToken
                                                            .toString(),
                                                        'weight'.toString(),
                                                        model
                                                            .userweightController
                                                            .text
                                                            .toString(),
                                                        model.userID!);

                                                    Navigator.push(
                                                        context,
                                                        PageTransition(
                                                            type:
                                                                PageTransitionType
                                                                    .fade,
                                                            child:
                                                                Edit_Weight()));
                                                  } else {}
                                                  Navigator.push(
                                                      context,
                                                      PageTransition(
                                                          type:
                                                              PageTransitionType
                                                                  .fade,
                                                          child:
                                                              Edit_Weight()));
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
                                      ],
                                    ),
                                  );
                                });
                          } else {
                            return Text('loading');
                          }
                        }),
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
  }
}
