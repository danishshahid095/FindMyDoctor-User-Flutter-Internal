import 'package:cached_network_image/cached_network_image.dart';
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

import '../../../Utils/constants.dart';
import '../../../Utils/whole_page_loader.dart';

class InsuranceSelectProvider extends StatefulWidget {
  const InsuranceSelectProvider({Key? key}) : super(key: key);

  @override
  State<InsuranceSelectProvider> createState() => _InsuranceSelectProviderState();
}

class _InsuranceSelectProviderState extends State<InsuranceSelectProvider> {

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<MainViewModel>.reactive(
      viewModelBuilder: () => locator<MainViewModel>(),
      disposeViewModel: false,
      onViewModelReady: (model) async {
        await model.gettingInsuranceProvider(context, model.token!);
      },
      builder: (context, model, child) {
        return model.insuranceProviderLoader
            ? WholePageLoader()
            : GestureDetector(
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
                                    textValue: "Insurance Provider",
                                    fontFamily: FontUtils.interSemiBold,
                                    fontSize: 2.t,
                                    textColor: ColorUtils.red,
                                  ),
                                ],
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
                          // SizedBox(height: 1.h,),
                          Expanded(
                            child: ListView.separated(
                                itemBuilder: (context, index) {
                                  return InkWell(
                                    onTap: (){
                                      Navigator.push(context,
                                          PageTransition(type: PageTransitionType.fade, child: InsuranceSelectPlan(providerId: model.insuranceProviderModel?[index].id ?? 0,)));
                                    },
                                    child: Row(
                                      children: [
                                        CachedNetworkImage(
                                          placeholder: (context, url) {
                                            return Image.asset(ImageUtils.tablets);
                                          },
                                          width: 20.i,
                                          height: 20.i,
                                          fit: BoxFit.cover,
                                          imageUrl: model.insuranceProviderModel?[index].logo != null ? Constants.imageUrl + model.insuranceProviderModel![index].logo! : '',
                                          errorWidget: (context, url, error) => Image.asset(ImageUtils.tablets),
                                        ),
                                        SizedBox(width: 3.w,),
                                        Expanded(
                                          child: Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              Text(model.insuranceProviderModel?[index].fullname ?? "",
                                                style: TextStyle(
                                                  fontFamily: FontUtils.poppinsBold,
                                                  fontSize: 1.8.t,
                                                  color: ColorUtils.red,
                                                ),
                                              ),
                                              SizedBox(
                                                height: 0.5.h,
                                              ),
                                              Text("Insurance",
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
                                itemCount: model.insuranceProviderModel?.length ?? 0
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

