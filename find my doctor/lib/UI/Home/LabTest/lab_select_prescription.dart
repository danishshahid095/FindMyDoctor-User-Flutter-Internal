import 'package:cached_network_image/cached_network_image.dart';
import 'package:expand_tap_area/expand_tap_area.dart';
import 'package:find_my_doctor/App/locator.dart';
import 'package:find_my_doctor/UI/Home/LabTest/lab_test_prescription.dart';
import 'package:find_my_doctor/UI/Home/LabTest/search_test.dart';
import 'package:find_my_doctor/UI/Home/Pharmacy/pharmacy_test_prescription.dart';
import 'package:find_my_doctor/Utils/color_utils.dart';
import 'package:find_my_doctor/Utils/extensions.dart';
import 'package:find_my_doctor/Utils/font_utils.dart';
import 'package:find_my_doctor/Utils/image_utils.dart';
import 'package:find_my_doctor/ViewModels/main_view_model.dart';
import 'package:find_my_doctor/Widgets/forward_button_black.dart';
import 'package:find_my_doctor/Widgets/my_bottom_model_sheet.dart';
import 'package:find_my_doctor/Widgets/page_horizontal_margin.dart';
import 'package:find_my_doctor/Widgets/text_widget.dart';
import 'package:find_my_doctor/Widgets/top_margin_home.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:page_transition/page_transition.dart';
import 'package:stacked/stacked.dart';

import '../../../Utils/constants.dart';
import '../../../Utils/whole_page_loader.dart';
import 'lab_filter.dart';

class SelectPrescription extends StatefulWidget {

  int cityId;

  SelectPrescription({required this.cityId,  Key? key}) : super(key: key);

  @override
  State<SelectPrescription> createState() => _SelectPrescriptionState();
}

class _SelectPrescriptionState extends State<SelectPrescription> {

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<MainViewModel>.reactive(
      viewModelBuilder: () => locator<MainViewModel>(),
      disposeViewModel: false,
      onViewModelReady: (model) async{
        await model.gettingLabs(context, widget.cityId);
      },
      builder: (context, model, child) {
        String? _selectedItem1;

        return model.labsLoader == true ? WholePageLoader() : SafeArea(
          top: false,
          bottom: false,
          child: Scaffold(
            backgroundColor: Colors.white,
            body: PageHorizontalMargin(
              widget: Column(
                children: [
                  SizedBox(
                    height: context.getPadding().top,
                  ),
                  TopMarginHome(),
                  SizedBox(
                    height: context.getPadding().top,
                    child: Padding(
                      padding: EdgeInsets.only(left: 10),
                      child: Row(
                        children: [
                          ExpandTapWidget(
                            onTap: () {
                              Navigator.pop(context);
                            },
                            tapPadding: EdgeInsets.all(50),
                            child: SvgPicture.asset(ImageUtils.backArrowRed),
                          ),
                          Center(
                            child: Padding(
                              padding: EdgeInsets.only(left: 4.w),
                              child: TextWidget(
                                textValue: "",
                                fontFamily: FontUtils.interSemiBold,
                                fontSize: 2.t,
                                textColor: ColorUtils.red,
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 2.w,
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 1.h,
                  ),
                  Image.asset(ImageUtils.pharmacyAd),
                  SizedBox(
                    height: 3.h,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GestureDetector(
                        onTap: () {
                          //Navigator.pop(context);
                          MyBottomModelSheet.showModelSheet(
                            context,
                            MediaQuery.of(context).size.height / 1.6,
                            "Select Prescribed Tests",
                            Column(
                              children: [
                                InkWell(
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        PageTransition(
                                            type: PageTransitionType.fade,
                                            child: LabTestPrescription()));
                                  },
                                  child: Row(
                                    mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                    children: [
                                      Column(
                                        crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                        children: [
                                          TextWidget(
                                            textValue: "General Physician",
                                            textColor: ColorUtils.red,
                                            fontFamily: FontUtils.poppinsBold,
                                            fontSize: 1.8.t,
                                          ),
                                          SizedBox(
                                            height: 1.5.h,
                                          ),
                                          TextWidget(
                                            textValue: "12/06/2022",
                                            textColor: ColorUtils.blackShade,
                                            fontFamily: FontUtils.interRegular,
                                            fontSize: 1.6.t,
                                          ),
                                        ],
                                      ),
                                      Row(
                                        children: [
                                          TextWidget(
                                            textValue: "Expires in 5 day(s)",
                                            fontSize: 1.6.t,
                                            fontFamily: FontUtils.interRegular,
                                            textColor: ColorUtils.red,
                                          ),
                                          SizedBox(
                                            width: 2.w,
                                          ),
                                          ForwardButtonBlack(),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  height: 2.h,
                                ),
                                Divider(
                                  color: ColorUtils.silver,
                                ),
                                InkWell(
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        PageTransition(
                                            type: PageTransitionType.fade,
                                            child: PharmacyTestPrescription()));
                                  },
                                  child: Row(
                                    mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                    children: [
                                      Column(
                                        crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                        children: [
                                          TextWidget(
                                            textValue: "General Physician",
                                            textColor: ColorUtils.red,
                                            fontFamily: FontUtils.poppinsBold,
                                            fontSize: 1.8.t,
                                          ),
                                          SizedBox(
                                            height: 1.5.h,
                                          ),
                                          TextWidget(
                                            textValue: "08/06/2022",
                                            textColor: ColorUtils.blackShade,
                                            fontFamily: FontUtils.interRegular,
                                            fontSize: 1.6.t,
                                          ),
                                        ],
                                      ),
                                      Row(
                                        children: [
                                          TextWidget(
                                            textValue: "Expires in 1 day(s)",
                                            fontSize: 1.6.t,
                                            fontFamily: FontUtils.interRegular,
                                            textColor: ColorUtils.red,
                                          ),
                                          SizedBox(
                                            width: 2.w,
                                          ),
                                          ForwardButtonBlack(),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  height: 2.h,
                                ),
                                Divider(
                                  color: ColorUtils.silver,
                                )
                              ],
                            ),
                          );
                        },
                        child: Row(
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                border: Border.all(color: ColorUtils.red),
                              ),
                              child: Icon(
                                Icons.add,
                                size: 3.i,
                                color: ColorUtils.red,
                              ),
                            ),
                            SizedBox(
                              width: 2.w,
                            ),
                            TextWidget(
                              textValue: "Select Prescription",
                              textColor: ColorUtils.red,
                              fontFamily: FontUtils.interMedium,
                              fontSize: 1.8.t,
                            ),
                          ],
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          // Navigator.push(
                          //     context,
                          //     PageTransition(
                          //         type: PageTransitionType.fade,
                          //         child: SearchTest()
                          //         //SearchTestFilterLab()
                          //         ));
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: ColorUtils.silver1,
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: SvgPicture.asset(ImageUtils.searchIcon),
                          ),
                        ),
                      ),
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
                  // Padding(
                  //   padding:
                  //       const EdgeInsets.symmetric(horizontal: 30, vertical: 5),
                  //   child: Container(
                  //     height: 60,
                  //     width: 350,
                  //     decoration: BoxDecoration(
                  //         color: const Color.fromARGB(255, 232, 230, 230),
                  //         borderRadius: BorderRadius.circular(10)),
                  //     child: Row(
                  //       mainAxisAlignment: MainAxisAlignment.spaceAround,
                  //       children: [
                  //         DropdownButton<String>(
                  //           underline: Container(),
                  //           hint: Text('__Select City__'),
                  //           value: _selectedItem1,
                  //           onChanged: (newValue) {
                  //             setState(() {
                  //               _selectedItem1 = newValue;
                  //             });
                  //           },
                  //           items: <String>[
                  //             'Karachi',
                  //             'Lahore',
                  //             'Islamabad',
                  //           ].map<DropdownMenuItem<String>>((String value) {
                  //             return DropdownMenuItem<String>(
                  //               value: value,
                  //               child: Text(value),
                  //             );
                  //           }).toList(),
                  //         ),
                  //       ],
                  //     ),
                  //   ),
                  // ),

                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 8),
                        child: TextWidget(
                          textValue: "Choose Your Lab",
                          textColor: ColorUtils.red,
                          fontFamily: FontUtils.interBold,
                          fontSize: 1.9.t,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 2.h,
                  ),
            Expanded(
                    child: GridView.builder(
                      itemCount: model.labsModel?.length ?? 0,
                      padding: EdgeInsets.zero,
                      shrinkWrap: true,
                      primary: false,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          crossAxisSpacing: 8.0,
                          mainAxisSpacing: 8.0,
                          childAspectRatio: 1.7),
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                PageTransition(
                                    type: PageTransitionType.fade,
                                    child: AllLabFilter(labId: model.labsModel?[index].lab_id ?? 0,)
                                  //SearchTestFilterLab()
                                ));
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              shape: BoxShape.rectangle,
                              borderRadius: BorderRadius.circular(8),
                              border: Border.all(color: ColorUtils.red),
                              //color: ColorUtils.silver1,
                            ),
                            child: Padding(
                              padding: EdgeInsets.symmetric(horizontal: 0.w),
                              child: Column(
                                children: [
                                  Row(
                                    children: [
                                      Expanded(
                                         child: CachedNetworkImage(
                                           placeholder: (context, url) {
                                             return Image.asset(ImageUtils.tablets);
                                           },
                                           width: 16.i,
                                           height: 25.i,
                                           fit: BoxFit.cover,
                                           imageUrl: model.labsModel?[index].logo != null ? Constants.imageUrl + model.labsModel![index].logo! : '',
                                           errorWidget: (context, url, error) => Image.asset(ImageUtils.tablets),
                                         ),
                                      ),
                                      SizedBox(
                                        width: 1.w,
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                  SizedBox(height: 2.h,)
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}

class LabImageWidget extends StatelessWidget {
  String? img;
  LabImageWidget({super.key, this.img});

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 100,
        width: 200,
        //color: Colors.amber,
        child: Image.asset(img!));
  }
}
