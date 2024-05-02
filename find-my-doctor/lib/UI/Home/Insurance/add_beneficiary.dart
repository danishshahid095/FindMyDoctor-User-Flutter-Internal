import 'package:find_my_doctor/App/locator.dart';
import 'package:find_my_doctor/Utils/color_utils.dart';
import 'package:find_my_doctor/Utils/extensions.dart';
import 'package:find_my_doctor/Utils/image_utils.dart';
import 'package:find_my_doctor/ViewModels/main_view_model.dart';
import 'package:find_my_doctor/Widgets/back_with_signleText.dart';
import 'package:find_my_doctor/Widgets/custom_text_field.dart';
import 'package:find_my_doctor/Widgets/page_horizontal_margin.dart';
import 'package:find_my_doctor/Widgets/top_margin_home.dart';
import 'package:flutter/material.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:stacked/stacked.dart';

import '../../../Utils/font_utils.dart';
import '../../../Utils/widget_loader.dart';

class AddNewBeneficiary extends StatefulWidget {
  const AddNewBeneficiary({Key? key}) : super(key: key);

  @override
  State<AddNewBeneficiary> createState() => _AddNewBeneficiaryState();
}

class _AddNewBeneficiaryState extends State<AddNewBeneficiary> {
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
                        backText: "Add New Beneficiary",
                      ),
                      SizedBox(height: 1.h,),
                    ],
                  ),
                  Expanded(
                    child: SingleChildScrollView(
                      child: PageHorizontalMargin(
                        widget: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            TopMarginHome(),
                            SizedBox(height: 3.h,),
                            CustomTextField(
                              hintText: "Enter Full Name",
                              controller: model.newBeneficiaryNameController,
                            ),
                            SizedBox(height: 2.h,),
                            CustomTextField(
                              suffixRequired: true,
                              svgImage: ImageUtils.forwardIcon,
                              hintText: "Enter Gender",
                              controller: model.newBeneficiaryGenderController,
                              suffixImageHeight: 1.5.i,
                              suffixImageWidth: 1.5.i,
                            ),
                            SizedBox(height: 2.h,),
                            CustomTextField(
                              suffixRequired: true,
                              svgImage: ImageUtils.forwardIcon,
                              hintText: "Enter Date of Birth",
                              controller: model.newBeneficiaryDOBController,
                              suffixImageHeight: 1.5.i,
                              suffixImageWidth: 1.5.i,
                            ),
                            SizedBox(height: 2.h,),
                            CustomTextField(
                              suffixRequired: true,
                              svgImage: ImageUtils.forwardIcon,
                              hintText: "Enter Relation",
                              controller: model.newBeneficiaryRelationController,
                              suffixImageHeight: 1.5.i,
                              suffixImageWidth: 1.5.i,
                            ),
                            SizedBox(height: 2.h,),
                            IntlPhoneField(
                              decoration: InputDecoration(
                                counter: Text(""),
                                floatingLabelBehavior:
                                FloatingLabelBehavior.never,
                                focusedBorder: OutlineInputBorder(
                                  // width: 0.0 produces a thin "hairline" border
                                  borderSide: BorderSide(
                                      color: ColorUtils.lightBlue),
                                ),
                                labelText: 'Enter Number',

                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(8),
                                  borderSide: BorderSide(),
                                ),
                              ),
                              initialCountryCode: 'PK',
                              controller: model.newBeneficiaryNumberController,
                              onChanged: (phone) {
                                print(phone.completeNumber);
                              },
                            ),
                            CustomTextField(
                              suffixRequired: true,
                              svgImage: ImageUtils.forwardIcon,
                              hintText: "Enter City",
                              controller: model.newBeneficiaryCityController,
                              suffixImageHeight: 1.5.i,
                              suffixImageWidth: 1.5.i,
                            ),
                            SizedBox(height: 2.h,),
                            CustomTextField(
                              hintText: "Enter Address",
                              controller: model.newBeneficiaryAddressController,
                            ),
                            SizedBox(height: 2.h,),
                            CustomTextField(
                              hintText: "Enter Policy Number",
                              controller: model.newBeneficiaryPolicyNumberController,
                            ),
                            SizedBox(height: 2.h,),
                            CustomTextField(
                              hintText: "Enter Nick",
                              controller: model.newBeneficiaryNickController,
                            ),
                            SizedBox(height: 2.h,),
                            Padding(
                                padding: EdgeInsets.symmetric(horizontal: 0.w),
                                child: Container(
                                  //margin: EdgeInsets.symmetric(horizontal: 12.w),
                                  decoration:  BoxDecoration(
                                      shape: BoxShape.rectangle,
                                      borderRadius: BorderRadius.all(Radius.circular(30.5)),
                                      gradient: LinearGradient(
                                        colors: [
                                          ColorUtils.red.withOpacity(1),
                                          ColorUtils.red3.withOpacity(1),
                                        ],
                                      )
                                  ),
                                  child: AnimatedContainer(
                                    duration: const Duration(milliseconds: 400),
                                    width: MediaQuery.of(context).size.width / 1,
                                    height: 6.35.h,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10.5),
                                        color: ColorUtils.red
                                    ),
                                    child: MaterialButton(
                                        padding: EdgeInsets.zero,
                                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.5)),
                                        onPressed: () async{
                                          model.loadingWidget == true ? (){} :
                                          await model.doAddBenficiary(
                                              context,
                                              model.newBeneficiaryNameController.text,
                                              model.newBeneficiaryGenderController.text,
                                              model.newBeneficiaryDOBController.text,
                                              model.newBeneficiaryRelationController.text,
                                              model.newBeneficiaryNumberController.text,
                                              model.newBeneficiaryCityController.text,
                                              model.newBeneficiaryAddressController.text,
                                              model.newBeneficiaryPolicyNumberController.text,
                                              model.newBeneficiaryNickController.text,
                                          );
                                        },
                                        child: model.loadingWidget == false ? Text(
                                          "Add Beneficiary",
                                          style: TextStyle(
                                            fontFamily: FontUtils.poppinsBold,
                                            fontSize: 2.t,
                                            color: ColorUtils.white,
                                          ),
                                        ) : WidgetLoader()
                                    ),
                                  ),
                                )
                            ),
                          ],
                        ),
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
