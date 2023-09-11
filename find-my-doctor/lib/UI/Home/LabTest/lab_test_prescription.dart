import 'package:expand_tap_area/expand_tap_area.dart';
import 'package:find_my_doctor/App/locator.dart';
import 'package:find_my_doctor/UI/Home/LabTest/lab_filter.dart';
import 'package:find_my_doctor/Utils/color_utils.dart';
import 'package:find_my_doctor/Utils/extensions.dart';
import 'package:find_my_doctor/Utils/font_utils.dart';
import 'package:find_my_doctor/Utils/image_utils.dart';
import 'package:find_my_doctor/ViewModels/main_view_model.dart';
import 'package:find_my_doctor/Widgets/page_horizontal_margin.dart';
import 'package:find_my_doctor/Widgets/text_widget.dart';
import 'package:find_my_doctor/Widgets/top_margin_home.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:page_transition/page_transition.dart';
import 'package:stacked/stacked.dart';

class LabTestPrescription extends StatefulWidget {
  const LabTestPrescription({Key? key}) : super(key: key);

  @override
  State<LabTestPrescription> createState() => _LabTestPrescriptionState();
}

class _LabTestPrescriptionState extends State<LabTestPrescription> {

  List labTestValues = [
    {
      "testName" : "Test ABC",
      "time" : "Average Time: 36-48 hours",
    },
    {
      "testName" : "Test ABC",
      "time" : "Average Time: 36-48 hours",
    },
    {
      "testName" : "Test ABC",
      "time" : "Average Time: 36-48 hours",
    },
  ];

  List<bool>? _isChecked;
  bool allTestsSelected = false;
  bool testSelected = false;

  @override
  void initState() {
    super.initState();
    _isChecked = List<bool>.filled(labTestValues.length, false);
  }

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
              body: Column(children: [
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
                            offset: Offset(0, 3), // changes position of shadow
                          ),
                        ],
                      ),
                      child: Padding(
                        padding: EdgeInsets.only(left: 3.w, top: 2.h, right: 3.w),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            ExpandTapWidget(
                              onTap: () {
                                Navigator.pop(context);
                              },
                              tapPadding: EdgeInsets.all(50),
                              child:
                              SvgPicture.asset(ImageUtils.backArrowRed),
                            ),
                            SizedBox(
                              width: 4.w,
                            ),
                            Padding(
                              padding: EdgeInsets.only(top: 1.h),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  TextWidget(
                                    textValue: "Test Prescription - General Physician",
                                    fontFamily: FontUtils.interBold,
                                    fontSize: 2.t,
                                    textColor: ColorUtils.red,
                                  ),
                                  SizedBox(height: 1.h,),
                                  TextWidget(
                                    textValue: "Mon, 12 June 2022 • 02:30 pm",
                                    fontFamily: FontUtils.interRegular,
                                    fontSize: 1.6.t,
                                    textColor: ColorUtils.blackShade,
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                Expanded(
                    child: SingleChildScrollView(
                      child: Column(children: [
                        TopMarginHome(),
                        Align(
                          alignment: Alignment.centerLeft,
                          child: PageHorizontalMargin(
                            widget: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [

                                // Booking Details
                                TextWidget(
                                  textValue: "Booking Details",
                                  fontFamily: FontUtils.interBold,
                                  fontSize: 2.t,
                                  textColor: ColorUtils.red,
                                ),
                                SizedBox(height: 2.h,),
                                TextWidget(
                                  textValue: "Doctor",
                                  fontFamily: FontUtils.interSemiBold,
                                  fontSize: 1.6.t,
                                  textColor: ColorUtils.blackShade,
                                ),
                                SizedBox(height: 0.5.h,),
                                TextWidget(
                                  textValue: "Dr. M. Sumair Nawaz",
                                  fontFamily: FontUtils.interRegular,
                                  fontSize: 1.8.t,
                                  textColor: ColorUtils.blackShade,
                                ),
                                SizedBox(height: 1.h,),
                                Divider(
                                  color: ColorUtils.silver,
                                ),
                                SizedBox(height: 2.h,),

                                TextWidget(
                                  textValue: "Paitient",
                                  fontFamily: FontUtils.interSemiBold,
                                  fontSize: 1.6.t,
                                  textColor: ColorUtils.blackShade,
                                ),
                                SizedBox(height: 0.5.h,),
                                TextWidget(
                                  textValue: "Farah Hussain • Spouse",
                                  fontFamily: FontUtils.interRegular,
                                  fontSize: 1.8.t,
                                  textColor: ColorUtils.blackShade,
                                ),
                                SizedBox(height: 1.h,),
                                Divider(
                                  color: ColorUtils.silver,
                                ),
                                SizedBox(height: 2.h,),

                                // Prescribed Tests
                                TextWidget(
                                  textValue: "Prescribed Test(s)",
                                  fontFamily: FontUtils.interBold,
                                  fontSize: 2.t,
                                  textColor: ColorUtils.red,
                                ),
                                SizedBox(height: 2.h,),
                                SizedBox(
                                  height: 36.h,
                                  child: ListView.separated(
                                      physics: NeverScrollableScrollPhysics(),
                                      padding: EdgeInsets.zero,
                                      itemBuilder: (context, index) {
                                        return  CheckboxListTile(
                                          activeColor: ColorUtils.red,
                                          contentPadding: EdgeInsets.zero,
                                          controlAffinity: ListTileControlAffinity.leading,
                                          title: Column(
                                            mainAxisAlignment: MainAxisAlignment.start,
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              TextWidget(
                                                textValue: labTestValues[index]["testName"],
                                                fontFamily: FontUtils.poppinsBold,
                                                fontSize: 1.8.t,
                                                textColor: ColorUtils.red,
                                              ),
                                              SizedBox(height: 0.5.h,),
                                              TextWidget(
                                                textValue: labTestValues[index]["time"],
                                                fontFamily: FontUtils.interRegular,
                                                fontSize: 1.6.t,
                                                textColor: ColorUtils.blackShade,
                                              )
                                            ],
                                          ),
                                          value: _isChecked![index],
                                          onChanged: (val) {
                                            setState(
                                                  () {
                                                    testSelected = true;
                                                _isChecked![index] = val!;
                                              },
                                            );
                                          },
                                        );
                                      },
                                      separatorBuilder: (context, index) {
                                        return
                                          Divider(
                                            color: ColorUtils.silver,
                                          );
                                      },
                                      itemCount: labTestValues.length
                                  ),
                                ),

                                // Course Days
                                SizedBox(height: 1.5.h,),
                                Row(
                                  children: [
                                    Checkbox(
                                      activeColor: ColorUtils.red,
                                      value: this.allTestsSelected,
                                      onChanged: (bool? value) {
                                        setState(() {
                                          this.allTestsSelected = value!;
                                        });
                                      },
                                    ),
                                    TextWidget(
                                      textValue: "Select all prescribed tests",
                                      fontFamily: FontUtils.interSemiBold,
                                      fontSize: 1.8.t,
                                      textColor: ColorUtils.blackShade,
                                    ),
                                  ],
                                ),

                                // Search Tests Button
                                SizedBox(height: 1.5.h,),
                                Container(
                                  decoration: const BoxDecoration(
                                    shape: BoxShape.rectangle,
                                    borderRadius: BorderRadius.all(Radius.circular(8)),
                                  ),
                                  child: AnimatedContainer(
                                    duration: const Duration(milliseconds: 400),
                                    width: MediaQuery.of(context).size.width / 1,
                                    height: 6.35.h,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(8),
                                      color: testSelected == false ? ColorUtils.white1 : ColorUtils.red,
                                    ),
                                    child: MaterialButton(
                                      padding: EdgeInsets.zero,
                                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                                      onPressed: (){
                                        // Navigator.push(context,
                                        //     PageTransition(type: PageTransitionType.fade, child:  AllLabFilter(labId: model.labsModel?[index].id ?? 0,)));
                                      },
                                      child: Text(
                                        "Search Tests",
                                        style: TextStyle(
                                            fontFamily: FontUtils.interSemiBold,
                                            fontSize: 1.8.t,
                                            color: ColorUtils.white),
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(height: 1.h,),
                              ],
                            ),
                          ),
                        ),
                      ]),
                    ))
              ]),
            ),
          ),
        );
      },
    );
  }
}
