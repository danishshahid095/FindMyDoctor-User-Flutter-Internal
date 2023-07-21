import 'package:expand_tap_area/expand_tap_area.dart';
import 'package:find_my_doctor/App/locator.dart';
import 'package:find_my_doctor/UI/Home/Insurance/insurance_select_plan.dart';
import 'package:find_my_doctor/Utils/color_utils.dart';
import 'package:find_my_doctor/Utils/extensions.dart';
import 'package:find_my_doctor/Utils/font_utils.dart';
import 'package:find_my_doctor/Utils/image_utils.dart';
import 'package:find_my_doctor/ViewModels/main_view_model.dart';
import 'package:find_my_doctor/Widgets/forward_button_black.dart';
import 'package:find_my_doctor/Widgets/page_horizontal_margin.dart';
import 'package:find_my_doctor/Widgets/text_widget.dart';
import 'package:find_my_doctor/Widgets/top_margin_home.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:page_transition/page_transition.dart';
import 'package:stacked/stacked.dart';

class InsuranceSelectProvider extends StatelessWidget {
  const InsuranceSelectProvider({Key? key}) : super(key: key);

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
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  ExpandTapWidget(
                                    onTap: (){
                                      Navigator.pop(context);
                                    },
                                    tapPadding: EdgeInsets.all(50),
                                    child:SvgPicture.asset(ImageUtils.backArrowRed),
                                  ),
                                  SizedBox(width: 4.w,),
                                  TextWidget(
                                    textValue: "Insurance Market Place (2/5)",
                                    fontFamily: FontUtils.interSemiBold,
                                    fontSize: 2.t,
                                    textColor: ColorUtils.red,
                                  ),
                                ],
                              ),
                              InkWell(
                                onTap: (){
                                  showModalBottomSheet(
                                    isScrollControlled: true,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(24.0),
                                        topRight: Radius.circular(24.0),
                                      ),
                                    ),
                                    backgroundColor: Colors.white, context: context, builder: (BuildContext context) {
                                    return PageHorizontalMargin(
                                      widget: Container(
                                        height: MediaQuery.of(context).size.height/3,
                                        child: Column(
                                          children: [
                                            SizedBox(height: 2.h,),
                                            SvgPicture.asset(ImageUtils.greyHandle),
                                            SizedBox(height: 1.h,),
                                            Align(
                                              alignment: Alignment.centerLeft,
                                              child: TextWidget(
                                                textValue: "Filter Provider Type",
                                                fontFamily: FontUtils.poppinsBold,
                                                fontSize: 2.4.t,
                                                textColor: ColorUtils.red,
                                              ),
                                            ),
                                            SizedBox(height: 2.h,),
                                            ProviderType(),
                                          ],
                                        ),
                                      ),
                                    );
                                  },
                                  );
                                },
                                child: TextWidget(
                                  textValue: "Filter Type",
                                  fontFamily: FontUtils.interSemiBold,
                                  fontSize: 2.t,
                                  textColor: ColorUtils.red,
                                ),
                              ),
                            ],
                          ),
                        ),
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
                            textValue: "2. Select Provider",
                            fontFamily: FontUtils.poppinsSemiBold,
                            fontSize: 2.t,
                            textColor: ColorUtils.red,
                          ),
                          SizedBox(height: 2.h,),
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
                              hintText: "Search Provider",
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
                          Expanded(
                            child: ListView.separated(
                                itemBuilder: (context, index) {
                                  return InkWell(
                                    onTap: (){
                                      Navigator.push(context,
                                          PageTransition(type: PageTransitionType.fade, child: InsuranceSelectPlan()));
                                    },
                                    child: Row(
                                      children: [
                                        Image.asset(model.insuranceSelectProvide[index]["image"],
                                          width: 20.i,
                                          height: 20.i,
                                        ),
                                        SizedBox(width: 3.w,),
                                        Expanded(
                                          child: Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              Text(model.insuranceSelectProvide[index]["title"],
                                                style: TextStyle(
                                                  fontFamily: FontUtils.poppinsBold,
                                                  fontSize: 1.8.t,
                                                  color: ColorUtils.red,
                                                ),
                                              ),
                                              SizedBox(
                                                height: 0.5.h,
                                              ),
                                              Text(model.insuranceSelectProvide[index]["description"],
                                                style: TextStyle(
                                                  fontFamily: FontUtils.interRegular,
                                                  fontSize: 1.6.t,
                                                  color: ColorUtils.blackShade,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        ForwardButtonBlack()
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
                                itemCount: model.insuranceSelectProvide.length
                            ),
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

class ProviderType extends StatefulWidget {
  const ProviderType({Key? key}) : super(key: key);

  @override
  State<ProviderType> createState() => _ProviderTypeState();
}

class _ProviderTypeState extends State<ProviderType> {

  int? value;

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<MainViewModel>.reactive(
      viewModelBuilder: () => locator<MainViewModel>(),
      disposeViewModel: false,
      onModelReady: (model) {
      },
      builder: (context, model, child) {
        return Expanded(
          child: ListView.separated(
            itemBuilder: (context, index) {
              return Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    flex: 4,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        TextWidget(
                          textValue: model.providerType[index],
                          fontFamily: FontUtils.interRegular,
                          fontSize: 1.8.t,
                          textColor: ColorUtils.blackShade,
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: RadioListTile(
                      activeColor: ColorUtils.red,
                      value: index,
                      groupValue: value,
                      onChanged: (ind) => setState(() => value = ind as int?),
                    ),
                  ),
                ],
              );
            },
            itemCount: model.providerType.length,
            separatorBuilder: (BuildContext context, int index) {
              return Divider(
                color: ColorUtils.silver,
              );
            },
          ),
        );
      },
    );
  }
}

