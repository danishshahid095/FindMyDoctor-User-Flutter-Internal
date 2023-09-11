import 'package:find_my_doctor/App/locator.dart';
import 'package:find_my_doctor/UI/Home/BookDoctor/enter_address.dart';
import 'package:find_my_doctor/Utils/color_utils.dart';
import 'package:find_my_doctor/Utils/extensions.dart';
import 'package:find_my_doctor/Utils/font_utils.dart';
import 'package:find_my_doctor/Utils/image_utils.dart';
import 'package:find_my_doctor/ViewModels/main_view_model.dart';
import 'package:find_my_doctor/Widgets/back_with_signleText.dart';
import 'package:find_my_doctor/Widgets/margin_below_appbar.dart';
import 'package:find_my_doctor/Widgets/page_horizontal_margin.dart';
import 'package:find_my_doctor/Widgets/text_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:page_transition/page_transition.dart';
import 'package:stacked/stacked.dart';

class SelectCity extends StatelessWidget {
  const SelectCity({Key? key}) : super(key: key);

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
                        backText: "Select City",
                      ),
                      MarginBelowAppBar(),
                    ],
                  ),
                  Expanded(
                    child: SingleChildScrollView(
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
                                hintText: "Search your city",
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
                              textValue: "Sindh",
                              fontFamily: FontUtils.interSemiBold,
                              fontSize: 2.t,
                              textColor: ColorUtils.red,
                            ),
                            SizedBox(height: 1.h,),

                            SizedBox(
                              height: 20.h,
                              child: ListView.builder(
                                itemCount: model.selectCitySindh.length,
                                  itemBuilder: (context, index) {
                                    return Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        SizedBox(height: 2.h,),
                                        GestureDetector(
                                          onTap: (){
                                            Navigator.push(context,
                                                PageTransition(type: PageTransitionType.fade, child:  EnterAddress()));
                                          },
                                          child: TextWidget(
                                            textValue: model.selectCitySindh[index],
                                            fontFamily: FontUtils.interRegular,
                                            fontSize: 1.8.t,
                                            textColor: ColorUtils.blackShade,
                                          ),
                                        ),
                                        SizedBox(height: 2.h,),
                                        Divider(
                                          color: ColorUtils.silver,
                                        ),
                                      ],
                                    );
                                  },
                              ),
                            ),

                            SizedBox(height: 3.h,),
                            TextWidget(
                              textValue: "Punjab",
                              fontFamily: FontUtils.interSemiBold,
                              fontSize: 2.t,
                              textColor: ColorUtils.red,
                            ),
                            SizedBox(height: 1.h,),

                            SizedBox(
                              height: 20.h,
                              child: ListView.builder(
                                itemCount: model.selectCityPunjab.length,
                                itemBuilder: (context, index) {
                                  return Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      SizedBox(height: 2.h,),
                                      GestureDetector(
                                      onTap: (){
                                            Navigator.push(context,
                                                PageTransition(type: PageTransitionType.fade, child:  EnterAddress()));
                                          },
                                        child: TextWidget(
                                          textValue: model.selectCityPunjab[index],
                                          fontFamily: FontUtils.interRegular,
                                          fontSize: 1.8.t,
                                          textColor: ColorUtils.blackShade,
                                        ),
                                      ),
                                      SizedBox(height: 2.h,),
                                      Divider(
                                        color: ColorUtils.silver,
                                      ),
                                    ],
                                  );
                                },
                              ),
                            ),


                          ],
                        ),
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

