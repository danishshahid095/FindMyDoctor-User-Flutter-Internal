import 'package:expand_tap_area/expand_tap_area.dart';
import 'package:find_my_doctor/App/locator.dart';
import 'package:find_my_doctor/Utils/color_utils.dart';
import 'package:find_my_doctor/Utils/extensions.dart';
import 'package:find_my_doctor/Utils/font_utils.dart';
import 'package:find_my_doctor/Utils/image_utils.dart';
import 'package:find_my_doctor/ViewModels/main_view_model.dart';
import 'package:find_my_doctor/Widgets/button_with_border.dart';
import 'package:find_my_doctor/Widgets/page_horizontal_margin.dart';
import 'package:find_my_doctor/Widgets/red_button.dart';
import 'package:find_my_doctor/Widgets/text_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:stacked/stacked.dart';

class Accept_Appointment_Detail extends StatefulWidget {
  const Accept_Appointment_Detail({Key? key}) : super(key: key);

  @override
  State<Accept_Appointment_Detail> createState() => _Accept_Appointment_DetailState();
}

class _Accept_Appointment_DetailState extends State<Accept_Appointment_Detail> {
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
                  Container(
                    decoration: BoxDecoration(
                      color: ColorUtils.white,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey,
                          offset: Offset(0.0, 1.0), //(x,y)
                          blurRadius: 6.0,
                        ),
                      ],
                    ),
                    child: Column(
                      children: [
                        SizedBox(
                          height: context.getPadding().top,
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 6.w, top: 2.h),
                          child: Row(
                            children: [
                              ExpandTapWidget(
                                onTap: (){
                                  Navigator.pop(context);
                                },
                                tapPadding: EdgeInsets.all(50),
                                child:SvgPicture.asset(ImageUtils.backArrowRed),
                              ),
                              Padding(
                                padding:EdgeInsets.only(left: 4.w),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    TextWidget(
                                      textValue: "Farah Hussain • Spouse",
                                      fontFamily: FontUtils.interSemiBold,
                                      fontSize: 2.t,
                                      textColor: ColorUtils.red,
                                    ),
                                    SizedBox(height: 1.h,),
                                    TextWidget(
                                      textValue: "Tue, 29 Nov 2022 • 02:30 pm",
                                      fontFamily: FontUtils.interRegular,
                                      fontSize: 1.6.t,
                                      textColor: ColorUtils.black,
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(width: 2.w,),
                            ],
                          ),
                        ),
                        SizedBox(height: 1.h,),
                      ],
                    ),
                  ),
                  PageHorizontalMargin(
                    widget: Padding(
                      padding: EdgeInsets.only(top: 2.h ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          TextWidget(
                            textValue: "Details",
                            fontFamily: FontUtils.interSemiBold,
                            fontSize: 1.9.t,
                            textColor: ColorUtils.red,
                          ),
                          SizedBox(height: 1.h,),

                          TextWidget(
                            textValue: "It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using 'Content here, content here', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for 'lorem ipsum' will uncover many web sites still in their infancy. Various versions have evolved.",
                            fontFamily: FontUtils.interRegular,
                            fontSize: 1.7.t,
                            textColor: ColorUtils.black,
                          ),
                          SizedBox(height: 1.h,),
                          SizedBox(height: 35.h,),
                          RedButton(
                            textValue: "Done",
                            onButtonPressed: (){
                            },
                          ),
                          SizedBox(height: 2.h,),
                          ButtonWithBorder(
                            textValue: "Edit Detail",
                            onButtonPressed: (){
                            },
                            borderColor: ColorUtils.red,
                            buttonTextColor: ColorUtils.red,
                          ),
                        ],
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
