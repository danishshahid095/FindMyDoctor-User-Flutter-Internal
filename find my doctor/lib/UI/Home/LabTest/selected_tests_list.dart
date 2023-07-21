import 'package:expand_tap_area/expand_tap_area.dart';
import 'package:find_my_doctor/App/locator.dart';
import 'package:find_my_doctor/UI/Home/LabTest/lab_test_book_slot.dart';
import 'package:find_my_doctor/Utils/color_utils.dart';
import 'package:find_my_doctor/Utils/extensions.dart';
import 'package:find_my_doctor/Utils/font_utils.dart';
import 'package:find_my_doctor/Utils/image_utils.dart';
import 'package:find_my_doctor/ViewModels/main_view_model.dart';
import 'package:find_my_doctor/Widgets/button_with_border.dart';
import 'package:find_my_doctor/Widgets/my_bottom_model_sheet.dart';
import 'package:find_my_doctor/Widgets/page_horizontal_margin.dart';
import 'package:find_my_doctor/Widgets/red_button.dart';
import 'package:find_my_doctor/Widgets/text_widget.dart';
import 'package:find_my_doctor/Widgets/top_margin_home.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:page_transition/page_transition.dart';
import 'package:stacked/stacked.dart';

class SelectedTestsList extends StatelessWidget {
  const SelectedTestsList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<MainViewModel>.reactive(
      viewModelBuilder: () => locator<MainViewModel>(),
      disposeViewModel: false,
      onModelReady: (model) {},
      builder: (context, model, child) {
        return SafeArea(
          top: false,
          bottom: false,
          child: Scaffold(
            backgroundColor: Colors.white,
            body: Column(
              children: [
                Expanded(
                  child: PageHorizontalMargin(
                    widget: Column(
                      children: [
                        SizedBox(
                          height: context.getPadding().top,
                        ),
                        TopMarginHome(),
                        SizedBox(
                          height: context.getPadding().top,
                          child:  Padding(
                            padding: EdgeInsets.only(left: 10),
                            child: Row(
                              children: [
                                ExpandTapWidget(
                                  onTap: (){
                                    Navigator.pop(context);
                                  },
                                  tapPadding: EdgeInsets.all(50),
                                  child:SvgPicture.asset(ImageUtils.backArrowRed),
                                ),
                                Center(
                                  child: Padding(
                                    padding:EdgeInsets.only(left: 4.w),
                                    child:  TextWidget(
                                      textValue: "",
                                      fontFamily: FontUtils.interSemiBold,
                                      fontSize: 2.t,
                                      textColor: ColorUtils.red,
                                    ),
                                  ),
                                ),
                                SizedBox(width: 2.w,),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(height: 2.h,),
                        Image.asset(ImageUtils.pharmacyAd),
                        SizedBox(height: 3.h,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Container(
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    border: Border.all(color: ColorUtils.red),
                                  ),
                                  child: Icon(Icons.add,
                                    size: 3.i,
                                    color: ColorUtils.red,
                                  ),
                                ),
                                SizedBox(width: 2.w,),
                                TextWidget(
                                  textValue: "Select Prescription",
                                  textColor: ColorUtils.red,
                                  fontFamily: FontUtils.interMedium,
                                  fontSize: 1.8.t,
                                ),
                              ],
                            ),
                            Container(
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: ColorUtils.silver1,
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: SvgPicture.asset(ImageUtils.searchIcon),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 3.h,),
                        Divider(
                          color: ColorUtils.silver,
                        ),
                        SizedBox(height: 3.h,),
                        SizedBox(
                          height: 25.h,
                          child: ListView.separated(
                            padding: EdgeInsets.zero,
                              itemBuilder: (context, index) {
                                return Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      children: [
                                        SizedBox(
                                            height: 15.i,
                                            width: 15.i,
                                            child: Image.asset(model.selectedTestsList[index]["testLabImage"])),
                                        SizedBox(width: 2.w,),
                                        Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            TextWidget(
                                              textValue: model.selectedTestsList[index]["name"],
                                              fontFamily: FontUtils.poppinsBold,
                                              fontSize: 1.8.t,
                                              textColor: ColorUtils.red,
                                            ),
                                            SizedBox(height: 0.5.h,),
                                            TextWidget(
                                              textValue: model.selectedTestsList[index]["labDetails"],
                                              fontFamily: FontUtils.interRegular,
                                              fontSize: 1.6.t,
                                              textColor: ColorUtils.blackShade,
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        TextWidget(
                                          textValue: model.selectedTestsList[index]["charges"],
                                          fontFamily: FontUtils.interSemiBold,
                                          fontSize: 2.t,
                                          textColor: ColorUtils.lightGreen,
                                        ),
                                        SizedBox(width: 2.w,),
                                        GestureDetector(
                                            onTap: (){
                                              //Navigator.pop(context);
                                              MyBottomModelSheet.showModelSheet(context,
                                                MediaQuery.of(context).size.height/1.6,
                                                "Remove Test",
                                                Column(
                                                  children: [
                                                    RichText(
                                                      text: TextSpan(
                                                        children: [
                                                          TextSpan(
                                                            text: "Are you sure you want to remove ",
                                                            style: TextStyle(
                                                              fontFamily: FontUtils.interRegular,
                                                              fontSize: 1.8.t,
                                                              color: ColorUtils.blackShade,
                                                            ),
                                                          ),
                                                          TextSpan(
                                                            text:  'Test ABC?',
                                                            style: TextStyle(
                                                              fontFamily: FontUtils.interBold,
                                                              fontSize: 1.6.t,
                                                              color: ColorUtils.blackShade,
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                    SizedBox(height: 2.h,),
                                                    RedButton(
                                                      textValue: "Yes, Remove",
                                                      onButtonPressed: (){
                                                        Navigator.pop(context);
                                                      },
                                                    ),
                                                    SizedBox(height: 2.h,),
                                                    ButtonWithBorder(
                                                      textValue: "Cancel",
                                                      borderColor: ColorUtils.red,
                                                      buttonTextColor: ColorUtils.red,
                                                      onButtonPressed: (){
                                                        Navigator.pop(context);
                                                      },
                                                    ),
                                                    SizedBox(height: 2.h,),
                                                  ],
                                                ),
                                              );
                                            },
                                          child: Icon(Icons.cancel_outlined,
                                            color: ColorUtils.red,
                                          ),
                                        )
                                      ],
                                    ),
                                  ],
                                );
                              },
                              separatorBuilder: (context, index) {
                                return Divider(
                                  color: ColorUtils.silver,
                                );
                              },
                              itemCount: model.selectedTestsList.length,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                PageHorizontalMargin(
                  widget: RedButton(
                    textValue: "Select Date & Time",
                    onButtonPressed: (){
                      Navigator.push(context,
                          PageTransition(type: PageTransitionType.fade, child: LabTestBookSlot()));
                    },
                  ),
                ),
                SizedBox(height: 2.h,),
              ],
            ),
          ),
        );
      },
    );
  }
}
