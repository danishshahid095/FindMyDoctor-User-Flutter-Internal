import 'package:find_my_doctor/App/locator.dart';
import 'package:find_my_doctor/UI/Account/add_new_beneficiary_form.dart';
import 'package:find_my_doctor/Utils/color_utils.dart';
import 'package:find_my_doctor/Utils/extensions.dart';
import 'package:find_my_doctor/Utils/font_utils.dart';
import 'package:find_my_doctor/Utils/image_utils.dart';
import 'package:find_my_doctor/ViewModels/main_view_model.dart';
import 'package:find_my_doctor/Widgets/back_with_signleText.dart';
import 'package:find_my_doctor/Widgets/page_horizontal_margin.dart';
import 'package:find_my_doctor/Widgets/text_widget.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:stacked/stacked.dart';



class Add_Beneficiaries extends StatefulWidget {
  const Add_Beneficiaries({Key? key}) : super(key: key);

  @override
  State<Add_Beneficiaries> createState() => _Add_BeneficiariesState();
}

class _Add_BeneficiariesState extends State<Add_Beneficiaries> {
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
                        backText: "Beneficiaries",
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
                                ImageUtils.femaleDoctor,
                                width: 60.i,
                                height: 60.i,
                              ),
                              SizedBox(
                                height: 2.h,
                              ),
                              Row(
                                children: [
                                  GestureDetector(
                                    onTap: (){
                                      Navigator.push(context,
                                          PageTransition(type: PageTransitionType.fade, child:  Add_Beneficary_Form()));
                                    },
                                    child: TextWidget(
                                      textValue: "+ Add New Beneficiary",
                                      fontFamily: FontUtils.interSemiBold,
                                      fontSize: 1.8.t,
                                      textColor: ColorUtils.red,
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
