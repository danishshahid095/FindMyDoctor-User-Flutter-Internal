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

import '../../../Utils/whole_page_loader.dart';
import '../../../Widgets/forward_button_black.dart';
import '../BookDoctor/book_a_doctor.dart';
import 'insurance_payment_method.dart';

class InsuranceAddMemberDetails extends StatefulWidget {
  int packageID;
  int packageAmount;

  InsuranceAddMemberDetails({required this.packageID,required this.packageAmount,Key? key}) : super(key: key);

  @override
  State<InsuranceAddMemberDetails> createState() => _InsuranceAddMemberDetailsState();
}


class _InsuranceAddMemberDetailsState extends State<InsuranceAddMemberDetails> {

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<MainViewModel>.reactive(
      viewModelBuilder: () => locator<MainViewModel>(),
      disposeViewModel: false,
      onViewModelReady: (model) async {
        await model.gettingBencfiy(
            context, model.prefService.userToken!.toString());
      },
      builder: (context, model, child) {

        return model.beneficryLoader == true
            ? WholePageLoader()
            : GestureDetector(
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
                        backText: "Insurance Member Details",
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
                          InkWell(
                            onTap: () {
                              model.beneficiaryIndex = -1;
                              Navigator.push(
                                  context,
                                  PageTransition(
                                      type:
                                      PageTransitionType
                                          .fade,
                                      child:
                                      PaymentMethod(packageID: widget.packageID,packageAmount: widget.packageAmount,)));
                            },
                            child: Column(
                              children: [
                                Column(
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                      MainAxisAlignment
                                          .spaceBetween,
                                      children: [
                                        TextWidget(
                                          textValue: "Self",
                                          textColor:
                                          ColorUtils.red,
                                          fontFamily: FontUtils
                                              .interBold,
                                          fontSize: 1.8.t,
                                        ),
                                        ForwardButtonBlack(),
                                        //SizedBox(width: 2.w,),
                                      ],
                                    ),
                                    // Divider(
                                    //   color: ColorUtils.silver,
                                    // ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          ListView.separated(
                              shrinkWrap: true,
                              physics:
                              NeverScrollableScrollPhysics(),
                              itemBuilder:
                                  (context, index) {
                                return Column(
                                  children: [
                                    InkWell(
                                      child: AppointmentFor(
                                        appointmentFor: model
                                            .beneficry![index]
                                            .relation
                                            .toString(),
                                        //"Self",
                                        name: model
                                            .beneficry![index]
                                            .fullname
                                            .toString(),
                                      ),
                                      onTap: (){
                                        model.beneficiaryIndex = index;
                                        Navigator.push(
                                            context,
                                            PageTransition(
                                                type:
                                                PageTransitionType
                                                    .fade,
                                                child:
                                                PaymentMethod(packageID: widget.packageID,packageAmount: widget.packageAmount,)));
                                      },
                                    ),
                                  ],
                                );
                              },
                              separatorBuilder:
                                  (context, index) {
                                return Divider(
                                  color: ColorUtils.silver,
                                );
                              },
                              itemCount:
                              model.beneficry?.length ??
                                  0),
                          Divider(
                            color: ColorUtils.silver,
                          ),
                        ],
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
