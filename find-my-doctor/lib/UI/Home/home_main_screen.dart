import 'package:find_my_doctor/App/locator.dart';
import 'package:find_my_doctor/UI/Home/BookDoctor/book_a_doctor.dart';
import 'package:find_my_doctor/UI/Home/Insurance/insurance_main_screen.dart';
import 'package:find_my_doctor/Utils/color_utils.dart';
import 'package:find_my_doctor/Utils/extensions.dart';
import 'package:find_my_doctor/Utils/font_utils.dart';
import 'package:find_my_doctor/Utils/image_utils.dart';
import 'package:find_my_doctor/ViewModels/main_view_model.dart';
import 'package:find_my_doctor/Widgets/page_horizontal_margin.dart';
import 'package:find_my_doctor/Widgets/text_widget.dart';
import 'package:find_my_doctor/Widgets/top_margin_home.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:page_transition/page_transition.dart';
import 'package:stacked/stacked.dart';

import 'BookDoctor/new_book_a_doctor.dart';

class HomeMainScreen extends StatefulWidget {
  const HomeMainScreen({Key? key}) : super(key: key);

  @override
  State<HomeMainScreen> createState() => _HomeMainScreenState();
}

class _HomeMainScreenState extends State<HomeMainScreen> {
  bool searchTapped = false;

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<MainViewModel>.reactive(
      viewModelBuilder: () => locator<MainViewModel>(),
      disposeViewModel: false,
      onModelReady: (model) {},
      builder: (context, model, child) {
        return GestureDetector(
          onTap: () {
            setState(() {
              searchTapped = false;
            });
            return FocusScope.of(context).unfocus();
          },
          child: SafeArea(
            top: false,
            bottom: false,
            child: Scaffold(
              backgroundColor: Colors.white,
              body: Column(
                children: [
                  PageHorizontalMargin(
                    widget: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: context.getPadding().top,
                        ),
                        TopMarginHome(),
                        if (searchTapped == true)
                          TextField(
                            style: TextStyle(color: ColorUtils.silver2),
                            decoration: InputDecoration(
                              fillColor: ColorUtils.silver1,
                              filled: true,
                              enabledBorder: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: ColorUtils.silver1),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(30.0)),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(30.0)),
                                borderSide: BorderSide(
                                    color: ColorUtils.silver1, width: 1.5),
                              ),
                              labelStyle:
                                  const TextStyle(color: Color(0xFFDEDEDE)),
                              hintText: "Search",
                              hintStyle: TextStyle(
                                  fontFamily: FontUtils.interRegular,
                                  color: ColorUtils.silver2),
                              prefixIcon: Padding(
                                padding: EdgeInsets.symmetric(horizontal: 14.0),
                                child: SvgPicture.asset(
                                  ImageUtils.searchIcon,
                                  height: 1.i,
                                  width: 1.i,
                                ),
                              ),
                            ),
                          ),
                        if (searchTapped == false)
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  TextWidget(
                                    textValue:
                                        'Hello .' + model.fullname.toString(),
                                    //textValue: "Hello Hussain,",
                                    fontFamily: FontUtils.poppinsBold,
                                    fontSize: 2.4.t,
                                    textColor: ColorUtils.red,
                                  ),
                                  TextWidget(
                                    textValue: "How may we help you today?",
                                    fontFamily: FontUtils.interMedium,
                                    fontSize: 1.8.t,
                                    textColor: ColorUtils.blackShade,
                                  ),
                                ],
                              ),
                              GestureDetector(
                                onTap: () {
                                  setState(() {
                                    searchTapped = true;
                                  });
                                },
                                child: Container(
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: ColorUtils.silver1,
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child:
                                        SvgPicture.asset(ImageUtils.searchIcon),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        SizedBox(
                          height: 2.h,
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: SingleChildScrollView(
                      child: PageHorizontalMargin(
                        widget: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            ClipRRect(
                                borderRadius: BorderRadius.circular(16.0),
                                child: Image.asset(ImageUtils.doctorBanner)),
                            SizedBox(
                              height: 2.h,
                            ),
                            TextWidget(
                              textValue: "Our Services",
                              // textValue: model.fcmToken,
                              fontFamily: FontUtils.poppinsBold,
                              fontSize: 2.4.t,
                              textColor: ColorUtils.red,
                            ),
                            TextWidget(
                              textValue: "One stop for all your medical needs.",
                              fontFamily: FontUtils.interMedium,
                              fontSize: 1.8.t,
                              textColor: ColorUtils.blackShade,
                            ),
                            SizedBox(
                              height: 2.h,
                            ),
                            SizedBox(
                              height: 28.5.h,
                              child: GridView.builder(
                                itemCount: model.services.length,
                                padding: EdgeInsets.zero,
                                shrinkWrap: true,
                                primary: false,
                                gridDelegate:
                                    SliverGridDelegateWithFixedCrossAxisCount(
                                        crossAxisCount: 2,
                                        crossAxisSpacing: 10.0,
                                        mainAxisSpacing: 10.0,
                                        childAspectRatio: 1.7),
                                itemBuilder: (context, index) {
                                  return GestureDetector(
                                    onTap: () {
                                      if (index == 0) {
                                        model.fromDoctorBook = true;
                                        model.fromPharmacy = false;
                                        model.fromLabTestBook = false;
                                        model.fromBuyInsurance = false;
                                        model.notifyListeners();
                                        Navigator.push(
                                            context,
                                            PageTransition(
                                                type: PageTransitionType.fade,
                                                child: BookADoctorNew()
                                                //BookADoctor()

                                                ));
                                      } else if (index == 1) {
                                        model.fromDoctorBook = false;
                                        model.fromPharmacy = true;
                                        model.fromLabTestBook = false;
                                        model.fromBuyInsurance = false;
                                        model.notifyListeners();
                                        Navigator.push(
                                            context,
                                            PageTransition(
                                                type: PageTransitionType.fade,
                                                child: BookADoctorNew()
                                                //BookADoctor()
                                                ));
                                      } else if (index == 2) {
                                        model.fromDoctorBook = false;
                                        model.fromPharmacy = false;
                                        model.fromLabTestBook = true;
                                        model.fromBuyInsurance = false;
                                        model.notifyListeners();
                                        Navigator.push(
                                            context,
                                            PageTransition(
                                                type: PageTransitionType.fade,
                                                child: BookADoctorNew()
                                                //BookADoctor()

                                                ));
                                      } else {
                                        model.fromDoctorBook = false;
                                        model.fromPharmacy = false;
                                        model.fromLabTestBook = false;
                                        model.fromBuyInsurance = true;
                                        model.notifyListeners();
                                        Navigator.push(
                                            context,
                                            PageTransition(
                                                type: PageTransitionType.fade,
                                                child: InsuranceMainScreen()));
                                      }
                                    },
                                    child: Container(
                                      decoration: BoxDecoration(
                                        shape: BoxShape.rectangle,
                                        borderRadius: BorderRadius.circular(8),
                                        color: ColorUtils.silver1,
                                      ),
                                      child: Padding(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 1.w),
                                        child: Row(
                                          children: [
                                            Image.asset(
                                              model.services[index]
                                                  ["serviceImage"],
                                              width: 16.i,
                                              fit: BoxFit.cover,
                                            ),
                                            SizedBox(
                                              width: 1.w,
                                            ),
                                            Expanded(
                                              child: Align(
                                                alignment: Alignment.centerLeft,
                                                child: Text(
                                                  model.services[index]
                                                      ["serviceName"],
                                                  style: TextStyle(
                                                      fontFamily:
                                                          FontUtils.poppinsBold,
                                                      fontSize: 2.t,
                                                      color: ColorUtils
                                                          .blackShade),
                                                ),
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                  );
                                },
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                TextWidget(
                                  textValue: "Blogs",
                                  fontFamily: FontUtils.poppinsBold,
                                  fontSize: 2.4.t,
                                  textColor: ColorUtils.red,
                                ),
                                TextWidget(
                                  textValue: "View All",
                                  fontFamily: FontUtils.interSemiBold,
                                  fontSize: 1.8.t,
                                  textColor: ColorUtils.red,
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 2.h,
                            ),
                            SizedBox(
                              height: 25.h,
                              child: ListView.separated(
                                separatorBuilder: (context, index) {
                                  return SizedBox(width: 4.w);
                                },
                                itemCount: model.blogs.length,
                                scrollDirection: Axis.horizontal,
                                itemBuilder: (context, index) {
                                  return Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      ClipRRect(
                                        borderRadius: BorderRadius.circular(8),
                                        child: Image.asset(
                                          model.blogs[index]["blogImage"],
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width /
                                              2,
                                        ),
                                      ),
                                      SizedBox(
                                        height: 2.h,
                                      ),
                                      TextWidget(
                                        textValue: model.blogs[index]
                                            ["blogName"],
                                        fontSize: 1.4.t,
                                        fontFamily: FontUtils.interBold,
                                        textColor: ColorUtils.black1,
                                      ),
                                      TextWidget(
                                        textValue: model.blogs[index]
                                            ["details"],
                                        fontSize: 1.4.t,
                                        fontFamily: FontUtils.interRegular,
                                        textColor: ColorUtils.black1,
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
