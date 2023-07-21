import 'package:find_my_doctor/App/locator.dart';
import 'package:find_my_doctor/UI/Home/BookDoctor/select_doctor_type.dart';
import 'package:find_my_doctor/UI/Home/BookDoctor/select_specialist_category.dart';
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

class SelectConsultationType extends StatelessWidget {
  const SelectConsultationType({Key? key}) : super(key: key);

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
              body: Column(
                children: [
                  Column(
                    children: [
                      SizedBox(
                        height: context.getPadding().top,
                      ),
                      BackSingleText(
                        backText: "Select Consultation Type",
                      ),
                    ],
                  ),
                  PageHorizontalMargin(
                    widget: Column(
                      children: [
                        SizedBox(
                          height: 30.h,
                          child: ListView.separated(
                            shrinkWrap: true,
                            physics: BouncingScrollPhysics(),
                            itemBuilder: (context, index) {
                              return InkWell(
                                onTap: (){
                                    Navigator.push(context,
                                        PageTransition(type: PageTransitionType.fade,
                                            child:
                                            index==0?SelectDoctorType():
                                            SelectSpecialistCategory()
                                        ));
                                },
                                child: Row(
                                  children: [
                                    Image.asset(
                                      model.selectConsultationType[index]
                                          ["image"],
                                      width: 20.i,
                                      fit: BoxFit.cover,
                                    ),
                                    SizedBox(
                                      width: 2.w,
                                    ),
                                    Expanded(
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            model.selectConsultationType[index]
                                                ["name"],
                                            style: TextStyle(
                                              color: ColorUtils.red,
                                              fontFamily: FontUtils.poppinsBold,
                                              fontSize: 1.8.t,
                                            ),
                                          ),
                                          Text(
                                            model.selectConsultationType[index]
                                                ["description"],
                                            style: TextStyle(
                                              color: ColorUtils.blackShade,
                                              fontFamily: FontUtils.interRegular,
                                              fontSize: 1.6.t,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    SizedBox(width: 2.w,),
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
                            itemCount: model.selectConsultationType.length,
                          ),
                        ),
                      ],
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
