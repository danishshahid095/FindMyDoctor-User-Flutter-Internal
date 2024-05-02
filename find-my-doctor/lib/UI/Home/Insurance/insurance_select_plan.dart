import 'package:find_my_doctor/App/locator.dart';
import 'package:find_my_doctor/UI/Home/Insurance/insurance_add_member_details.dart';
import 'package:find_my_doctor/Utils/color_utils.dart';
import 'package:find_my_doctor/Utils/extensions.dart';
import 'package:find_my_doctor/Utils/font_utils.dart';
import 'package:find_my_doctor/ViewModels/main_view_model.dart';
import 'package:find_my_doctor/Widgets/back_with_signleText.dart';
import 'package:find_my_doctor/Widgets/forward_button_black.dart';
import 'package:find_my_doctor/Widgets/page_horizontal_margin.dart';
import 'package:find_my_doctor/Widgets/text_widget.dart';
import 'package:find_my_doctor/Widgets/top_margin_home.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:stacked/stacked.dart';

class InsuranceSelectPlan extends StatefulWidget {
  int providerId;

  InsuranceSelectPlan({required this.providerId,Key? key}) : super(key: key);

  @override
  State<InsuranceSelectPlan> createState() => _InsuranceSelectPlanState();
}

class _InsuranceSelectPlanState extends State<InsuranceSelectPlan> {

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<MainViewModel>.reactive(
      viewModelBuilder: () => locator<MainViewModel>(),
      disposeViewModel: false,
      onViewModelReady: (model) async {
        await model.gettingInsurancePackage(context, model.token!, widget.providerId);
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
                        backText: "Insurance Plans",
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
                            textValue: "3. Select Plan",
                            fontFamily: FontUtils.poppinsSemiBold,
                            fontSize: 2.t,
                            textColor: ColorUtils.red,
                          ),
                          Expanded(
                            child: ListView.separated(
                                itemBuilder: (context, index) {
                                  return InkWell(
                                    onTap: (){
                                      Navigator.push(context,
                                          PageTransition(type: PageTransitionType.fade, child:  InsuranceAddMemberDetails(packageID: model.insurancePackageModel?[index].id ?? 0, packageAmount: model.insurancePackageModel?[index].annual_cost ?? 0,)));
                                    },
                                    child: Row(
                                      children: [
                                        Expanded(
                                          child: Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              Text(model.insurancePackageModel?[index].name ?? "",
                                                style: TextStyle(
                                                  fontFamily: FontUtils.poppinsBold,
                                                  fontSize: 1.8.t,
                                                  color: ColorUtils.red,
                                                ),
                                              ),
                                              SizedBox(
                                                height: 0.5.h,
                                              ),
                                              Text('${model.insurancePackageModel?[index].getFormattedFeaturesAsString() ?? ""}',
                                                style: TextStyle(
                                                  fontFamily: FontUtils.interRegular,
                                                  fontSize: 1.6.t,
                                                  color: ColorUtils.blackShade,
                                                ),
                                              ),
                                              SizedBox(
                                                height: 0.5.h,
                                              ),
                                              Text('${model.insurancePackageModel?[index].annual_cost ?? 0}/Annually',
                                                style: TextStyle(
                                                  fontFamily: FontUtils.interSemiBold,
                                                  fontSize: 2.t,
                                                  color: ColorUtils.lightGreen,
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
                                itemCount: model.insurancePackageModel?.length ?? 0
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
