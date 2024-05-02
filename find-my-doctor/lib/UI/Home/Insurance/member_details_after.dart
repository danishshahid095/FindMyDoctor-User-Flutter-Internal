import 'package:find_my_doctor/App/locator.dart';
import 'package:find_my_doctor/Utils/color_utils.dart';
import 'package:find_my_doctor/Utils/extensions.dart';
import 'package:find_my_doctor/Utils/font_utils.dart';
import 'package:find_my_doctor/Utils/image_utils.dart';
import 'package:find_my_doctor/ViewModels/main_view_model.dart';
import 'package:find_my_doctor/Widgets/back_with_signleText.dart';
import 'package:find_my_doctor/Widgets/page_horizontal_margin.dart';
import 'package:find_my_doctor/Widgets/red_button.dart';
import 'package:find_my_doctor/Widgets/text_widget.dart';
import 'package:find_my_doctor/Widgets/top_margin_home.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:stacked/stacked.dart';

class MemberDetailsAfter extends StatelessWidget {
  const MemberDetailsAfter({Key? key}) : super(key: key);

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
                          SizedBox(height: 1.h,),
                          Divider(
                            color: ColorUtils.silver,
                          ),
                          SizedBox(height: 1.h,),
                          GestureDetector(
                            onTap: (){
                            },
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
                                  ImageUtils.arrowDownward,
                                ),
                              ],
                            ),
                          ),
                          SizedBox(height: 2.h,),
                          Expanded(
                            child: ListView.separated(
                              padding: EdgeInsets.zero,
                                itemBuilder: (context, index) {
                                  return PageHorizontalMargin(
                                    widget: Row(
                                      children: [
                                        Expanded(
                                          child: Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              Text(model.insuranceMembers[index]["relation"],
                                                style: TextStyle(
                                                  fontFamily: FontUtils.poppinsBold,
                                                  fontSize: 1.8.t,
                                                  color: ColorUtils.red,
                                                ),
                                              ),
                                              SizedBox(
                                                height: 0.5.h,
                                              ),
                                              Text(model.insuranceMembers[index]["name"],
                                                style: TextStyle(
                                                  fontFamily: FontUtils.interRegular,
                                                  fontSize: 1.6.t,
                                                  color: ColorUtils.blackShade,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        Icon(Icons.cancel_outlined,
                                        color: ColorUtils.red,
                                        )
                                      ],
                                    ),
                                  );
                                },
                                separatorBuilder: (context, index) {
                                  return Column(
                                    children: [
                                      Divider(
                                        color: ColorUtils.silver,
                                      ),
                                      SizedBox(height: 1.h,),
                                    ],
                                  );
                                },
                                itemCount: model.insuranceMembers.length
                            ),
                          ),
                          SizedBox(height: 2.h,),
                        ],
                      ),
                    ),
                  ),
                  PageHorizontalMargin(
                    widget: RedButton(
                      textValue: "Continue",
                      onButtonPressed: (){
                        // Navigator.push(context,
                        //     PageTransition(type: PageTransitionType.fade, child:  PaymentMethod()));
                      },
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
