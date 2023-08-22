import 'package:cached_network_image/cached_network_image.dart';
import 'package:expand_tap_area/expand_tap_area.dart';
import 'package:find_my_doctor/App/locator.dart';
import 'package:find_my_doctor/UI/Home/BookDoctor/physical_visit_book_slot.dart';
import 'package:find_my_doctor/Utils/color_utils.dart';
import 'package:find_my_doctor/Utils/extensions.dart';
import 'package:find_my_doctor/Utils/font_utils.dart';
import 'package:find_my_doctor/Utils/image_utils.dart';
import 'package:find_my_doctor/ViewModels/main_view_model.dart';
import 'package:find_my_doctor/Widgets/my_bottom_model_sheet.dart';
import 'package:find_my_doctor/Widgets/page_horizontal_margin.dart';
import 'package:find_my_doctor/Widgets/text_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:page_transition/page_transition.dart';
import 'package:stacked/stacked.dart';

import '../../../Utils/constants.dart';
import '../../../Utils/whole_page_loader.dart';
import 'online_visit_book_slot.dart';

class SelectDoctor extends StatefulWidget {
  int categoryId;

  SelectDoctor({required this.categoryId, Key? key}) : super(key: key);

  @override
  State<SelectDoctor> createState() => _SelectDoctorState();
}

class _SelectDoctorState extends State<SelectDoctor> {
  var start_time = '';
  String? end_time = '';
  String _parseTime(String? timeString) {
    if (timeString == null || timeString.isEmpty) {
      return "0:00";
    }

    return timeString;
  }

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<MainViewModel>.reactive(
      viewModelBuilder: () => locator<MainViewModel>(),
      disposeViewModel: false,
      onViewModelReady: (model) async {
        await model.getOnlineDoctorDetails(context, widget.categoryId as int);
      },
      builder: (context, model, child) {
        return model.onlineDoctorLoader == true
            ? WholePageLoader()
            : GestureDetector(
                onTap: () => FocusScope.of(context).unfocus(),
                child: SafeArea(
                  top: false,
                  bottom: false,
                  child: Scaffold(
                    backgroundColor: Colors.white,
                    body: SingleChildScrollView(
                      child: Column(
                        children: [
                          Column(
                            children: [
                              SizedBox(
                                height: context.getPadding().top,
                              ),
                              Container(
                                height: 10.h,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.grey.withOpacity(0.5),
                                      spreadRadius: 3,
                                      blurRadius: 7,
                                      offset: Offset(
                                          0, 3), // changes position of shadow
                                    ),
                                  ],
                                ),
                                child: Padding(
                                  padding: EdgeInsets.only(
                                      left: 3.w, top: 2.h, right: 3.w),
                                  child: Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Row(
                                        children: [
                                          ExpandTapWidget(
                                            onTap: () {
                                              Navigator.pop(context);
                                            },
                                            tapPadding: EdgeInsets.all(50),
                                            child: SvgPicture.asset(
                                                ImageUtils.backArrowRed),
                                          ),
                                          SizedBox(
                                            width: 3.w,
                                          ),
                                          TextWidget(
                                            textValue: "Select Doctor",
                                            fontFamily: FontUtils.interBold,
                                            fontSize: 2.t,
                                            textColor: ColorUtils.red,
                                          ),
                                        ],
                                      ),
                                      InkWell(
                                          onTap: () {
                                            MyBottomModelSheet.showModelSheet(
                                              context,
                                              MediaQuery.of(context)
                                                      .size
                                                      .height /
                                                  1.25,
                                              "Sort Doctors",
                                              SortDoctors(),
                                            );
                                          },
                                          child: SvgPicture.asset(
                                              ImageUtils.menuIcon)),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                          PageHorizontalMargin(
                            widget: Column(
                              children: [
                                SizedBox(
                                  child: ListView.separated(
                                    shrinkWrap: true,
                                    physics: BouncingScrollPhysics(),
                                    itemBuilder: (context, index) {
                                      return InkWell(
                                        onTap: () {
                                          // if (model.onlineDoctorModel != null &&
                                          //     index >= 0 &&
                                          //     index <
                                          //         model.onlineDoctorModel!
                                          //             .length) {
                                          //   Navigator.push(
                                          //     context,
                                          //     PageTransition(
                                          //       type: PageTransitionType.fade,
                                          //       child: OnlineVisitBookSlot(
                                          //         start_time: parseTime(model
                                          //             .onlineDoctorModel![index]
                                          //             .start_time).isEmpty?'0:00': parseTime(model
                                          //             .onlineDoctorModel![index]
                                          //             .start_time),
                                          //         end_time: parseTime(model
                                          //             .onlineDoctorModel![index]
                                          //             .end_time).isEmpty?'0':parseTime(model
                                          //             .onlineDoctorModel![index]
                                          //             .end_time),
                                          //         id: model.userID,
                                          //       ),
                                          //     ),
                                          //   );
                                          // } else {
                                          //   print("Invalid index: $index");
                                          // }
                                          Navigator.push(
                                              context,
                                              PageTransition(
                                                  type: PageTransitionType.fade,
                                                  child: OnlineVisitBookSlot(
                                                      start_time: model
                                                              .onlineDoctorModel?[
                                                                  index]
                                                              .start_time
                                                              .toString() ??
                                                          "0",
                                                      end_time: model
                                                              .onlineDoctorModel?[
                                                                  index]
                                                              .end_time
                                                              .toString() ??
                                                          "0",
                                                      id: model.userID)));
                                        },
                                        child: Row(
                                          children: [
                                            // Image.asset(
                                            //   model.doctorDetails[index]
                                            //   ["image"],
                                            //   width: 20.i,
                                            //   fit: BoxFit.cover,
                                            // ),
                                            CachedNetworkImage(
                                                placeholder: (context, url) {
                                                  return Image.asset(
                                                      ImageUtils.stetescope);
                                                },
                                                width: 20.i,
                                                height: 20.i,
                                                //height: MediaQuery.of(context).size.height / 3,
                                                fit: BoxFit.cover,
                                                imageUrl: Constants.imageUrl +
                                                    model
                                                        .onlineDoctorModel![
                                                            index]
                                                        .image!,
                                                errorWidget: (context, url,
                                                        error) =>
                                                    Image.asset(
                                                        ImageUtils.stetescope)),
                                            SizedBox(
                                              width: 3.w,
                                            ),
                                            Expanded(
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  // Text(
                                                  //   model
                                                  //           .onlineDoctorModel![
                                                  //               index]
                                                  //           .start_time
                                                  //           .toString()
                                                  //           .isEmpty
                                                  //       ? '0:00'
                                                  //       : model
                                                  //           .onlineDoctorModel![
                                                  //               index]
                                                  //           .start_time
                                                  //           .toString(),
                                                  // ),
                                                  // Text(
                                                  //   model
                                                  //           .onlineDoctorModel![
                                                  //               index]
                                                  //           .end_time
                                                  //           .toString()
                                                  //           .isEmpty
                                                  //       ? '0:00'
                                                  //       : model
                                                  //           .onlineDoctorModel![
                                                  //               index]
                                                  //           .end_time
                                                  //           .toString(),
                                                  // ),
                                                  Text(
                                                    model
                                                            .onlineDoctorModel?[
                                                                index]
                                                            .fullName
                                                            .toString() ??
                                                        '',
                                                    style: TextStyle(
                                                      color: ColorUtils.red,
                                                      fontFamily:
                                                          FontUtils.poppinsBold,
                                                      fontSize: 1.8.t,
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    height: 0.75.h,
                                                  ),
                                                  Row(
                                                    children: [
                                                      Expanded(
                                                        child: Text(
                                                          model
                                                                  .onlineDoctorModel?[
                                                                      index]
                                                                  .qualification ??
                                                              '',
                                                          style: TextStyle(
                                                            color: ColorUtils
                                                                .blackShade,
                                                            fontFamily: FontUtils
                                                                .interRegular,
                                                            fontSize: 1.6.t,
                                                          ),
                                                        ),
                                                      ),
                                                      Text(
                                                        ' | ',
                                                        style: TextStyle(
                                                          color: ColorUtils
                                                              .blackShade,
                                                          fontFamily: FontUtils
                                                              .interRegular,
                                                          fontSize: 1.6.t,
                                                        ),
                                                      ),
                                                      Text(
                                                        model
                                                                .onlineDoctorModel?[
                                                                    index]
                                                                .experience ??
                                                            '',
                                                        style: TextStyle(
                                                          color: ColorUtils
                                                              .blackShade,
                                                          fontFamily: FontUtils
                                                              .interRegular,
                                                          fontSize: 1.6.t,
                                                        ),
                                                      ),
                                                      Text(
                                                        ' Years Experience',
                                                        style: TextStyle(
                                                          color: ColorUtils
                                                              .blackShade,
                                                          fontFamily: FontUtils
                                                              .interRegular,
                                                          fontSize: 1.6.t,
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ],
                                              ),
                                            ),
                                            SizedBox(
                                              width: 2.w,
                                            ),
                                            Row(
                                              children: [
                                                Text(
                                                  'Rs. ',
                                                  style: TextStyle(
                                                    color:
                                                        ColorUtils.lightGreen,
                                                    fontFamily:
                                                        FontUtils.interSemiBold,
                                                    fontSize: 2.t,
                                                  ),
                                                ),
                                                Text(
                                                  model
                                                          .onlineDoctorModel?[
                                                              index]
                                                          .fee
                                                          .toString() ??
                                                      "0",
                                                  style: TextStyle(
                                                    color:
                                                        ColorUtils.lightGreen,
                                                    fontFamily:
                                                        FontUtils.interSemiBold,
                                                    fontSize: 2.t,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      );
                                    },
                                    separatorBuilder: (context, index) {
                                      return Divider(
                                        color: ColorUtils.silver,
                                      );
                                    },
                                    itemCount:
                                        model.onlineDoctorModel?.length ?? 0,
                                  ),
                                ),
                              ],
                            ),
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

class SortDoctors extends StatefulWidget {
  const SortDoctors({Key? key}) : super(key: key);

  @override
  State<SortDoctors> createState() => _SortDoctorsState();
}

class _SortDoctorsState extends State<SortDoctors> {
  int? value;

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<MainViewModel>.reactive(
      viewModelBuilder: () => locator<MainViewModel>(),
      disposeViewModel: false,
      onModelReady: (model) {},
      builder: (context, model, child) {
        return SizedBox(
          height: 35.h,
          child: ListView.separated(
            physics: NeverScrollableScrollPhysics(),
            padding: EdgeInsets.zero,
            itemBuilder: (context, index) {
              return Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    flex: 4,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        TextWidget(
                          textValue: model.sortDoctors[index],
                          fontFamily: FontUtils.interSemiBold,
                          fontSize: 1.6.t,
                          textColor: ColorUtils.blackShade,
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: RadioListTile(
                        activeColor: ColorUtils.red,
                        value: index,
                        groupValue: value,
                        onChanged: (ind) {
                          model.pharmacyPaymentMethodSelected = true;
                          model.notifyListeners();
                          return setState(() => value = ind as int?);
                        }),
                  ),
                ],
              );
            },
            itemCount: model.sortDoctors.length,
            separatorBuilder: (BuildContext context, int index) {
              return Divider(
                color: ColorUtils.silver,
              );
            },
          ),
        );
      },
    );
  }
}
