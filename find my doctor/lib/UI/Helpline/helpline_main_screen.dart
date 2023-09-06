import 'package:find_my_doctor/App/locator.dart';
import 'package:find_my_doctor/UI/Bookings/bookings_main_screen.dart';
import 'package:find_my_doctor/UI/Helpline/chat.dart';
import 'package:find_my_doctor/Utils/color_utils.dart';
import 'package:find_my_doctor/Utils/extensions.dart';
import 'package:find_my_doctor/Utils/font_utils.dart';
import 'package:find_my_doctor/Utils/image_utils.dart';
import 'package:find_my_doctor/ViewModels/main_view_model.dart';
import 'package:find_my_doctor/Widgets/page_horizontal_margin.dart';
import 'package:find_my_doctor/Widgets/red_button.dart';
import 'package:find_my_doctor/Widgets/text_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:page_transition/page_transition.dart';
import 'package:stacked/stacked.dart';
import 'package:url_launcher/url_launcher.dart';

class HelpLineMainScreen extends StatefulWidget {
  const HelpLineMainScreen({Key? key}) : super(key: key);

  @override
  State<HelpLineMainScreen> createState() => _HelpLineMainScreenState();
}

class _HelpLineMainScreenState extends State<HelpLineMainScreen> {
  final Uri launchUri = Uri(
    scheme: 'tel',
    path: "1234567",
  );

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<MainViewModel>.reactive(
      viewModelBuilder: () => locator<MainViewModel>(),
      disposeViewModel: false,
      onModelReady: (model) {},
      builder: (context, model, child) {
        return SafeArea(
          top: false,
          bottom: false,
          child: Scaffold(
            backgroundColor: Colors.white,
            body: Column(
              children: [
                Expanded(
                  child: PageHorizontalMargin(
                    widget: Column(
                      children: [
                        SizedBox(
                          height: context.getPadding().top,
                        ),
                        SizedBox(
                          height: 5.h,
                        ),
                        Center(
                          child: TextWidget(
                            textValue: "Need help\n We're here for You.",
                            fontFamily: FontUtils.poppinsBold,
                            fontSize: 2.4.t,
                            textColor: ColorUtils.red,
                          ),
                        ),
                        SizedBox(
                          height: 5.h,
                        ),
                        Image.asset(
                          ImageUtils.femaleDoctor,
                          width: 60.i,
                          height: 60.i,
                        ),
                        TextWidget(
                          textValue: "No active chats available.",
                          fontFamily: FontUtils.poppinsBold,
                          fontSize: 2.4.t,
                          textColor: ColorUtils.red,
                        ),
                      ],
                    ),
                  ),
                ),
                PageHorizontalMargin(
                  widget: Column(
                    children: [
                      Column(
                        children: [
                          RedButton(
                            textValue: "Start Chat",
                            onButtonPressed: () {
                              showModalBottomSheet(
                                isScrollControlled: true,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(24.0),
                                    topRight: Radius.circular(24.0),
                                  ),
                                ),
                                backgroundColor: Colors.white,
                                context: context,
                                builder: (BuildContext context) {
                                  return PageHorizontalMargin(
                                    widget: Container(
                                      height:
                                          MediaQuery.of(context).size.height /
                                              1.5,
                                      child: Column(
                                        children: [
                                          SizedBox(
                                            height: 2.h,
                                          ),
                                          Align(
                                            alignment: Alignment.centerLeft,
                                            child: TextWidget(
                                              textValue: "Start Chat",
                                              fontFamily: FontUtils.poppinsBold,
                                              fontSize: 2.8.t,
                                              textColor: ColorUtils.red,
                                            ),
                                          ),
                                          Image.asset(
                                            ImageUtils.femaleDoctor,
                                            width: 60.i,
                                            height: 60.i,
                                          ),
                                          SizedBox(
                                            height: 2.h,
                                          ),
                                          GestureDetector(
                                            onTap: () {
                                              Navigator.push(
                                                  context,
                                                  PageTransition(
                                                      type: PageTransitionType
                                                          .fade,
                                                      child:
                                                          BookingsMainScreen()));
                                            },
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                TextWidget(
                                                  textValue: "Active Bookings",
                                                  fontFamily:
                                                      FontUtils.interRegular,
                                                  fontSize: 1.8.t,
                                                  textColor:
                                                      ColorUtils.blackShade,
                                                ),
                                                SvgPicture.asset(
                                                    ImageUtils.redBorderCircle),
                                              ],
                                            ),
                                          ),
                                          SizedBox(
                                            height: 2.h,
                                          ),
                                          Divider(
                                            color: ColorUtils.silver,
                                          ),
                                          SizedBox(
                                            height: 2.h,
                                          ),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              TextWidget(
                                                textValue: "Previous Bookings",
                                                fontFamily:
                                                    FontUtils.interRegular,
                                                fontSize: 1.8.t,
                                                textColor:
                                                    ColorUtils.blackShade,
                                              ),
                                              SvgPicture.asset(
                                                  ImageUtils.redBorderCircle),
                                            ],
                                          ),
                                          SizedBox(
                                            height: 2.h,
                                          ),
                                          Divider(
                                            color: ColorUtils.silver,
                                          ),
                                          SizedBox(
                                            height: 4.h,
                                          ),
                                          RedButton(
                                            textValue: "Instant Chat",
                                            onButtonPressed: () {
                                              Navigator.pop(context);
                                              // Navigator.push(
                                              //     context,
                                              //     PageTransition(
                                              //         type: PageTransitionType
                                              //             .fade,
                                              //         child: HelpLineChat()));
                                            },
                                          ),
                                          SizedBox(
                                            height: 2.h,
                                          ),
                                        ],
                                      ),
                                    ),
                                  );
                                },
                              );
                            },
                          ),
                          SizedBox(
                            height: 2.h,
                          ),
                          Container(
                            decoration: BoxDecoration(
                                shape: BoxShape.rectangle,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(8)),
                                border:
                                    Border.all(color: ColorUtils.blackShade)),
                            child: AnimatedContainer(
                              duration: const Duration(milliseconds: 400),
                              width: MediaQuery.of(context).size.width / 1,
                              height: 6.35.h,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8),
                                border:
                                    Border.all(color: ColorUtils.blackShade),
                                color: ColorUtils.white,
                              ),
                              child: MaterialButton(
                                padding: EdgeInsets.zero,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8)),
                                onPressed: () async {
                                  await launchUrl(launchUri);
                                },
                                child: Text(
                                  "Call Us",
                                  style: TextStyle(
                                      fontFamily: FontUtils.interSemiBold,
                                      fontSize: 1.8.t,
                                      color: ColorUtils.blackShade),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 2.h,
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
