import 'package:cached_network_image/cached_network_image.dart';
import 'package:expand_tap_area/expand_tap_area.dart';
import 'package:find_my_doctor/App/locator.dart';
import 'package:find_my_doctor/UI/Home/LabTest/selected_tests_list.dart';
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

import '../../../Utils/constants.dart';
import '../../../Utils/whole_page_loader.dart';
import 'lab_test_book_slot.dart';

class AllLabFilter extends StatefulWidget {
  int labId;

  AllLabFilter({required this.labId,  Key? key}) : super(key: key);

  @override
  State<AllLabFilter> createState() => _AllLabFilterState();
}

class _AllLabFilterState extends State<AllLabFilter> {

  List allLabs = [
    {
      "labImage" : ImageUtils.dowHospital,
      "testName" : "Test ABC",
      "time" : "Dow Lab | 48 hours",
      "money" : "Rs. 1,500"
    },
    {
      "labImage" : ImageUtils.aghaKhan,
      "testName" : "Test ABC",
      "time" : "AKUH Lab | 36 hours",
      "money" : "Rs. 1,700"
    },
    {
      "labImage" : ImageUtils.esaLab,
      "testName" : "Test ABC",
      "time" : "ESSA Lab | 40 hours",
      "money" : "Rs. 1,100"
    },
  ];

  List<Map<String, int>> selectedTests = [];
  List<bool>? _isChecked;
  bool labSelected = false;

  @override
  void initState() {
    super.initState();
    //_isChecked = List<bool>.filled(allLabs.length, false);
  }

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<MainViewModel>.reactive(
      viewModelBuilder: () => locator<MainViewModel>(),
      disposeViewModel: false,
      onViewModelReady: (model) async{
        await model.gettingTests(context, widget.labId);
        _isChecked = List<bool>.filled(model.testsModel?.length ?? 0, false);
      },
      builder: (context, model, child) {
        return model.testsLoader == true ? WholePageLoader() : GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: SafeArea(
            top: false,
            bottom: false,
            child: Scaffold(
              resizeToAvoidBottomInset : false,
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
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            ExpandTapWidget(
                              onTap: () {
                                Navigator.pop(context);
                              },
                              tapPadding: EdgeInsets.all(50),
                              child:
                              SvgPicture.asset(ImageUtils.backArrowRed),
                            ),
                            Padding(
                              padding: EdgeInsets.only(top: 1.h),
                              child: TextWidget(
                                textValue: "Filter Lab",
                                fontFamily: FontUtils.interBold,
                                fontSize: 2.t,
                                textColor: ColorUtils.red,
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
                                TextField(
                                  style: TextStyle(color: ColorUtils.silver2),
                                  decoration: InputDecoration(
                                    fillColor: ColorUtils.silver1,
                                    filled: true,
                                    enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(color: ColorUtils.silver1),
                                      borderRadius:
                                      BorderRadius.all(Radius.circular(30.0)),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderRadius:
                                      BorderRadius.all(Radius.circular(30.0)),
                                      borderSide: BorderSide(
                                          color: ColorUtils.silver1, width: 1.5),
                                    ),
                                    labelStyle:
                                    const TextStyle(color: Color(0xFFDEDEDE)),
                                    hintText: "Search Tests",
                                    hintStyle: TextStyle(
                                        fontFamily: FontUtils.interRegular,
                                        color: ColorUtils.silver2
                                    ),
                                    prefixIcon: Padding(
                                      padding: EdgeInsets.symmetric(horizontal: 14.0),
                                      child: SvgPicture.asset(
                                        ImageUtils.searchIcon,
                                        height: 1.i,
                                        width: 1.i,
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(height: 3.h,),
                                TextWidget(
                                  textValue: "Test ABC",
                                  fontFamily: FontUtils.interBold,
                                  fontSize: 2.t,
                                  textColor: ColorUtils.red,
                                ),

                                //Labs Listview
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
                                          title: Row(
                                            children: [
                                              SizedBox(
                                                height: 20.i,
                                                  width: 20.i,
                                                  child: CachedNetworkImage(
                                                    placeholder: (context, url) {
                                                      return Image.asset(ImageUtils.tablets);
                                                    },
                                                    width: 16.i,
                                                    height: 25.i,
                                                    fit: BoxFit.cover,
                                                    imageUrl: model.testsModel?[index].lab_logo != null ? Constants.imageUrl + model.testsModel![index].lab_logo! : '',
                                                    errorWidget: (context, url, error) => Image.asset(ImageUtils.tablets),
                                                  ),
                                              ),
                                              SizedBox(width: 3.w,),
                                              Column(
                                                mainAxisAlignment: MainAxisAlignment.start,
                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                children: [
                                                  TextWidget(
                                                    textValue: model.testsModel?[index].test_name,
                                                    fontFamily: FontUtils.poppinsBold,
                                                    fontSize: 1.8.t,
                                                    textColor: ColorUtils.red,
                                                  ),
                                                  SizedBox(height: 0.5.h,),
                                                  TextWidget(
                                                    textValue: model.testsModel?[index].test_time,
                                                    fontFamily: FontUtils.interRegular,
                                                    fontSize: 1.6.t,
                                                    textColor: ColorUtils.blackShade,
                                                  ),
                                                  SizedBox(height: 0.5.h,),
                                                  TextWidget(
                                                    textValue: model.testsModel?[index].test_amount.toString(),
                                                    fontFamily: FontUtils.interSemiBold,
                                                    fontSize: 2.t,
                                                    textColor: ColorUtils.lightGreen,
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                          value: _isChecked![index],
                                          onChanged: (val) {
                                            setState(() {
                                              if (val == true) {
                                                labSelected = true;
                                                selectedTests.add({"id": model.testsModel![index].test_id ?? 0});
                                                _isChecked![index] = val!;
                                              } else {
                                                selectedTests.removeWhere(
                                                        (element) => element["id"] == model.testsModel![index].test_id);
                                                _isChecked![index] = val!;
                                              }
                                            });
                                          },

                                        );
                                      },
                                      separatorBuilder: (context, index) {
                                        return
                                          Divider(
                                            color: ColorUtils.silver,
                                          );
                                      },
                                      itemCount: model.testsModel?.length ?? 0
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ]),
                    )),

                // Button
                PageHorizontalMargin(
                  widget: Container(
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
                        color: labSelected == false ? ColorUtils.white1 : ColorUtils.red,
                      ),
                      child: MaterialButton(
                        padding: EdgeInsets.zero,
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                        onPressed: (){

                          print(selectedTests);
                          Navigator.push(context,
                              PageTransition(type: PageTransitionType.fade, child: LabTestBookSlot(selectedTests: selectedTests,labId: widget.labId,)));
                            //  PageTransition(type: PageTransitionType.fade, child: SelectedTestsList()));
                        },
                        child: Text(
                          "Continue",
                          style: TextStyle(
                              fontFamily: FontUtils.interSemiBold,
                              fontSize: 1.8.t,
                              color: ColorUtils.white),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 1.h,),

              ]),
            ),
          ),
        );
      },
    );
  }
}
