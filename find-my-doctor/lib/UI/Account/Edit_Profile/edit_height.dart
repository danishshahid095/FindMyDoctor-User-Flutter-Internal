import 'package:find_my_doctor/App/locator.dart';
import 'package:find_my_doctor/Utils/color_utils.dart';
import 'package:find_my_doctor/Utils/extensions.dart';
import 'package:find_my_doctor/Utils/font_utils.dart';
import 'package:find_my_doctor/Utils/image_utils.dart';
import 'package:find_my_doctor/ViewModels/main_view_model.dart';
import 'package:find_my_doctor/Widgets/back_with_signleText.dart';
import 'package:find_my_doctor/Widgets/custom_text_field.dart';
import 'package:find_my_doctor/Widgets/page_horizontal_margin.dart';
import 'package:find_my_doctor/Widgets/red_button.dart';
import 'package:find_my_doctor/Widgets/text_widget.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

class Edit_Height extends StatefulWidget {
  const Edit_Height({Key? key}) : super(key: key);

  @override
  State<Edit_Height> createState() => _Edit_HeightState();
}

class _Edit_HeightState extends State<Edit_Height> {
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
                        backText: "Update Height",
                      ),
                      SizedBox(
                        height: 1.h,
                      ),
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
                          TextWidget(
                            textValue: "Update Your  Height",
                            textColor: ColorUtils.red,
                            fontFamily: FontUtils.interBold,
                            fontSize: 2.4.t,
                          ),
                          SizedBox(
                            height: 2.h,
                          ),
                          CustomTextField(
                            controller: model.userheightController,
                            hintText: "Enter Updated Height",
                          ),
                          SizedBox(
                            height: 30.h,
                          ),
                          RedButton(
                            textValue: "Confirm",
                            onButtonPressed: () {
                              model.doUseMetaHeight(
                                  context,
                                  model.prefService.userToken.toString(),
                                  'height'.toString(),
                                  model.userheightController.text.toString(),
                                  model.userID!);
                              model.usersMetaUpdateHeight(
                                  context,
                                  model.prefService.userToken.toString(),
                                  'height'.toString(),
                                  model.userheightController.text.toString(),
                                  model.userID!);
                              Navigator.pop(context);
                              // Navigator.push(context,
                              //     PageTransition(type: PageTransitionType.fade, child: ()));
                            },
                          ),
                        ],
                      )),
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
