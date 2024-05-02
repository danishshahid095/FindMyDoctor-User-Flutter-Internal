import 'package:find_my_doctor/App/locator.dart';
import 'package:find_my_doctor/Utils/color_utils.dart';
import 'package:find_my_doctor/Utils/extensions.dart';
import 'package:find_my_doctor/Utils/font_utils.dart';
import 'package:find_my_doctor/ViewModels/main_view_model.dart';
import 'package:find_my_doctor/Widgets/back_with_signleText.dart';
import 'package:find_my_doctor/Widgets/forward_button_black.dart';
import 'package:find_my_doctor/Widgets/page_horizontal_margin.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:stacked/stacked.dart';

import 'insurance_select_provider.dart';

class InsuranceMainScreen extends StatelessWidget {
  const InsuranceMainScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<MainViewModel>.reactive(
      viewModelBuilder: () => locator<MainViewModel>(),
      disposeViewModel: false,
      onModelReady: (model) {
      },
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
                        backText: "Insurance/ Takaful",
                      ),
                      SizedBox(height: 1.h,),
                    ],
                  ),
                  Expanded(
                    child: PageHorizontalMargin(
                      widget: ListView.separated(
                          itemBuilder: (context, index) {
                            return InkWell(
                              onTap: (){
                                Navigator.push(context,
                                    PageTransition(type: PageTransitionType.fade, child: InsuranceSelectProvider()));
                              },
                              child: Row(
                                children: [
                                  Image.asset(model.allInsurance[index]["image"],
                                    width: 20.i,
                                    height: 20.i,
                                  ),
                                  SizedBox(width: 3.w,),
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text(model.allInsurance[index]["title"],
                                          style: TextStyle(
                                            fontFamily: FontUtils.poppinsBold,
                                            fontSize: 1.8.t,
                                            color: ColorUtils.red,
                                          ),
                                        ),
                                        SizedBox(
                                          height: 0.5.h,
                                        ),
                                        Text(model.allInsurance[index]["description"],
                                          style: TextStyle(
                                            fontFamily: FontUtils.interRegular,
                                            fontSize: 1.6.t,
                                            color: ColorUtils.blackShade,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  ForwardButtonBlack(),
                                ],
                              ),
                            );
                          },
                          separatorBuilder: (context, index) {
                            return Divider(
                              color: ColorUtils.silver,
                            );
                          },
                          itemCount: model.allInsurance.length
                      ),
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
}
