import 'package:find_my_doctor/App/locator.dart';
import 'package:find_my_doctor/Utils/color_utils.dart';
import 'package:find_my_doctor/Utils/extensions.dart';
import 'package:find_my_doctor/Utils/font_utils.dart';
import 'package:find_my_doctor/Utils/image_utils.dart';
import 'package:find_my_doctor/ViewModels/main_view_model.dart';
import 'package:find_my_doctor/Widgets/back_with_signleText.dart';
import 'package:find_my_doctor/Widgets/page_horizontal_margin.dart';
import 'package:find_my_doctor/Widgets/text_widget.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';



class Terms_Conditions extends StatefulWidget {
  const Terms_Conditions({Key? key}) : super(key: key);

  @override
  State<Terms_Conditions> createState() => _Terms_ConditionsState();
}

class _Terms_ConditionsState extends State<Terms_Conditions> {
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
                      BackSingleText(
                        backText: "Terms & Conditions",
                      ),
                      SizedBox(height: 1.h,),
                    ],
                  ),
                  Expanded(
                    child: SingleChildScrollView(
                      child: PageHorizontalMargin(
                          widget: Column(
                            children: [
                              Image.asset(
                                ImageUtils.doctorVerification,
                                width: 60.i,
                                height: 60.i,
                              ),
                              TextWidget(
                                textValue: "Find My Doctor FAQs",
                                textColor: ColorUtils.red,
                                fontFamily: FontUtils.interBold,
                                fontSize: 2.4.t,
                              ),
                              ExpansionTile(
                                title: Container(
                                  child: TextWidget(
                                    textValue: "What is Find My Doctor’s return policy?",
                                    textColor: ColorUtils.black,
                                    fontFamily: FontUtils.interRegular,
                                    fontSize: 1.6.t,
                                  ),
                                ),
                                children: [

                                  Padding(
                                    padding: EdgeInsets.only(left: 15 , right: 15  , bottom: 10),
                                    child: TextWidget(
                                      textValue: "FindMyDoctor is a healthcare startup that aims to give consumers control over all aspects of their healthcare ecosystem. We currently offer Insurance Products, Lab Tests, Scheduled and Urgent Home Doctor Visits, and Pharmacy Delivery (in under 100 minutes). We are constantly innovating and increasing our service offering.",
                                      textColor: ColorUtils.black,
                                      fontFamily: FontUtils.interRegular,
                                      fontSize: 1.6.t,
                                    ),
                                  ),

                                ],
                              ),
                              ExpansionTile(
                                title: Container(
                                  child: TextWidget(
                                    textValue: "How can I return the item?",
                                    textColor: ColorUtils.black,
                                    fontFamily: FontUtils.interRegular,
                                    fontSize: 1.6.t,
                                  ),
                                ),
                                children: [

                                  Padding(
                                    padding: EdgeInsets.only(left: 15 , right: 15 , bottom: 10),
                                    child: TextWidget(
                                      textValue: "FindMyDoctor is a healthcare startup that aims to give consumers control over all aspects of their healthcare ecosystem. We currently offer Insurance Products, Lab Tests, Scheduled and Urgent Home Doctor Visits, and Pharmacy Delivery (in under 100 minutes). We are constantly innovating and increasing our service offering.",
                                      textColor: ColorUtils.black,
                                      fontFamily: FontUtils.interRegular,
                                      fontSize: 1.6.t,
                                    ),
                                  ),

                                ],
                              ),
                              ExpansionTile(
                                title: Container(
                                  child: TextWidget(
                                    textValue: "Shipping Policy",
                                    textColor: ColorUtils.black,
                                    fontFamily: FontUtils.interRegular,
                                    fontSize: 1.6.t,
                                  ),
                                ),
                                children: [

                                  Padding(
                                    padding: EdgeInsets.only(left: 15 , right: 15 , bottom: 10),
                                    child: TextWidget(
                                      textValue: "FindMyDoctor is a healthcare startup that aims to give consumers control over all aspects of their healthcare ecosystem. We currently offer Insurance Products, Lab Tests, Scheduled and Urgent Home Doctor Visits, and Pharmacy Delivery (in under 100 minutes). We are constantly innovating and increasing our service offering.",
                                      textColor: ColorUtils.black,
                                      fontFamily: FontUtils.interRegular,
                                      fontSize: 1.6.t,
                                    ),
                                  ),

                                ],
                              ),
                            ],
                          )
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
