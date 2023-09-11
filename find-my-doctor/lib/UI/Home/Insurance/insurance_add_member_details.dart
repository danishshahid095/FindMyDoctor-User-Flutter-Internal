import 'package:find_my_doctor/App/locator.dart';
import 'package:find_my_doctor/UI/Home/Insurance/coverage_details.dart';

import 'package:find_my_doctor/UI/Home/Insurance/select_members.dart';
import 'package:find_my_doctor/Utils/color_utils.dart';
import 'package:find_my_doctor/Utils/extensions.dart';
import 'package:find_my_doctor/Utils/font_utils.dart';
import 'package:find_my_doctor/Utils/image_utils.dart';
import 'package:find_my_doctor/ViewModels/main_view_model.dart';
import 'package:find_my_doctor/Widgets/back_with_signleText.dart';
import 'package:find_my_doctor/Widgets/page_horizontal_margin.dart';
import 'package:find_my_doctor/Widgets/text_widget.dart';
import 'package:find_my_doctor/Widgets/top_margin_home.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:page_transition/page_transition.dart';
import 'package:stacked/stacked.dart';

class InsuranceAddMemberDetails extends StatelessWidget {
  const InsuranceAddMemberDetails({Key? key}) : super(key: key);

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
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    children: [
                      SizedBox(
                        height: context.getPadding().top,
                      ),
                      BackSingleText(
                        backText: "Insurance Market Place (4/5)",
                      ),
                      SizedBox(height: 1.h,),
                    ],
                  ),
                  Expanded(
                    child: PageHorizontalMargin(
                      widget: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          TopMarginHome(),
                          TextWidget(
                            textValue: "4. Add Member Details",
                            fontFamily: FontUtils.poppinsSemiBold,
                            fontSize: 2.t,
                            textColor: ColorUtils.red,
                          ),
                          SizedBox(height: 2.h,),
                          TextWidget(
                            textValue: "Basic Plan",
                            fontFamily: FontUtils.poppinsBold,
                            fontSize: 1.8.t,
                            textColor: ColorUtils.red,
                          ),
                          SizedBox(height: 2.h,),
                          TextWidget(
                            textValue: "PKR. 100,000/Annual",
                            fontFamily: FontUtils.interSemiBold,
                            fontSize: 2.t,
                            textColor: ColorUtils.lightGreen,
                          ),
                          SizedBox(height: 2.h,),
                          GestureDetector(
                            onTap: (){
                              Navigator.push(context,
                                  PageTransition(type: PageTransitionType.fade, child:  CoverageDetails()));
                            },
                            child: Container(
                              padding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 2.h),
                              decoration: BoxDecoration(
                                shape: BoxShape.rectangle,
                                border: Border.all(color: ColorUtils.black.withOpacity(0.5), width: 1),
                                borderRadius: BorderRadius.circular(10)
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  TextWidget(
                                    textValue: "Coverage Details",
                                    fontFamily: FontUtils.poppinsSemiBold,
                                    fontSize: 1.6.t,
                                    textColor: ColorUtils.black1,
                                  ),
                                  SvgPicture.asset(
                                    ImageUtils.forwardIcon,
                                  ),
                                ],
                              ),
                            ),
                          ),
                          SizedBox(height: 2.h,),
                          GestureDetector(
                            onTap: (){
                              Navigator.push(context,
                                  PageTransition(type: PageTransitionType.fade, child:  SelectMembers()));
                            },
                            child: TextWidget(
                              textValue: "+ Add Members",
                              fontFamily: FontUtils.interSemiBold,
                              fontSize: 1.8.t,
                              textColor: ColorUtils.red,
                            ),
                          ),
                          SizedBox(height: 2.h,),
                          Divider(
                            color: ColorUtils.silver,
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
                          color: ColorUtils.white1,
                        ),
                        child: MaterialButton(
                          padding: EdgeInsets.zero,
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                          onPressed: (){},
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
                  SizedBox(height: 1.h,)
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
