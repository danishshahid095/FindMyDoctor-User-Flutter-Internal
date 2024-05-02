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

class SearchTestFilterLab extends StatefulWidget {
  const SearchTestFilterLab({Key? key}) : super(key: key);

  @override
  State<SearchTestFilterLab> createState() => _SearchTestFilterLabState();
}

class _SearchTestFilterLabState extends State<SearchTestFilterLab> {

  List filteredLabTestOnly = [
    {
      "labImage" : ImageUtils.dowHospital,
      "labName" : "Dow Lab"
    },
    {
      "labImage" : ImageUtils.aghaKhan,
      "labName" : "AKUH Lab"
    },
    {
      "labImage" : ImageUtils.esaLab,
      "labName" : "ESSA Lab"
    },
  ];


  bool filterTapped = false;
  List<bool>? _isChecked;
  bool labSelected = false;
  final myController = TextEditingController();


  @override
  void initState() {
    super.initState();
    _isChecked = List<bool>.filled(filteredLabTestOnly.length, false);
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
              resizeToAvoidBottomInset : false,
              backgroundColor: Colors.white,
              body: Column(
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
                              offset: Offset(0, 3), // changes position of shadow
                            ),
                          ],
                        ),
                        child: Padding(
                          padding: EdgeInsets.only(left: 6.w, top: 2.h, right: 6.w),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              ExpandTapWidget(
                                onTap: (){
                                  Navigator.pop(context);
                                },
                                tapPadding: EdgeInsets.all(50),
                                child:SvgPicture.asset(ImageUtils.backArrowRed),
                              ),
                              GestureDetector(
                                onTap: (){
                                  setState(() {
                                    filterTapped = true;
                                  });
                                },
                                child:
                                filterTapped == false ?
                                TextWidget(
                                  textValue: "Filter Lab",
                                  fontFamily: FontUtils.interSemiBold,
                                  fontSize: 2.t,
                                  textColor: ColorUtils.red,
                                ) : Container(),
                              ),
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                  Expanded(
                    child: PageHorizontalMargin(
                      widget: Column(
                        children: [
                          TopMarginHome(),
                          if(filterTapped == false)
                          TextField(
                            onChanged: (value){
                              if(value.length > 0){
                                // Navigator.push(context,
                                //     PageTransition(type: PageTransitionType.fade, child: AllLabFilter()));
                              }
                            },
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
                          if(filterTapped == true)
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
                                hintText: "Search Lab",
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
                          if (filterTapped == false)
                            Column(
                              children: [
                                SizedBox(height: 6.h,),
                                Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Image.asset(ImageUtils.femaleDoctor,
                                      width: 60.i,
                                      height: 60.i,
                                    ),
                                    TextWidget(
                                      textValue: "No tests selected",
                                      fontSize: 1.8.t,
                                      fontFamily: FontUtils.interSemiBold,
                                      textColor: ColorUtils.blackShade,
                                    ),
                                  ],
                                ),
                              ],
                            ),

                          if (filterTapped == true)
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
                                              child: Image.asset(filteredLabTestOnly[index]["labImage"])),
                                          SizedBox(width: 3.w,),
                                          TextWidget(
                                            textValue: filteredLabTestOnly[index]["labName"],
                                            fontFamily: FontUtils.poppinsBold,
                                            fontSize: 1.8.t,
                                            textColor: ColorUtils.red,
                                          ),
                                        ],
                                      ),
                                      value: _isChecked![index],
                                      onChanged: (val) {
                                        setState(
                                              () {
                                            labSelected = true;
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
                                  itemCount: filteredLabTestOnly.length
                              ),
                            ),
                        ],
                      ),
                    ),
                  ),
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
                            Navigator.push(context,
                                PageTransition(type: PageTransitionType.fade, child: SelectedTestsList()));
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
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
