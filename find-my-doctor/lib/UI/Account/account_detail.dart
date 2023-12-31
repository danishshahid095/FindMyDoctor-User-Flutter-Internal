// import 'package:find_my_doctor/App/locator.dart';
// import 'package:find_my_doctor/UI/Account/Edit_Profile/edit_email.dart';
// import 'package:find_my_doctor/UI/Account/Edit_Profile/edit_name.dart';
// import 'package:find_my_doctor/UI/Account/Edit_Profile/edit_number.dart';
// import 'package:find_my_doctor/UI/Account/Edit_Profile/edit_password.dart';
// import 'package:find_my_doctor/UI/Home/BookDoctor/enter_address.dart';
// import 'package:find_my_doctor/UI/Home/BookDoctor/select_city.dart';
// import 'package:find_my_doctor/Utils/color_utils.dart';
// import 'package:find_my_doctor/Utils/extensions.dart';
// import 'package:find_my_doctor/Utils/font_utils.dart';
// import 'package:find_my_doctor/Utils/image_utils.dart';
// import 'package:find_my_doctor/Utils/whole_page_loader.dart';
// import 'package:find_my_doctor/ViewModels/main_view_model.dart';
// import 'package:find_my_doctor/Widgets/back_with_signleText.dart';
// import 'package:find_my_doctor/Widgets/forward_button_black.dart';
// import 'package:find_my_doctor/Widgets/page_horizontal_margin.dart';
// import 'package:find_my_doctor/Widgets/red_button.dart';
// import 'package:find_my_doctor/Widgets/square_date_text_field.dart';
// import 'package:find_my_doctor/Widgets/text_widget.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_svg/flutter_svg.dart';
// import 'package:page_transition/page_transition.dart';
// import 'package:stacked/stacked.dart';

// import '../../model/login/get_user_meta_model.dart';
// import '../../modules/dio_service.dart';
// import '../../services/get/get_user_meta.dart';
// import 'Edit_Profile/Edit_address.dart';
// import 'Edit_Profile/edit_age.dart';
// import 'Edit_Profile/edit_height.dart';
// import 'Edit_Profile/edit_weight.dart';

// class Account_Detail extends StatefulWidget {
//   const Account_Detail({Key? key}) : super(key: key);

//   @override
//   State<Account_Detail> createState() => _Account_DetailState();
// }

// class _Account_DetailState extends State<Account_Detail> {
//   // var _dioService = DioService.getInstance();
//   // late List<ApiData> _apiDataList = [];
//   // @override
//   // void initState() {
//   //   super.initState();
//   //   _fetchData();
//   // }

//   // Future<void> _fetchData() async {
//   //   try {
//   //     final response = await _dioService.get('user-meta/471');
//   //     final jsonList = response.data['data'] as List<dynamic>;
//   //     final apiDataList =
//   //         jsonList.map((jsonData) => ApiData.fromJson(jsonData)).toList();
//   //     setState(() {
//   //       _apiDataList = apiDataList;
//   //     });
//   //   } catch (error) {
//   //     print('Error fetching data: $error');
//   //   }
//   // }


//   @override
//   Widget build(BuildContext context) {
//     return ViewModelBuilder<MainViewModel>.reactive(
//       viewModelBuilder: () => locator<MainViewModel>(),
//       disposeViewModel: false,
//       onModelReady: (model) async {
//         await model.gettingUserMeta(
//             context, model.prefService.userToken.toString(), model.userID!);
//       },
//       builder: (context, model, child) {
//         return model.getuserLoader == true
//             ? WholePageLoader()
//             : GestureDetector(
//                 onTap: () => FocusScope.of(context).unfocus(),
//                 child: SafeArea(
//                   top: false,
//                   bottom: false,
//                   child: Scaffold(
//                     backgroundColor: Colors.white,
//                     body: Column(
//                       children: [
//                         SizedBox(
//                           height: context.getPadding().top,
//                         ),
//                         BackSingleText(
//                           backText: "Personal Information",
//                         ),
//                         SizedBox(
//                           height: 1.h,
//                         ),
//                         Expanded(
//                           child: ListView.builder(
//                               itemCount: model.getUser!.length,
//                               itemBuilder: (context, index) {
//                                 return Padding(
//                                   padding: const EdgeInsets.only(
//                                       left: 20, right: 20),
//                                   child: Column(
//                                     crossAxisAlignment:
//                                         CrossAxisAlignment.start,
//                                     children: [
//                                       Row(
//                                         mainAxisAlignment:
//                                             MainAxisAlignment.spaceBetween,
//                                         children: [],
//                                       ),
//                                       TextWidget(
//                                         textValue: model
//                                             .getUser![index].meta_key
//                                             .toString(),
//                                         // "Address",
//                                         textColor: ColorUtils.blackShade,
//                                         fontFamily: FontUtils.interSemiBold,
//                                         fontSize: 1.6.t,
//                                       ),
//                                       SizedBox(
//                                         height: 0.75.h,
//                                       ),
//                                       // TextWidget(
//                                       //   textValue: model
//                                       //       .getUser![index].meta_key
//                                       //       .toString(),

//                                       //   //"karachi",
//                                       //   //  model.address == null || model.address.toString().isEmpty?' Enter Your Address':  model.address.toString(),
//                                       //   //"hussain.ak073@gmail.com",
//                                       //   textColor: ColorUtils.blackShade,
//                                       //   fontFamily: FontUtils.interRegular,
//                                       //   fontSize: 1.8.t,
//                                       // ),
//                                       TextWidget(
//                                         textValue: model.getUser![index]
//                                                         .meta_value
//                                                         .toString() ==
//                                                     null ||
//                                                 model.getUser![index].meta_value
//                                                     .toString()
//                                                     .isEmpty
//                                             ? 'enter your address'
//                                             : model.getUser![index].meta_value
//                                                 .toString(),

//                                         //"karachi",
//                                         //  model.address == null || model.address.toString().isEmpty?' Enter Your Address':  model.address.toString(),
//                                         //"hussain.ak073@gmail.com",
//                                         textColor: ColorUtils.blackShade,
//                                         fontFamily: FontUtils.interRegular,
//                                         fontSize: 1.8.t,
//                                       ),
//                                       InkWell(
//                                           onTap: () {
//                                             Navigator.push(
//                                                 context,
//                                                 PageTransition(
//                                                     type:
//                                                         PageTransitionType.fade,
//                                                     child: Edit_Address()));
//                                           },
//                                           child: ForwardButtonBlack()),
//                                     ],
//                                   ),
//                                 );
//                               }),
//                         ),
//                         // TextWidget(
//                         //   textValue: model.getUser![0].meta_value.toString(),
//                         //   //"Address",
//                         //   textColor: ColorUtils.blackShade,
//                         //   fontFamily: FontUtils.interSemiBold,
//                         //   fontSize: 1.6.t,
//                         // ),
//                         // Expanded(
//                         //   child: ListView.separated(
//                         //       shrinkWrap: true,
//                         //       physics: NeverScrollableScrollPhysics(),
//                         //       itemBuilder: (context, index) {
//                         //         return Column(
//                         //           crossAxisAlignment: CrossAxisAlignment.start,
//                         //           children: [
//                         //             Row(
//                         //               mainAxisAlignment:
//                         //                   MainAxisAlignment.spaceBetween,
//                         //               children: [
//                         //                 Column(
//                         //                   crossAxisAlignment:
//                         //                       CrossAxisAlignment.start,
//                         //                   children: [
//                         //                     TextWidget(
//                         //                       textValue: model
//                         //                           .getUser![index].meta_key
//                         //                           .toString(),
//                         //                       //"Address",
//                         //                       textColor: ColorUtils.blackShade,
//                         //                       fontFamily: FontUtils.interSemiBold,
//                         //                       fontSize: 1.6.t,
//                         //                     ),
//                         //                     SizedBox(
//                         //                       height: 0.75.h,
//                         //                     ),
//                         //                     TextWidget(
//                         //                       textValue: model
//                         //                           .getUser![index].meta_value
//                         //                           .toString(),
//                         //                       //"karachi",
//                         //                       // model.address == null ||
//                         //                       //         model.address.toString().isEmpty
//                         //                       //     ? ' Enter Your Address'
//                         //                       //     : model.address.toString(),
//                         //                       //"hussain.ak073@gmail.com",
//                         //                       textColor: ColorUtils.blackShade,
//                         //                       fontFamily: FontUtils.interRegular,
//                         //                       fontSize: 1.8.t,
//                         //                     ),
//                         //                   ],
//                         //                 ),
//                         //                 InkWell(
//                         //                     onTap: () {
//                         //                       Navigator.push(
//                         //                           context,
//                         //                           PageTransition(
//                         //                               type: PageTransitionType.fade,
//                         //                               child: Edit_Address()));
//                         //                     },
//                         //                     child: ForwardButtonBlack()),
//                         //               ],
//                         //             ),
//                         //           ],
//                         //         );
//                         //       },
//                         //       separatorBuilder: (context, index) {
//                         //         return Divider();
//                         //       },
//                         //       itemCount: model.getUser?.length ?? 0),
//                         // ),
//                         // Expanded(
//                         //   child: ListView.builder(
//                         //       itemCount: _apiDataList.length,
//                         //       itemBuilder: (context, index) {
//                         //         return Row(
//                         //           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                         //           children: [
//                         //             Column(
//                         //               crossAxisAlignment: CrossAxisAlignment.start,
//                         //               children: [
//                         //                 TextWidget(
//                         //                   textValue: "Address",
//                         //                   textColor: ColorUtils.blackShade,
//                         //                   fontFamily: FontUtils.interSemiBold,
//                         //                   fontSize: 1.6.t,
//                         //                 ),
//                         //                 SizedBox(
//                         //                   height: 0.75.h,
//                         //                 ),
//                         //                 TextWidget(
//                         //                   textValue: _apiDataList[index].metaValue,
//                         //                   //"karachi",
//                         //                   //  model.address == null || model.address.toString().isEmpty?' Enter Your Address':  model.address.toString(),
//                         //                   //"hussain.ak073@gmail.com",
//                         //                   textColor: ColorUtils.blackShade,
//                         //                   fontFamily: FontUtils.interRegular,
//                         //                   fontSize: 1.8.t,
//                         //                 ),
//                         //               ],
//                         //             ),
//                         //             InkWell(
//                         //                 onTap: () {
//                         //                   Navigator.push(
//                         //                       context,
//                         //                       PageTransition(
//                         //                           type: PageTransitionType.fade,
//                         //                           child: Edit_Address()));
//                         //                 },
//                         //                 child: ForwardButtonBlack()),
//                         //           ],
//                         //         );
//                         //       }),
//                         //),
//                         Expanded(
//                           child: SingleChildScrollView(
//                             child: PageHorizontalMargin(
//                                 widget: Column(
//                               children: [
//                                 SizedBox(
//                                   height: 2.h,
//                                 ),

//                                 Row(
//                                   mainAxisAlignment:
//                                       MainAxisAlignment.spaceBetween,
//                                   children: [
//                                     Column(
//                                       crossAxisAlignment:
//                                           CrossAxisAlignment.start,
//                                       children: [
//                                         TextWidget(
//                                           textValue: "Full Name",
//                                           textColor: ColorUtils.blackShade,
//                                           fontFamily: FontUtils.interSemiBold,
//                                           fontSize: 1.6.t,
//                                         ),
//                                         SizedBox(
//                                           height: 0.75.h,
//                                         ),
//                                         TextWidget(
//                                           textValue: model.fullname.toString(),
//                                           // "Hussain Akhtar",
//                                           textColor: ColorUtils.blackShade,
//                                           fontFamily: FontUtils.interRegular,
//                                           fontSize: 1.8.t,
//                                         ),
//                                       ],
//                                     ),
//                                     InkWell(
//                                         onTap: () {
//                                           Navigator.push(
//                                               context,
//                                               PageTransition(
//                                                   type: PageTransitionType.fade,
//                                                   child: Edit_Name()));
//                                         },
//                                         child: ForwardButtonBlack()),
//                                   ],
//                                 ),
//                                 // SizedBox(
//                                 //   height: 1.h,
//                                 // ),
//                                 // Divider(
//                                 //   color: ColorUtils.silver,
//                                 // ),
//                                 // SizedBox(
//                                 //   height: 1.h,
//                                 // ),
//                                 // Row(
//                                 //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                                 //   children: [
//                                 //     Column(
//                                 //       crossAxisAlignment: CrossAxisAlignment.start,
//                                 //       children: [
//                                 //         TextWidget(
//                                 //           textValue: "Gender",
//                                 //           textColor: ColorUtils.blackShade,
//                                 //           fontFamily: FontUtils.interSemiBold,
//                                 //           fontSize: 1.6.t,
//                                 //         ),
//                                 //         SizedBox(
//                                 //           height: 0.75.h,
//                                 //         ),
//                                 //         TextWidget(
//                                 //           textValue: "Select Gender",
//                                 //           textColor: ColorUtils.red,
//                                 //           fontFamily: FontUtils.interRegular,
//                                 //           fontSize: 1.8.t,
//                                 //         ),
//                                 //       ],
//                                 //     ),
//                                 //     InkWell(
//                                 //         onTap: () {
//                                 //           _SelectgenderPopup(context);
//                                 //           // Navigator.push(context,
//                                 //           //     PageTransition(type: PageTransitionType.fade, child: Edit_Name()));
//                                 //         },
//                                 //         child: ForwardButtonBlack()),
//                                 //   ],
//                                 // ),
//                                 // SizedBox(
//                                 //   height: 1.h,
//                                 // ),
//                                 // Divider(
//                                 //   color: ColorUtils.silver,
//                                 // ),
//                                 // SizedBox(
//                                 //   height: 1.h,
//                                 // ),
//                                 // Row(
//                                 //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                                 //   children: [
//                                 //     Column(
//                                 //       crossAxisAlignment: CrossAxisAlignment.start,
//                                 //       children: [
//                                 //         TextWidget(
//                                 //           textValue: "Date",
//                                 //           textColor: ColorUtils.blackShade,
//                                 //           fontFamily: FontUtils.interSemiBold,
//                                 //           fontSize: 1.6.t,
//                                 //         ),
//                                 //         SizedBox(
//                                 //           height: 0.75.h,
//                                 //         ),
//                                 //         TextWidget(
//                                 //           textValue: "dd/mm/yyyy",
//                                 //           textColor: ColorUtils.red,
//                                 //           fontFamily: FontUtils.interRegular,
//                                 //           fontSize: 1.8.t,
//                                 //         ),
//                                 //       ],
//                                 //     ),
//                                 //     InkWell(
//                                 //         onTap: () {
//                                 //           _SelectdatePopup(context);
//                                 //           // Navigator.push(context,
//                                 //           //     PageTransition(type: PageTransitionType.fade, child: Account_Detail()));
//                                 //         },
//                                 //         child: ForwardButtonBlack()),
//                                 //   ],
//                                 // ),
//                                 SizedBox(
//                                   height: 1.h,
//                                 ),
//                                 Divider(
//                                   color: ColorUtils.silver,
//                                 ),
//                                 SizedBox(
//                                   height: 1.h,
//                                 ),
//                                 Row(
//                                   mainAxisAlignment:
//                                       MainAxisAlignment.spaceBetween,
//                                   children: [
//                                     Column(
//                                       crossAxisAlignment:
//                                           CrossAxisAlignment.start,
//                                       children: [
//                                         TextWidget(
//                                           textValue: "Email",
//                                           textColor: ColorUtils.blackShade,
//                                           fontFamily: FontUtils.interSemiBold,
//                                           fontSize: 1.6.t,
//                                         ),
//                                         SizedBox(
//                                           height: 0.75.h,
//                                         ),
//                                         TextWidget(
//                                           textValue: model.prefService.userEmail
//                                               .toString(),
//                                           //"hussain.ak073@gmail.com",
//                                           textColor: ColorUtils.blackShade,
//                                           fontFamily: FontUtils.interRegular,
//                                           fontSize: 1.8.t,
//                                         ),
//                                       ],
//                                     ),
//                                     // InkWell(
//                                     //     onTap: () {
//                                     //       Navigator.push(
//                                     //           context,
//                                     //           PageTransition(
//                                     //               type: PageTransitionType.fade,
//                                     //               child: Edit_Email()
//                                     //               ));
//                                     //     },
//                                     //     child: ForwardButtonBlack()),
//                                   ],
//                                 ),
//                                 SizedBox(
//                                   height: 1.h,
//                                 ),
//                                 Divider(
//                                   color: ColorUtils.silver,
//                                 ),
//                                 SizedBox(
//                                   height: 1.h,
//                                 ),
//                                 Row(
//                                   mainAxisAlignment:
//                                       MainAxisAlignment.spaceBetween,
//                                   children: [
//                                     Column(
//                                       crossAxisAlignment:
//                                           CrossAxisAlignment.start,
//                                       children: [
//                                         TextWidget(
//                                           textValue: "Change Password",
//                                           textColor: ColorUtils.blackShade,
//                                           fontFamily: FontUtils.interSemiBold,
//                                           fontSize: 1.6.t,
//                                         ),
//                                       ],
//                                     ),
//                                     InkWell(
//                                         onTap: () {
//                                           Navigator.push(
//                                               context,
//                                               PageTransition(
//                                                   type: PageTransitionType.fade,
//                                                   child: Edit_Password()));
//                                         },
//                                         child: ForwardButtonBlack()),
//                                   ],
//                                 ),
//                                 SizedBox(
//                                   height: 1.h,
//                                 ),
//                                 Divider(
//                                   color: ColorUtils.silver,
//                                 ),
//                                 SizedBox(
//                                   height: 1.h,
//                                 ),
//                                 Row(
//                                   mainAxisAlignment:
//                                       MainAxisAlignment.spaceBetween,
//                                   children: [
//                                     Column(
//                                       crossAxisAlignment:
//                                           CrossAxisAlignment.start,
//                                       children: [
//                                         TextWidget(
//                                           textValue: "Phone",
//                                           textColor: ColorUtils.blackShade,
//                                           fontFamily: FontUtils.interSemiBold,
//                                           fontSize: 1.6.t,
//                                         ),
//                                         SizedBox(
//                                           height: 0.75.h,
//                                         ),
//                                         TextWidget(
//                                           textValue: model.phone.toString(),
//                                           //"+92 345 3048539",
//                                           textColor: ColorUtils.blackShade,
//                                           fontFamily: FontUtils.interRegular,
//                                           fontSize: 1.8.t,
//                                         ),
//                                       ],
//                                     ),
//                                     InkWell(
//                                         onTap: () {
//                                           Navigator.push(
//                                               context,
//                                               PageTransition(
//                                                   type: PageTransitionType.fade,
//                                                   child: Edit_Number()));
//                                         },
//                                         child: ForwardButtonBlack()),
//                                   ],
//                                 ),
//                                 SizedBox(
//                                   height: 1.h,
//                                 ),
//                                 Divider(
//                                   color: ColorUtils.silver,
//                                 ),
//                                 SizedBox(
//                                   height: 1.h,
//                                 ),

//                                 Row(
//                                   mainAxisAlignment:
//                                       MainAxisAlignment.spaceBetween,
//                                   children: [
//                                     Expanded(
//                                       child: Column(
//                                         crossAxisAlignment:
//                                             CrossAxisAlignment.start,
//                                         children: [
//                                           TextWidget(
//                                             textValue: "Address",
//                                             textColor: ColorUtils.blackShade,
//                                             fontFamily: FontUtils.interSemiBold,
//                                             fontSize: 1.6.t,
//                                           ),
//                                           SizedBox(
//                                             height: 0.75.h,
//                                           ),
//                                           TextWidget(
//                                             textValue: model.getUser![0]
//                                                             .meta_value
//                                                             .toString() ==
//                                                         null ||
//                                                     model.getUser![0].meta_value
//                                                         .toString()
//                                                         .isEmpty
//                                                 ? ' Enter Your Address'
//                                                 : model.getUser![0].meta_value
//                                                     .toString(),
//                                             //"karachi",
//                                             // model.address == null ||
//                                             //         model.address
//                                             //             .toString()
//                                             //             .isEmpty
//                                             //     ? ' Enter Your Address'
//                                             //     : model.address.toString(),
//                                             //"hussain.ak073@gmail.com",
//                                             textColor: ColorUtils.blackShade,
//                                             fontFamily: FontUtils.interRegular,
//                                             fontSize: 1.8.t,
//                                           ),
//                                         ],
//                                       ),
//                                     ),
//                                     InkWell(
//                                         onTap: () {
//                                           Navigator.push(
//                                               context,
//                                               PageTransition(
//                                                   type: PageTransitionType.fade,
//                                                   child: Edit_Address()));
//                                         },
//                                         child: ForwardButtonBlack()),
//                                   ],
//                                 ),
//                                 SizedBox(
//                                   height: 1.h,
//                                 ),
//                                 Divider(
//                                   color: ColorUtils.silver,
//                                 ),
//                                 SizedBox(
//                                   height: 1.h,
//                                 ),
//                                 Row(
//                                   mainAxisAlignment:
//                                       MainAxisAlignment.spaceBetween,
//                                   children: [
//                                     Column(
//                                       crossAxisAlignment:
//                                           CrossAxisAlignment.start,
//                                       children: [
//                                         TextWidget(
//                                           textValue: "Age",
//                                           textColor: ColorUtils.blackShade,
//                                           fontFamily: FontUtils.interSemiBold,
//                                           fontSize: 1.6.t,
//                                         ),
//                                         SizedBox(
//                                           height: 0.75.h,
//                                         ),
                                      

//                                         TextWidget(
//                                           textValue: 
                                        

//                                           // model.getUser != null &&
//                                           //         model.getUser!.isNotEmpty
//                                           //     ? (model.getUser![0].meta_key ==
//                                           //                 'Age' &&
//                                           //             model.getUser![0]
//                                           //                     .meta_value !=
//                                           //                 null &&
//                                           //             model.getUser![0]
//                                           //                 .meta_value
//                                           //                 .toString()
//                                           //                 .isNotEmpty
//                                           //         ? model.getUser![0].meta_value
//                                           //             .toString()
//                                           //         : 'Enter Your age')
//                                           //     : 'Enter Your age',
//                                           //  model.getUser![0]
//                                           //                 .meta_value
//                                           //                 .toString() ==
//                                           //             null ||
//                                           //         model.getUser![0].meta_value
//                                           //             .toString()
//                                           //             .isEmpty
//                                           //     ? ' Enter Your Age'
//                                           //     : model.getUser![1].meta_value
//                                           //         .toString(),
//                                           model.age == null ||
//                                                   model.age
//                                                       .toString()
//                                                       .isEmpty
//                                               ? ' Enter Your Age'
//                                               : model.age.toString(),
//                                           // model.age.toString(),
//                                           // model.phone.toString(),
//                                           //"+92 345 3048539",
//                                           textColor: ColorUtils.blackShade,
//                                           fontFamily: FontUtils.interRegular,
//                                           fontSize: 1.8.t,
//                                         ),
//                                       ],
//                                     ),
//                                     InkWell(
//                                         onTap: () {
//                                           Navigator.push(
//                                               context,
//                                               PageTransition(
//                                                   type: PageTransitionType.fade,
//                                                   child: Edit_Age()));
//                                         },
//                                         child: ForwardButtonBlack()),
//                                   ],
//                                 ),
//                                 SizedBox(
//                                   height: 1.h,
//                                 ),
//                                 Divider(
//                                   color: ColorUtils.silver,
//                                 ),
//                                 SizedBox(
//                                   height: 1.h,
//                                 ),
//                                 Row(
//                                   mainAxisAlignment:
//                                       MainAxisAlignment.spaceBetween,
//                                   children: [
//                                     Column(
//                                       crossAxisAlignment:
//                                           CrossAxisAlignment.start,
//                                       children: [
//                                         TextWidget(
//                                           textValue: "Height",
//                                           textColor: ColorUtils.blackShade,
//                                           fontFamily: FontUtils.interSemiBold,
//                                           fontSize: 1.6.t,
//                                         ),
//                                         SizedBox(
//                                           height: 0.75.h,
//                                         ),
//                                         TextWidget(
//                                           textValue: model.height == null ||
//                                                   model.height
//                                                       .toString()
//                                                       .isEmpty
//                                               ? ' Enter Your height'
//                                               : model.height.toString(),
//                                           //model.height.toString(),
//                                           // "5",
//                                           //model.phone.toString(),
//                                           //"+92 345 3048539",
//                                           textColor: ColorUtils.blackShade,
//                                           fontFamily: FontUtils.interRegular,
//                                           fontSize: 1.8.t,
//                                         ),
//                                       ],
//                                     ),
//                                     InkWell(
//                                         onTap: () {
//                                           Navigator.push(
//                                               context,
//                                               PageTransition(
//                                                   type: PageTransitionType.fade,
//                                                   child: Edit_Height()));
//                                         },
//                                         child: ForwardButtonBlack()),
//                                   ],
//                                 ),
//                                 SizedBox(
//                                   height: 1.h,
//                                 ),
//                                 Divider(
//                                   color: ColorUtils.silver,
//                                 ),
//                                 SizedBox(
//                                   height: 1.h,
//                                 ),
//                                 Row(
//                                   mainAxisAlignment:
//                                       MainAxisAlignment.spaceBetween,
//                                   children: [
//                                     Column(
//                                       crossAxisAlignment:
//                                           CrossAxisAlignment.start,
//                                       children: [
//                                         TextWidget(
//                                           textValue: "Weight",
//                                           textColor: ColorUtils.blackShade,
//                                           fontFamily: FontUtils.interSemiBold,
//                                           fontSize: 1.6.t,
//                                         ),
//                                         SizedBox(
//                                           height: 0.75.h,
//                                         ),
//                                         TextWidget(
//                                           textValue: model.weight == null ||
//                                                   model.weight
//                                                       .toString()
//                                                       .isEmpty
//                                               ? ' Enter Your weight'
//                                               : model.weight.toString(),
//                                           //model.weight.toString(),
//                                           //"11",
//                                           textColor: ColorUtils.blackShade,
//                                           fontFamily: FontUtils.interRegular,
//                                           fontSize: 1.8.t,
//                                         ),
//                                       ],
//                                     ),
//                                     InkWell(
//                                         onTap: () {
//                                           Navigator.push(
//                                               context,
//                                               PageTransition(
//                                                   type: PageTransitionType.fade,
//                                                   child: Edit_Weight()));
//                                         },
//                                         child: ForwardButtonBlack()),
//                                   ],
//                                 ),
//                                 SizedBox(
//                                   height: 1.h,
//                                 ),
//                                 Divider(
//                                   color: ColorUtils.silver,
//                                 ),
//                                 SizedBox(
//                                   height: 1.h,
//                                 ),
//                                 // Row(
//                                 //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                                 //   children: [
//                                 //     Column(
//                                 //       crossAxisAlignment: CrossAxisAlignment.start,
//                                 //       children: [
//                                 //         TextWidget(
//                                 //           textValue: "City",
//                                 //           textColor: ColorUtils.blackShade,
//                                 //           fontFamily: FontUtils.interSemiBold,
//                                 //           fontSize: 1.6.t,
//                                 //         ),
//                                 //         SizedBox(
//                                 //           height: 0.75.h,
//                                 //         ),
//                                 //         TextWidget(
//                                 //           textValue: "No City Selected",
//                                 //           textColor: ColorUtils.red,
//                                 //           fontFamily: FontUtils.interRegular,
//                                 //           fontSize: 1.8.t,
//                                 //         ),
//                                 //       ],
//                                 //     ),
//                                 //     InkWell(
//                                 //         onTap: () {
//                                 //           Navigator.push(
//                                 //               context,
//                                 //               PageTransition(
//                                 //                   type: PageTransitionType.fade,
//                                 //                   child: SelectCity()));
//                                 //         },
//                                 //         child: ForwardButtonBlack()),
//                                 //   ],
//                                 // ),
//                                 // SizedBox(
//                                 //   height: 1.h,
//                                 // ),
//                                 // Divider(
//                                 //   color: ColorUtils.silver,
//                                 // ),
//                                 // SizedBox(
//                                 //   height: 1.h,
//                                 // ),
//                                 // Row(
//                                 //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                                 //   children: [
//                                 //     Column(
//                                 //       crossAxisAlignment: CrossAxisAlignment.start,
//                                 //       children: [
//                                 //         TextWidget(
//                                 //           textValue: "Address",
//                                 //           textColor: ColorUtils.blackShade,
//                                 //           fontFamily: FontUtils.interSemiBold,
//                                 //           fontSize: 1.6.t,
//                                 //         ),
//                                 //         SizedBox(
//                                 //           height: 0.75.h,
//                                 //         ),
//                                 //         TextWidget(
//                                 //           textValue: "No address details added",
//                                 //           textColor: ColorUtils.blackShade,
//                                 //           fontFamily: FontUtils.interRegular,
//                                 //           fontSize: 1.8.t,
//                                 //         ),
//                                 //       ],
//                                 //     ),
//                                 //     InkWell(
//                                 //         onTap: () {
//                                 //           Navigator.push(
//                                 //               context,
//                                 //               PageTransition(
//                                 //                   type: PageTransitionType.fade,
//                                 //                   child: EnterAddress()));
//                                 //         },
//                                 //         child: ForwardButtonBlack()),
//                                 //   ],
//                                 // ),
//                                 // SizedBox(
//                                 //   height: 1.h,
//                                 // ),
//                                 // Divider(
//                                 //   color: ColorUtils.silver,
//                                 // ),
//                                 // SizedBox(
//                                 //   height: 1.h,
//                                 // ),
//                                 // Row(
//                                 //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                                 //   children: [
//                                 //     Column(
//                                 //       crossAxisAlignment: CrossAxisAlignment.start,
//                                 //       children: [
//                                 //         TextWidget(
//                                 //           textValue: "Policy Number",
//                                 //           textColor: ColorUtils.blackShade,
//                                 //           fontFamily: FontUtils.interSemiBold,
//                                 //           fontSize: 1.6.t,
//                                 //         ),
//                                 //         SizedBox(
//                                 //           height: 0.75.h,
//                                 //         ),
//                                 //         TextWidget(
//                                 //           textValue: "No policy details added",
//                                 //           textColor: ColorUtils.blackShade,
//                                 //           fontFamily: FontUtils.interRegular,
//                                 //           fontSize: 1.8.t,
//                                 //         ),
//                                 //       ],
//                                 //     ),
//                                 //     InkWell(
//                                 //         onTap: () {
//                                 //           // Navigator.push(context,
//                                 //           //     PageTransition(type: PageTransitionType.fade, child: Account_Detail()));
//                                 //         },
//                                 //         child: ForwardButtonBlack()),
//                                 //   ],
//                                 // ),
//                                 // SizedBox(
//                                 //   height: 1.h,
//                                 // ),
//                                 // Divider(
//                                 //   color: ColorUtils.silver,
//                                 // ),
//                               ],
//                             )),
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                 ),
//               );
//       },
//     );
//   }

//   void _SelectgenderPopup(BuildContext) {
//     showModalBottomSheet(
//       isScrollControlled: true,
//       shape: RoundedRectangleBorder(
//         borderRadius: BorderRadius.only(
//           topLeft: Radius.circular(24.0),
//           topRight: Radius.circular(24.0),
//         ),
//       ),
//       backgroundColor: Colors.white,
//       context: context,
//       builder: (context) {
//         return PageHorizontalMargin(
//           widget: Container(
//             height: MediaQuery.of(context).size.height / 1.5,
//             child: Column(
//               children: [
//                 SizedBox(
//                   height: 2.h,
//                 ),
//                 Align(
//                   alignment: Alignment.centerLeft,
//                   child: TextWidget(
//                     textValue: "Select Gender",
//                     fontFamily: FontUtils.poppinsBold,
//                     fontSize: 2.2.t,
//                     textColor: ColorUtils.red,
//                   ),
//                 ),
//                 Image.asset(
//                   ImageUtils.femaleDoctor,
//                   width: 50.i,
//                   height: 50.i,
//                 ),
//                 SizedBox(
//                   height: 2.h,
//                 ),
//                 Row(
//                   children: [
//                     Expanded(flex: 4, child: Text("Male")),
//                     Expanded(
//                       flex: 1,
//                       child: RadioListTile(
//                         activeColor: ColorUtils.red,
//                         value: 0,
//                         groupValue: true,
//                         onChanged: (ind) {},
//                       ),
//                     ),
//                   ],
//                 ),
//                 Row(
//                   children: [
//                     Expanded(flex: 4, child: Text("Female")),
//                     Expanded(
//                       flex: 1,
//                       child: RadioListTile(
//                         activeColor: ColorUtils.red,
//                         value: 0,
//                         groupValue: true,
//                         onChanged: (ind) {},
//                       ),
//                     ),
//                   ],
//                 ),
//                 Row(
//                   children: [
//                     Expanded(flex: 4, child: Text("Other")),
//                     Expanded(
//                       flex: 1,
//                       child: RadioListTile(
//                         activeColor: ColorUtils.red,
//                         value: 0,
//                         groupValue: true,
//                         onChanged: (ind) {},
//                       ),
//                     ),
//                   ],
//                 ),
//                 SizedBox(
//                   height: 2.h,
//                 ),
//                 RedButton(
//                   textValue: "Confirm",
//                   onButtonPressed: () {},
//                 ),
//                 SizedBox(
//                   height: 2.h,
//                 ),
//               ],
//             ),
//           ),
//         );
//       },
//     );
//     // showCupertinoModalPopup(
//     //    context: BuildContext,
//     //     builder: (_) => Container(
//     //       height: MediaQuery.of(context).size.height/2.5,
//     //       color: Color.fromARGB(255, 255, 255, 255),
//     //       child: Column(
//     //         crossAxisAlignment: CrossAxisAlignment.start ,
//     //         children: [
//     //           TextWidget(
//     //             textValue: "General Physisian",
//     //             fontFamily: FontUtils.interSemiBold,
//     //             fontSize: FontSize.size18,
//     //             textColor: ColorUtils.red,
//     //           ),
//     //           SizedBox(height: 2.h,),
//     //           Container(
//     //             height: 180,
//     //             child: CupertinoDatePicker(
//     //                 initialDateTime: DateTime.now(),
//     //                 onDateTimeChanged: (val) {
//     //                   setState(() {
//     //                     dateSelected = val.toString();
//     //                   });
//     //                 }),
//     //           ),
//     //         ],
//     //       ),
//     //     ));
//   }

//   void _SelectdatePopup(BuildContext) {
//     showModalBottomSheet(
//       isScrollControlled: true,
//       shape: RoundedRectangleBorder(
//         borderRadius: BorderRadius.only(
//           topLeft: Radius.circular(24.0),
//           topRight: Radius.circular(24.0),
//         ),
//       ),
//       backgroundColor: Colors.white,
//       context: context,
//       builder: (context) {
//         return PageHorizontalMargin(
//           widget: Container(
//             height: MediaQuery.of(context).size.height / 1.5,
//             child: Column(
//               children: [
//                 SizedBox(
//                   height: 2.h,
//                 ),
//                 Align(
//                   alignment: Alignment.centerLeft,
//                   child: TextWidget(
//                     textValue: "Select Date of Birth",
//                     fontFamily: FontUtils.poppinsBold,
//                     fontSize: 2.2.t,
//                     textColor: ColorUtils.red,
//                   ),
//                 ),
//                 Image.asset(
//                   ImageUtils.femaleDoctor,
//                   width: 50.i,
//                   height: 50.i,
//                 ),
//                 SizedBox(
//                   height: 2.h,
//                 ),
//                 Row(
//                   children: [
//                     Image.asset(
//                       ImageUtils.addIcon,
//                     ),
//                     SizedBox(
//                       width: 2.w,
//                     ),
//                     TextWidget(
//                       textValue: "Enter Date of Birth",
//                       fontFamily: FontUtils.poppinsBold,
//                       fontSize: 2.2.t,
//                       textColor: ColorUtils.red,
//                     ),
//                   ],
//                 ),
//                 SizedBox(
//                   height: 3.h,
//                 ),
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: [
//                     Expanded(
//                       child: SquareDateTextField(
//                         hint: "00",
//                         unit: "HH",
//                       ),
//                     ),
//                     SvgPicture.asset(ImageUtils.dateSlash),
//                     Expanded(
//                       child: SquareDateTextField(
//                         hint: "00",
//                         unit: "MM",
//                       ),
//                     ),
//                     SvgPicture.asset(ImageUtils.dateSlash),
//                     Expanded(
//                       child: SquareDateTextField(
//                         hint: "2022",
//                         unit: "YYYY",
//                       ),
//                     ),
//                   ],
//                 ),
//                 SizedBox(
//                   height: 4.h,
//                 ),
//                 RedButton(
//                   textValue: "Confirm",
//                   onButtonPressed: () {},
//                 ),
//                 SizedBox(
//                   height: 2.h,
//                 ),
//               ],
//             ),
//           ),
//         );
//       },
//     );
//     // showCupertinoModalPopup(
//     //    context: BuildContext,
//     //     builder: (_) => Container(
//     //       height: MediaQuery.of(context).size.height/2.5,
//     //       color: Color.fromARGB(255, 255, 255, 255),
//     //       child: Column(
//     //         crossAxisAlignment: CrossAxisAlignment.start ,
//     //         children: [
//     //           TextWidget(
//     //             textValue: "General Physisian",
//     //             fontFamily: FontUtils.interSemiBold,
//     //             fontSize: FontSize.size18,
//     //             textColor: ColorUtils.red,
//     //           ),
//     //           SizedBox(height: 2.h,),
//     //           Container(
//     //             height: 180,
//     //             child: CupertinoDatePicker(
//     //                 initialDateTime: DateTime.now(),
//     //                 onDateTimeChanged: (val) {
//     //                   setState(() {
//     //                     dateSelected = val.toString();
//     //                   });
//     //                 }),
//     //           ),
//     //         ],
//     //       ),
//     //     ));
//   }
// }




///new code

// import 'dart:convert';
// import 'dart:io';

// import 'package:dio/dio.dart';
// import 'package:find_my_doctor/App/locator.dart';
// import 'package:find_my_doctor/UI/Account/Edit_Profile/edit_name.dart';
// import 'package:find_my_doctor/UI/Account/Edit_Profile/edit_number.dart';
// import 'package:find_my_doctor/UI/Account/Edit_Profile/edit_password.dart';
// import 'package:find_my_doctor/Utils/color_utils.dart';
// import 'package:find_my_doctor/Utils/extensions.dart';
// import 'package:find_my_doctor/Utils/font_utils.dart';
// import 'package:find_my_doctor/Utils/image_utils.dart';
// import 'package:find_my_doctor/ViewModels/main_view_model.dart';
// import 'package:find_my_doctor/Widgets/back_with_signleText.dart';
// import 'package:find_my_doctor/Widgets/forward_button_black.dart';
// import 'package:find_my_doctor/Widgets/page_horizontal_margin.dart';
// import 'package:find_my_doctor/Widgets/red_button.dart';
// import 'package:find_my_doctor/Widgets/text_widget.dart';
// import 'package:flutter/material.dart';

// import 'package:page_transition/page_transition.dart';
// import 'package:stacked/stacked.dart';

// import '../../model/get_user_meta_model.dart';
// import '../../modules/dio_service.dart';
// import 'Edit_Profile/Edit_address.dart';
// import 'Edit_Profile/edit_age.dart';
// import 'Edit_Profile/edit_height.dart';
// import 'Edit_Profile/edit_weight.dart';

// class Account_Detail_Test extends StatefulWidget {
//   const Account_Detail_Test({Key? key}) : super(key: key);

//   @override
//   State<Account_Detail_Test> createState() => _Account_Detail_TestState();
// }

// class _Account_Detail_TestState extends State<Account_Detail_Test> {
//   var _dioService = DioService.getInstance();

//   Future<UserDetailsModel> getUserApi(String token, int usreId) async {
//     final response = await _dioService.get(
//       'user-meta/$usreId',
//       options: Options(headers: {
//         HttpHeaders.authorizationHeader: 'Bearer $token',
//         'content-Type': 'application/json'
//         // HttpHeaders.contentTypeHeader: "application/json",
//         // 'Charset': 'utf-8'
//       }),
//     );
//     var data = json.decode(response.toString());
//     if (response.statusCode == 200) {
//       return UserDetailsModel.fromJson(data);
//     } else {
//       return UserDetailsModel.fromJson(data);
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     // String? newaddress = '';
//     return ViewModelBuilder<MainViewModel>.reactive(
//       viewModelBuilder: () => locator<MainViewModel>(),
//       disposeViewModel: false,
//       onModelReady: (model) async {
//         // await model.gettingUserMeta(
//         //     context, model.prefService.userToken.toString(), model.userID!);
//       },
//       builder: (context, model, child) {
//         String? metaKey = '';
//         String? metaValue = '';
//         String? metaKey1 = '';
//         String? metaValue1 = '';
//         String? metaKey2 = '';
//         String? metaValue2 = '';
//         String? metaKey3 = '';
//         String? metaValue3 = '';
//         return
//             // model.getuserLoader == true
//             //     ? WholePageLoader()
//             GestureDetector(
//           onTap: () => FocusScope.of(context).unfocus(),
//           child: SafeArea(
//             top: false,
//             bottom: false,
//             child: Scaffold(
//               backgroundColor: Colors.white,
//               body: Column(
//                 children: [
//                   SizedBox(
//                     height: context.getPadding().top,
//                   ),
//                   BackSingleText(
//                     backText: "Personal Information",
//                   ),
//                   SizedBox(
//                     height: 1.h,
//                   ),
//                   Expanded(
//                     flex: 1,
//                     child: FutureBuilder<UserDetailsModel>(
//                         future: getUserApi(
//                             model.prefService.userToken.toString(),
//                             model.userID!),
//                         builder: (context, snapshot) {
//                           if (snapshot.hasData) {
//                             return ListView.builder(
//                                 itemCount: 1,
//                                 itemBuilder: (context, index) {
//                                   //age
//                                   int index = snapshot.data!.data!.indexWhere(
//                                       (item) =>
//                                           item.metaKey.toString() == 'age');
//                                   if (index != -1) {
//                                     metaKey = snapshot
//                                         .data!.data![index].metaKey
//                                         .toString();
//                                     metaValue = snapshot
//                                         .data!.data![index].metaValue
//                                         .toString();
//                                   }
//                                   //address
//                                   int index1 = snapshot.data!.data!.indexWhere(
//                                       (item) =>
//                                           item.metaKey.toString() == 'address');
//                                   if (index1 != -1) {
//                                     metaKey1 = snapshot
//                                         .data!.data![index1].metaKey
//                                         .toString();
//                                     metaValue1 = snapshot
//                                         .data!.data![index1].metaValue
//                                         .toString();
//                                   }
//                                   //height

//                                   int index2 = snapshot.data!.data!.indexWhere(
//                                       (item) =>
//                                           item.metaKey.toString() == 'height');
//                                   if (index2 != -1) {
//                                     metaKey2 = snapshot
//                                         .data!.data![index2].metaKey
//                                         .toString();
//                                     metaValue2 = snapshot
//                                         .data!.data![index2].metaValue
//                                         .toString();
//                                   }
//                                   //weight
//                                   int index3 = snapshot.data!.data!.indexWhere(
//                                       (item) =>
//                                           item.metaKey.toString() == 'weight');
//                                   if (index3 != -1) {
//                                     metaKey3 = snapshot
//                                         .data!.data![index3].metaKey
//                                         .toString();
//                                     metaValue3 = snapshot
//                                         .data!.data![index3].metaValue
//                                         .toString();
//                                   }
//                                   return Padding(
//                                     padding: const EdgeInsets.only(
//                                         left: 20, right: 20),
//                                     child: Column(
//                                       children: [
//                                         Row(
//                                           mainAxisAlignment:
//                                               MainAxisAlignment.spaceBetween,
//                                           children: [
//                                             Column(
//                                               crossAxisAlignment:
//                                                   CrossAxisAlignment.start,
//                                               children: [
//                                                 TextWidget(
//                                                   textValue: "Full Name",
//                                                   textColor:
//                                                       ColorUtils.blackShade,
//                                                   fontFamily:
//                                                       FontUtils.interSemiBold,
//                                                   fontSize: 1.6.t,
//                                                 ),
//                                                 SizedBox(
//                                                   height: 0.75.h,
//                                                 ),
//                                                 TextWidget(
//                                                   textValue:
//                                                       model.fullname.toString(),
//                                                   // "Hussain Akhtar",
//                                                   textColor:
//                                                       ColorUtils.blackShade,
//                                                   fontFamily:
//                                                       FontUtils.interRegular,
//                                                   fontSize: 1.8.t,
//                                                 ),
//                                               ],
//                                             ),
//                                             InkWell(
//                                                 onTap: () {
//                                                   Navigator.push(
//                                                       context,
//                                                       PageTransition(
//                                                           type:
//                                                               PageTransitionType
//                                                                   .fade,
//                                                           child: Edit_Name()));
//                                                 },
//                                                 child: ForwardButtonBlack()),
//                                           ],
//                                         ),
//                                         SizedBox(
//                                           height: 1.h,
//                                         ),
//                                         Divider(
//                                           color: ColorUtils.silver,
//                                         ),
//                                         SizedBox(
//                                           height: 1.h,
//                                         ),
//                                         Row(
//                                           mainAxisAlignment:
//                                               MainAxisAlignment.spaceBetween,
//                                           children: [
//                                             Column(
//                                               crossAxisAlignment:
//                                                   CrossAxisAlignment.start,
//                                               children: [
//                                                 TextWidget(
//                                                   textValue: "Email",
//                                                   textColor:
//                                                       ColorUtils.blackShade,
//                                                   fontFamily:
//                                                       FontUtils.interSemiBold,
//                                                   fontSize: 1.6.t,
//                                                 ),
//                                                 SizedBox(
//                                                   height: 0.75.h,
//                                                 ),
//                                                 TextWidget(
//                                                   textValue: model
//                                                       .prefService.userEmail
//                                                       .toString(),
//                                                   //"hussain.ak073@gmail.com",
//                                                   textColor:
//                                                       ColorUtils.blackShade,
//                                                   fontFamily:
//                                                       FontUtils.interRegular,
//                                                   fontSize: 1.8.t,
//                                                 ),
//                                               ],
//                                             ),
//                                             // InkWell(
//                                             //     onTap: () {
//                                             //       Navigator.push(
//                                             //           context,
//                                             //           PageTransition(
//                                             //               type: PageTransitionType.fade,
//                                             //               child: Edit_Email()
//                                             //               ));
//                                             //     },
//                                             //     child: ForwardButtonBlack()),
//                                           ],
//                                         ),
//                                         SizedBox(
//                                           height: 1.h,
//                                         ),
//                                         Divider(
//                                           color: ColorUtils.silver,
//                                         ),
//                                         SizedBox(
//                                           height: 1.h,
//                                         ),
//                                         Row(
//                                           mainAxisAlignment:
//                                               MainAxisAlignment.spaceBetween,
//                                           children: [
//                                             Column(
//                                               crossAxisAlignment:
//                                                   CrossAxisAlignment.start,
//                                               children: [
//                                                 TextWidget(
//                                                   textValue: "Change Password",
//                                                   textColor:
//                                                       ColorUtils.blackShade,
//                                                   fontFamily:
//                                                       FontUtils.interSemiBold,
//                                                   fontSize: 1.6.t,
//                                                 ),
//                                               ],
//                                             ),
//                                             InkWell(
//                                                 onTap: () {
//                                                   Navigator.push(
//                                                       context,
//                                                       PageTransition(
//                                                           type:
//                                                               PageTransitionType
//                                                                   .fade,
//                                                           child:
//                                                               Edit_Password()));
//                                                 },
//                                                 child: ForwardButtonBlack()),
//                                           ],
//                                         ),
//                                         SizedBox(
//                                           height: 1.h,
//                                         ),
//                                         Divider(
//                                           color: ColorUtils.silver,
//                                         ),
//                                         SizedBox(
//                                           height: 1.h,
//                                         ),
//                                         Row(
//                                           mainAxisAlignment:
//                                               MainAxisAlignment.spaceBetween,
//                                           children: [
//                                             Column(
//                                               crossAxisAlignment:
//                                                   CrossAxisAlignment.start,
//                                               children: [
//                                                 TextWidget(
//                                                   textValue: "Phone",
//                                                   textColor:
//                                                       ColorUtils.blackShade,
//                                                   fontFamily:
//                                                       FontUtils.interSemiBold,
//                                                   fontSize: 1.6.t,
//                                                 ),
//                                                 SizedBox(
//                                                   height: 0.75.h,
//                                                 ),
//                                                 TextWidget(
//                                                   textValue:
//                                                       model.phone.toString(),
//                                                   //"+92 345 3048539",
//                                                   textColor:
//                                                       ColorUtils.blackShade,
//                                                   fontFamily:
//                                                       FontUtils.interRegular,
//                                                   fontSize: 1.8.t,
//                                                 ),
//                                               ],
//                                             ),
//                                             InkWell(
//                                                 onTap: () {
//                                                   Navigator.push(
//                                                       context,
//                                                       PageTransition(
//                                                           type:
//                                                               PageTransitionType
//                                                                   .fade,
//                                                           child:
//                                                               Edit_Number()));
//                                                 },
//                                                 child: ForwardButtonBlack()),
//                                           ],
//                                         ),
//                                         SizedBox(
//                                           height: 1.h,
//                                         ),
//                                         Divider(
//                                           color: ColorUtils.silver,
//                                         ),
//                                         SizedBox(
//                                           height: 1.h,
//                                         ),
//                                         Row(
//                                           mainAxisAlignment:
//                                               MainAxisAlignment.spaceBetween,
//                                           children: [
//                                             Column(
//                                               crossAxisAlignment:
//                                                   CrossAxisAlignment.start,
//                                               children: [
//                                                 TextWidget(
//                                                   textValue: metaKey == 'age'
//                                                       ? metaKey
//                                                       : '',
//                                                   textColor:
//                                                       ColorUtils.blackShade,
//                                                   fontFamily:
//                                                       FontUtils.interRegular,
//                                                   fontSize: 1.8.t,
//                                                 ),
//                                                 SizedBox(
//                                                   height: 0.90.h,
//                                                 ),
//                                                 TextWidget(
//                                                   textValue: metaValue!.isEmpty
//                                                       ? 'Enter age'
//                                                       : metaValue,
//                                                   textColor:
//                                                       ColorUtils.blackShade,
//                                                   fontFamily:
//                                                       FontUtils.interRegular,
//                                                   fontSize: 1.8.t,
//                                                 ),
//                                               ],
//                                             ),
//                                             InkWell(
//                                                 onTap: () {
//                                                   if (metaKey!.isEmpty) {
//                                                     model.usersMetaUpdateAge(
//                                                         context,
//                                                         model.prefService
//                                                             .userToken
//                                                             .toString(),
//                                                         'age'.toString(),
//                                                         model.userageController
//                                                             .text
//                                                             .toString(),
//                                                         model.userID!);

//                                                     Navigator.push(
//                                                         context,
//                                                         PageTransition(
//                                                             type:
//                                                                 PageTransitionType
//                                                                     .fade,
//                                                             child: Edit_Age()));
//                                                   } else {}
//                                                   Navigator.push(
//                                                       context,
//                                                       PageTransition(
//                                                           type:
//                                                               PageTransitionType
//                                                                   .fade,
//                                                           child: Edit_Age()));
//                                                 },
//                                                 child: ForwardButtonBlack()),
//                                           ],
//                                         ),
//                                         SizedBox(
//                                           height: 1.h,
//                                         ),
//                                         Divider(
//                                           color: ColorUtils.silver,
//                                         ),
//                                         SizedBox(
//                                           height: 1.h,
//                                         ),
//                                         Row(
//                                           mainAxisAlignment:
//                                               MainAxisAlignment.spaceBetween,
//                                           children: [
//                                             Column(
//                                               crossAxisAlignment:
//                                                   CrossAxisAlignment.start,
//                                               children: [
//                                                 TextWidget(
//                                                   textValue:
//                                                       metaKey1 == 'address'
//                                                           ? metaKey1
//                                                           : '',
//                                                   textColor:
//                                                       ColorUtils.blackShade,
//                                                   fontFamily:
//                                                       FontUtils.interRegular,
//                                                   fontSize: 1.8.t,
//                                                 ),
//                                                 SizedBox(
//                                                   height: 0.90.h,
//                                                 ),
//                                                 TextWidget(
//                                                   textValue: metaValue1!.isEmpty
//                                                       ? 'Enter address'
//                                                       : metaValue1,
//                                                   textColor:
//                                                       ColorUtils.blackShade,
//                                                   fontFamily:
//                                                       FontUtils.interRegular,
//                                                   fontSize: 1.8.t,
//                                                 ),
//                                               ],
//                                             ),
//                                             InkWell(
//                                                 onTap: () {
//                                                   if (metaKey1!.isEmpty) {
//                                                     model.usersMetaUpdateAge(
//                                                         context,
//                                                         model.prefService
//                                                             .userToken
//                                                             .toString(),
//                                                         'address'.toString(),
//                                                         model
//                                                             .useraddressController
//                                                             .text
//                                                             .toString(),
//                                                         model.userID!);

//                                                     Navigator.push(
//                                                         context,
//                                                         PageTransition(
//                                                             type:
//                                                                 PageTransitionType
//                                                                     .fade,
//                                                             child:
//                                                                 Edit_Address()));
//                                                   } else {}
//                                                   Navigator.push(
//                                                       context,
//                                                       PageTransition(
//                                                           type:
//                                                               PageTransitionType
//                                                                   .fade,
//                                                           child:
//                                                               Edit_Address()));
//                                                 },
//                                                 child: ForwardButtonBlack()),
//                                           ],
//                                         ),
//                                         //heiht
//                                         SizedBox(
//                                           height: 1.h,
//                                         ),
//                                         Divider(
//                                           color: ColorUtils.silver,
//                                         ),
//                                         SizedBox(
//                                           height: 1.h,
//                                         ),
//                                         Row(
//                                           mainAxisAlignment:
//                                               MainAxisAlignment.spaceBetween,
//                                           children: [
//                                             Column(
//                                               crossAxisAlignment:
//                                                   CrossAxisAlignment.start,
//                                               children: [
//                                                 TextWidget(
//                                                   textValue:
//                                                       metaKey2 == 'height'
//                                                           ? metaKey2
//                                                           : '',
//                                                   textColor:
//                                                       ColorUtils.blackShade,
//                                                   fontFamily:
//                                                       FontUtils.interRegular,
//                                                   fontSize: 1.8.t,
//                                                 ),
//                                                 SizedBox(
//                                                   height: 0.90.h,
//                                                 ),
//                                                 TextWidget(
//                                                   textValue: metaValue2!.isEmpty
//                                                       ? 'Enter height'
//                                                       : metaValue2,
//                                                   textColor:
//                                                       ColorUtils.blackShade,
//                                                   fontFamily:
//                                                       FontUtils.interRegular,
//                                                   fontSize: 1.8.t,
//                                                 ),
//                                               ],
//                                             ),
//                                             InkWell(
//                                                 onTap: () {
//                                                   if (metaKey2!.isEmpty) {
//                                                     model.usersMetaUpdateAge(
//                                                         context,
//                                                         model.prefService
//                                                             .userToken
//                                                             .toString(),
//                                                         'height'.toString(),
//                                                         model
//                                                             .userheightController
//                                                             .text
//                                                             .toString(),
//                                                         model.userID!);

//                                                     Navigator.push(
//                                                         context,
//                                                         PageTransition(
//                                                             type:
//                                                                 PageTransitionType
//                                                                     .fade,
//                                                             child:
//                                                                 Edit_Height()));
//                                                   } else {}
//                                                   Navigator.push(
//                                                       context,
//                                                       PageTransition(
//                                                           type:
//                                                               PageTransitionType
//                                                                   .fade,
//                                                           child:
//                                                               Edit_Height()));
//                                                 },
//                                                 child: ForwardButtonBlack()),
//                                           ],
//                                         ),
//                                         //weight
//                                         SizedBox(
//                                           height: 1.h,
//                                         ),
//                                         Divider(
//                                           color: ColorUtils.silver,
//                                         ),
//                                         SizedBox(
//                                           height: 1.h,
//                                         ),
//                                         Row(
//                                           mainAxisAlignment:
//                                               MainAxisAlignment.spaceBetween,
//                                           children: [
//                                             Column(
//                                               crossAxisAlignment:
//                                                   CrossAxisAlignment.start,
//                                               children: [
//                                                 TextWidget(
//                                                   textValue:
//                                                       metaKey3 == 'weight'
//                                                           ? metaKey3
//                                                           : '',
//                                                   textColor:
//                                                       ColorUtils.blackShade,
//                                                   fontFamily:
//                                                       FontUtils.interRegular,
//                                                   fontSize: 1.8.t,
//                                                 ),
//                                                 SizedBox(
//                                                   height: 0.90.h,
//                                                 ),
//                                                 TextWidget(
//                                                   textValue: metaValue3!.isEmpty
//                                                       ? 'Enter weight'
//                                                       : metaValue3,
//                                                   textColor:
//                                                       ColorUtils.blackShade,
//                                                   fontFamily:
//                                                       FontUtils.interRegular,
//                                                   fontSize: 1.8.t,
//                                                 ),
//                                               ],
//                                             ),
//                                             InkWell(
//                                                 onTap: () {
//                                                   if (metaKey3!.isEmpty) {
//                                                     model.usersMetaUpdateAge(
//                                                         context,
//                                                         model.prefService
//                                                             .userToken
//                                                             .toString(),
//                                                         'weight'.toString(),
//                                                         model
//                                                             .userweightController
//                                                             .text
//                                                             .toString(),
//                                                         model.userID!);

//                                                     Navigator.push(
//                                                         context,
//                                                         PageTransition(
//                                                             type:
//                                                                 PageTransitionType
//                                                                     .fade,
//                                                             child:
//                                                                 Edit_Weight()));
//                                                   } else {}
//                                                   Navigator.push(
//                                                       context,
//                                                       PageTransition(
//                                                           type:
//                                                               PageTransitionType
//                                                                   .fade,
//                                                           child:
//                                                               Edit_Weight()));
//                                                 },
//                                                 child: ForwardButtonBlack()),
//                                           ],
//                                         ),
//                                         SizedBox(
//                                           height: 1.h,
//                                         ),
//                                         Divider(
//                                           color: ColorUtils.silver,
//                                         ),
//                                         SizedBox(
//                                           height: 1.h,
//                                         ),
//                                       ],
//                                     ),
//                                   );
//                                 });
//                           } else {
//                             return Text('loading');
//                           }
//                         }),
//                   ),
//                 ],
//               ),
//             ),
//           ),
//         );
//       },
//     );
//   }

//   void _SelectgenderPopup(BuildContext) {
//     showModalBottomSheet(
//       isScrollControlled: true,
//       shape: RoundedRectangleBorder(
//         borderRadius: BorderRadius.only(
//           topLeft: Radius.circular(24.0),
//           topRight: Radius.circular(24.0),
//         ),
//       ),
//       backgroundColor: Colors.white,
//       context: context,
//       builder: (context) {
//         return PageHorizontalMargin(
//           widget: Container(
//             height: MediaQuery.of(context).size.height / 1.5,
//             child: Column(
//               children: [
//                 SizedBox(
//                   height: 2.h,
//                 ),
//                 Align(
//                   alignment: Alignment.centerLeft,
//                   child: TextWidget(
//                     textValue: "Select Gender",
//                     fontFamily: FontUtils.poppinsBold,
//                     fontSize: 2.2.t,
//                     textColor: ColorUtils.red,
//                   ),
//                 ),
//                 Image.asset(
//                   ImageUtils.femaleDoctor,
//                   width: 50.i,
//                   height: 50.i,
//                 ),
//                 SizedBox(
//                   height: 2.h,
//                 ),
//                 Row(
//                   children: [
//                     Expanded(flex: 4, child: Text("Male")),
//                     Expanded(
//                       flex: 1,
//                       child: RadioListTile(
//                         activeColor: ColorUtils.red,
//                         value: 0,
//                         groupValue: true,
//                         onChanged: (ind) {},
//                       ),
//                     ),
//                   ],
//                 ),
//                 Row(
//                   children: [
//                     Expanded(flex: 4, child: Text("Female")),
//                     Expanded(
//                       flex: 1,
//                       child: RadioListTile(
//                         activeColor: ColorUtils.red,
//                         value: 0,
//                         groupValue: true,
//                         onChanged: (ind) {},
//                       ),
//                     ),
//                   ],
//                 ),
//                 Row(
//                   children: [
//                     Expanded(flex: 4, child: Text("Other")),
//                     Expanded(
//                       flex: 1,
//                       child: RadioListTile(
//                         activeColor: ColorUtils.red,
//                         value: 0,
//                         groupValue: true,
//                         onChanged: (ind) {},
//                       ),
//                     ),
//                   ],
//                 ),
//                 SizedBox(
//                   height: 2.h,
//                 ),
//                 RedButton(
//                   textValue: "Confirm",
//                   onButtonPressed: () {},
//                 ),
//                 SizedBox(
//                   height: 2.h,
//                 ),
//               ],
//             ),
//           ),
//         );
//       },
//     );
//   }
// }
