import 'package:find_my_doctor/App/locator.dart';
import 'package:find_my_doctor/Utils/color_utils.dart';
import 'package:find_my_doctor/Utils/extensions.dart';
import 'package:find_my_doctor/Utils/font_utils.dart';
import 'package:find_my_doctor/ViewModels/main_view_model.dart';
import 'package:find_my_doctor/Widgets/back_with_signleText.dart';
import 'package:find_my_doctor/Widgets/text_widget.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:stacked/stacked.dart';

import '../../../Utils/whole_page_loader.dart';
import '../LabTest/lab_select_prescription.dart';

class SelectCityPharmacy extends StatefulWidget {
  const SelectCityPharmacy({Key? key}) : super(key: key);

  @override
  State<SelectCityPharmacy> createState() => _SelectCityPharmacyState();
}

class _SelectCityPharmacyState extends State<SelectCityPharmacy> {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<MainViewModel>.reactive(
      viewModelBuilder: () => locator<MainViewModel>(),
      disposeViewModel: false,
      onViewModelReady: (model) async {
        await model.gettingPharmacyCity(context);
      },
      builder: (context, model, child) {
        return model.pharmacyCityLoader
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
                      BackSingleText(
                        backText: "Select City",
                      ),
                      // MarginBelowAppBar(),
                    ],
                  ),
                  Expanded(
                    child: ListView.builder(
                      itemCount: model.pharmacyCityModel?.length ?? 0,
                      itemBuilder: (context, index) {
                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(height: 1.h),
                            GestureDetector(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  PageTransition(
                                    type: PageTransitionType.fade,
                                    child: SelectPrescription(cityId: model.pharmacyCityModel?[index].id ?? 0,),
                                  ),
                                );
                              },
                              child: Padding(
                                padding: const EdgeInsets.only(left: 8.0),
                                child: TextWidget(
                                  textValue:
                                  model.pharmacyCityModel?[index].name,
                                  fontFamily: FontUtils.interRegular,
                                  fontSize: 1.8.t,
                                  textColor: ColorUtils.blackShade,
                                ),
                              ),
                            ),
                            SizedBox(height: 1.h),
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
        );
      },
    );
  }
}

