import 'package:find_my_doctor/App/locator.dart';
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
import 'package:stacked/stacked.dart';

class SearchTest extends StatefulWidget {
  const SearchTest({Key? key}) : super(key: key);

  @override
  State<SearchTest> createState() => _SearchTestState();
}

class _SearchTestState extends State<SearchTest> {
  List allLabs = [
    {
      "labImage": ImageUtils.dowHospital,
      "testName": "Test ABC",
      "time": "Dow Lab | 48 hours",
      "money": "Rs. 1,500"
    },
    {
      "labImage": ImageUtils.aghaKhan,
      "testName": "Test ABC",
      "time": "AKUH Lab | 36 hours",
      "money": "Rs. 1,700"
    },
    {
      "labImage": ImageUtils.esaLab,
      "testName": "Test ABC",
      "time": "ESSA Lab | 40 hours",
      "money": "Rs. 1,100"
    },
  ];

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
      onViewModelReady: (model) {
        _isChecked = List<bool>.filled(allLabs.length, false);
      },
      builder: (context, model, child) {
        return GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: SafeArea(
            top: false,
            bottom: false,
            child: Scaffold(
              resizeToAvoidBottomInset: false,
              backgroundColor: Colors.white,
              body: Column(children: [
                SizedBox(
                  height: 5.h,
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
                                  borderSide:
                                      BorderSide(color: ColorUtils.silver1),
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
                                hintText: " Test ABC",
                                hintStyle: TextStyle(
                                    fontFamily: FontUtils.interRegular,
                                    color: ColorUtils.silver2),
                                prefixIcon: Padding(
                                  padding:
                                      EdgeInsets.symmetric(horizontal: 14.0),
                                  child: SvgPicture.asset(
                                    ImageUtils.searchIcon,
                                    height: 1.i,
                                    width: 1.i,
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 3.h,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 15),
                              child: TextWidget(
                                textValue: "Test",
                                fontFamily: FontUtils.interBold,
                                fontSize: 2.t,
                                textColor: ColorUtils.red,
                              ),
                            ),
                            SizedBox(
                              height: 3.h,
                            ),
                            //1
                            Padding(
                              padding: const EdgeInsets.only(left: 15, top: 10),
                              child: Row(
                                children: [
                                  TextWidget(
                                    textValue: "Complete Blood Count (CBC)",
                                    fontFamily: FontUtils.interRegular,
                                    fontSize: 1.t,
                                    textColor: ColorUtils.black,
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Divider(),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 15, top: 10),
                              child: Row(
                                children: [
                                  TextWidget(
                                    textValue: "Blood Glucose Test",
                                    fontFamily: FontUtils.interRegular,
                                    fontSize: 1.t,
                                    textColor: ColorUtils.black,
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Divider(),
                            ),
                            //2
                            Padding(
                              padding: const EdgeInsets.only(left: 15, top: 10),
                              child: Row(
                                children: [
                                  TextWidget(
                                    textValue: "Liver Function Tests (LFTs)",
                                    fontFamily: FontUtils.interRegular,
                                    fontSize: 1.t,
                                    textColor: ColorUtils.black,
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Divider(),
                            ),
                            //3
                            Padding(
                              padding: const EdgeInsets.only(left: 15, top: 10),
                              child: Row(
                                children: [
                                  TextWidget(
                                    textValue: "Kidney Function Tests",
                                    fontFamily: FontUtils.interRegular,
                                    fontSize: 1.t,
                                    textColor: ColorUtils.black,
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Divider(),
                            ),
                            //4
                            Padding(
                              padding: const EdgeInsets.only(left: 15, top: 10),
                              child: Row(
                                children: [
                                  TextWidget(
                                    textValue: "Thyroid Function Tests",
                                    fontFamily: FontUtils.interRegular,
                                    fontSize: 1.t,
                                    textColor: ColorUtils.black,
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Divider(),
                            )
                          ],
                        ),
                      ),
                    ),
                  ]),
                )),
                SizedBox(
                  height: 1.h,
                ),
              ]),
            ),
          ),
        );
      },
    );
  }
}
