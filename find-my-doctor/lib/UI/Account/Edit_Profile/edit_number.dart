import 'package:find_my_doctor/App/locator.dart';
import 'package:find_my_doctor/Utils/color_utils.dart';
import 'package:find_my_doctor/Utils/extensions.dart';
import 'package:find_my_doctor/Utils/font_utils.dart';
import 'package:find_my_doctor/Utils/image_utils.dart';
import 'package:find_my_doctor/ViewModels/main_view_model.dart';
import 'package:find_my_doctor/Widgets/back_with_signleText.dart';
import 'package:find_my_doctor/Widgets/page_horizontal_margin.dart';
import 'package:find_my_doctor/Widgets/red_button.dart';
import 'package:find_my_doctor/Widgets/text_widget.dart';
import 'package:flutter/material.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:stacked/stacked.dart';

class Edit_Number extends StatefulWidget {
  const Edit_Number({Key? key}) : super(key: key);

  @override
  State<Edit_Number> createState() => _Edit_NumberState();
}

class _Edit_NumberState extends State<Edit_Number> {
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
                        backText: "Update Number",
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
                            textValue: "Update Your Number",
                            textColor: ColorUtils.red,
                            fontFamily: FontUtils.interBold,
                            fontSize: 2.4.t,
                          ),
                          SizedBox(
                            height: 2.h,
                          ),
                          IntlPhoneField(
                            decoration: InputDecoration(
                              counter: Text(''),
                              floatingLabelBehavior:
                                  FloatingLabelBehavior.never,
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8),
                                // width: 0.0 produces a thin "hairline" border
                                borderSide:
                                    BorderSide(color: ColorUtils.lightBlue),
                              ),
                              labelText: 'Phone Number',
                              border: OutlineInputBorder(
                                borderSide: BorderSide(),
                              ),
                            ),
                            initialCountryCode: 'PK',
                            onChanged: (phone) {
                              model.updatephoneController.text =
                                  phone.completeNumber;
                              //model.updatephoneController;
                              print(phone.completeNumber);
                            },
                          ),
                          SizedBox(
                            height: 25.h,
                          ),
                          RedButton(
                            textValue: "Confirm",
                            onButtonPressed: () {
                              model.usersUpdatePhone(
                                  context,
                                  model.prefService.userToken.toString(),
                                  model.fullname.toString(),
                                  // 'burhan2@gmail.com'.toString(),
                                  // '12345678902'.toString(),
                                  model.email.toString(),
                                  model.updatephoneController.text.toString(),
                                  model.userID!);

                              print(
                                  model.updatephoneController.text.toString());
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
