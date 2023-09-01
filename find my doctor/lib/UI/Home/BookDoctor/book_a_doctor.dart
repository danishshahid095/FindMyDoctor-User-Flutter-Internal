import 'package:find_my_doctor/App/locator.dart';
import 'package:find_my_doctor/UI/Home/BookDoctor/select_city.dart';
import 'package:find_my_doctor/UI/Home/BookDoctor/select_consultation_type.dart';
import 'package:find_my_doctor/UI/Home/LabTest/lab_select_prescription.dart';
import 'package:find_my_doctor/UI/Home/Pharmacy/search_medicine.dart';
import 'package:find_my_doctor/UI/Home/Pharmacy/select_city_pharmacy.dart';
import 'package:find_my_doctor/Utils/color_utils.dart';
import 'package:find_my_doctor/Utils/extensions.dart';
import 'package:find_my_doctor/Utils/font_utils.dart';
import 'package:find_my_doctor/Utils/image_utils.dart';
import 'package:find_my_doctor/ViewModels/main_view_model.dart';
import 'package:find_my_doctor/Widgets/back_with_signleText.dart';
import 'package:find_my_doctor/Widgets/button_with_border.dart';
import 'package:find_my_doctor/Widgets/forward_button_black.dart';
import 'package:find_my_doctor/Widgets/my_bottom_model_sheet.dart';
import 'package:find_my_doctor/Widgets/page_horizontal_margin.dart';
import 'package:find_my_doctor/Widgets/red_button.dart';
import 'package:find_my_doctor/Widgets/text_widget.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:stacked/stacked.dart';

class BookADoctor extends StatefulWidget {
  const BookADoctor({Key? key}) : super(key: key);

  @override
  State<BookADoctor> createState() => _BookADoctorState();
}

class _BookADoctorState extends State<BookADoctor> {
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
                        backText: "Book A Doctor",
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
                            TextWidget(
                              textValue:
                                  "Who are you booking this appointment for?",
                              fontFamily: FontUtils.poppinsBold,
                              fontSize: 2.4.t,
                              textColor: ColorUtils.red,
                            ),
                            SizedBox(
                              height: 5.h,
                            ),
                            InkWell(
                              onTap: () {
                                MyBottomModelSheet.showModelSheet(
                                  context,
                                  MediaQuery.of(context).size.height / 1.6,
                                  "Confirm Address",
                                  Column(
                                    children: [
                                      Padding(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 3.w),
                                        child: TextWidget(
                                          textValue:
                                              "F18, 5th Floor, XYZ Towers, St II, Block A, Khayban-e-Imtiaz, Karachi, 75321",
                                          fontFamily: FontUtils.interRegular,
                                          fontSize: 1.8.t,
                                          textColor: ColorUtils.blackShade,
                                        ),
                                      ),
                                      SizedBox(
                                        height: 2.h,
                                      ),
                                      RedButton(
                                        textValue: "Confirm",
                                        onButtonPressed: () {
                                          if (model.fromDoctorBook == true) {
                                            Navigator.pop(context);
                                            Navigator.push(
                                                context,
                                                PageTransition(
                                                    type:
                                                        PageTransitionType.fade,
                                                    child:
                                                        SelectConsultationType()));
                                          } else if (model.fromPharmacy ==
                                              true) {
                                            Navigator.pop(context);
                                            Navigator.push(
                                                context,
                                                PageTransition(
                                                    type:
                                                        PageTransitionType.fade,
                                                    child: SearchMedicine()));
                                          } else {
                                            Navigator.pop(context);
                                            Navigator.push(
                                                context,
                                                // PageTransition(type: PageTransitionType.fade, child: SelectPrescription()));
                                                PageTransition(
                                                    type:
                                                        PageTransitionType.fade,
                                                    child:
                                                        SelectCityPharmacy()));
                                          }
                                        },
                                      ),
                                      SizedBox(
                                        height: 2.h,
                                      ),
                                      ButtonWithBorder(
                                        textValue: "Edit",
                                        onButtonPressed: () {
                                          Navigator.pop(context);
                                          Navigator.push(
                                              context,
                                              PageTransition(
                                                  type: PageTransitionType.fade,
                                                  child: SelectCity()));
                                        },
                                        borderColor: ColorUtils.red,
                                        buttonTextColor: ColorUtils.red,
                                      ),
                                    ],
                                  ),
                                );
                              },
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  TextWidget(
                                    textValue: "Self",
                                    textColor: ColorUtils.red,
                                    fontFamily: FontUtils.interBold,
                                    fontSize: 1.8.t,
                                  ),
                                  ForwardButtonBlack(),
                                  //SizedBox(width: 2.w,),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 1.h,
                            ),
                            Divider(
                              color: ColorUtils.silver,
                            ),
                            AppointmentFor(
                              appointmentFor: "Ammi",
                              name: "Tooba Akhtar",
                            ),
                            AppointmentFor(
                              appointmentFor: "Abbu",
                              name: "Akhtar Khalid",
                            ),
                            AppointmentFor(
                              appointmentFor: "Begum",
                              name: "Farah Hussain",
                            ),
                            AppointmentFor(
                              appointmentFor: "Elder Son",
                              name: "Ismail Hussain",
                            ),
                            SizedBox(
                              height: 1.h,
                            ),
                            Align(
                              alignment: Alignment.centerLeft,
                              child: TextWidget(
                                textValue: "+ Book for some else",
                                textColor: ColorUtils.red,
                                fontFamily: FontUtils.interBold,
                                fontSize: 1.8.t,
                              ),
                            ),
                            SizedBox(
                              height: 1.h,
                            ),
                            Divider(
                              color: ColorUtils.silver,
                            ),
                            SizedBox(
                              height: 1.h,
                            ),
                          ],
                        ),
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

class AppointmentFor extends StatelessWidget {
  String? appointmentFor;
  String? name;

  AppointmentFor({this.appointmentFor, this.name, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 1.h,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextWidget(
                  textValue: appointmentFor,
                  textColor: ColorUtils.red,
                  fontFamily: FontUtils.interBold,
                  fontSize: 1.8.t,
                ),
                SizedBox(
                  height: 0.75.h,
                ),
                TextWidget(
                  textValue: name,
                  textColor: ColorUtils.blackShade,
                  fontFamily: FontUtils.interRegular,
                  fontSize: 1.8.t,
                ),
              ],
            ),
            ForwardButtonBlack(),
          ],
        ),
        SizedBox(
          height: 1.h,
        ),
        Divider(
          color: ColorUtils.silver,
        ),
      ],
    );
  }
}
