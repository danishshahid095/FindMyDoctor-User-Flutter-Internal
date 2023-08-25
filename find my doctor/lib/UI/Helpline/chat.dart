import 'package:find_my_doctor/App/locator.dart';
import 'package:find_my_doctor/Utils/color_utils.dart';
import 'package:find_my_doctor/Utils/extensions.dart';
import 'package:find_my_doctor/Utils/font_utils.dart';
import 'package:find_my_doctor/Utils/image_utils.dart';
import 'package:find_my_doctor/ViewModels/main_view_model.dart';
import 'package:find_my_doctor/Widgets/page_horizontal_margin.dart';
import 'package:find_my_doctor/Widgets/text_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:page_transition/page_transition.dart';
import 'package:stacked/stacked.dart';

import 'video_call_screen.dart';

class HelpLineChat extends StatelessWidget {
  const HelpLineChat({Key? key}) : super(key: key);

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
                  SizedBox(
                    height: context.getPadding().top,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        IconButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          icon: Icon(
                            Icons.arrow_back_ios_new_outlined,
                          ),
                          color: Colors.red,
                        ),

                        TextWidget(
                          textValue: "Care Chat - 25/06/22",
                          textColor: ColorUtils.red,
                          fontFamily: FontUtils.interBold,
                          fontSize: 1.9.t,
                        ),

                        // BackSingleText(
                        //   backText: "Care Chat - 25/06/22",
                        // ),
                        InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                PageTransition(
                                    type: PageTransitionType.fade,
                                    child: VideoCallScreen(callID: "1",)));
                          },
                          child: Container(
                            height: 35,
                            width: 35,
                            child: Image.asset(
                              ImageUtils.VedioCallicon,
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  Expanded(
                    child: PageHorizontalMargin(
                      widget: Column(
                        children: [
                          Container(),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    color: ColorUtils.white1,
                    child: PageHorizontalMargin(
                      widget: Container(
                        height: 70,

                        // padding: EdgeInsets.only(
                        //     left: 4.w,
                        //     right: 4.w,
                        //     top: 6.h
                        // ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          //crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Expanded(
                              child: Container(
                                //width: 200.0,
                                margin: EdgeInsets.only(
                                  //left: SizeConfig.widthMultiplier * 4.5,
                                  right: 2.w,
                                  //top: SizeConfig.heightMultiplier * 3,
                                ),
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(30.0),
                                    ),
                                    border:
                                        Border.all(color: ColorUtils.silver)),
                                child: Container(
                                  //color: Colors.amber,
                                  margin: EdgeInsets.symmetric(
                                    horizontal: 3.w,
                                  ),
                                  child: Row(
                                    children: [
                                      SizedBox(
                                        width: 1.w,
                                      ),
                                      Expanded(
                                        child: Container(
                                          child: TextField(
                                            onTap: () {},
                                            enabled: true,
                                            //readOnly: true,
                                            //focusNode: model.searchFocus,
                                            decoration: InputDecoration(
                                              hintText: "Enter message...",
                                              hintStyle: TextStyle(
                                                fontFamily:
                                                    FontUtils.interRegular,
                                                color: ColorUtils.black
                                                    .withOpacity(0.5),
                                                fontSize: 1.6.t,
                                              ),
                                              border: InputBorder.none,
                                              isDense: true,
                                              contentPadding:
                                                  EdgeInsets.symmetric(
                                                      vertical: 2.h),
                                            ),
                                          ),
                                        ),
                                      ),
                                      GestureDetector(
                                        onTap: () {
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
                                                  height: MediaQuery.of(context)
                                                          .size
                                                          .height /
                                                      1.75,
                                                  child: Column(
                                                    children: [
                                                      SizedBox(
                                                        height: 2.h,
                                                      ),
                                                      Align(
                                                        alignment: Alignment
                                                            .centerLeft,
                                                        child: TextWidget(
                                                          textValue:
                                                              "Attach File",
                                                          fontFamily: FontUtils
                                                              .poppinsBold,
                                                          fontSize: 2.8.t,
                                                          textColor:
                                                              ColorUtils.red,
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
                                                        onTap: () {},
                                                        child: Row(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .spaceBetween,
                                                          children: [
                                                            TextWidget(
                                                              textValue:
                                                                  "Take A Picture",
                                                              fontFamily: FontUtils
                                                                  .interRegular,
                                                              fontSize: 1.8.t,
                                                              textColor:
                                                                  ColorUtils
                                                                      .blackShade,
                                                            ),
                                                            SvgPicture.asset(
                                                                ImageUtils
                                                                    .takePicture),
                                                          ],
                                                        ),
                                                      ),
                                                      SizedBox(
                                                        height: 2.h,
                                                      ),
                                                      Divider(
                                                        color:
                                                            ColorUtils.silver,
                                                      ),
                                                      SizedBox(
                                                        height: 2.h,
                                                      ),
                                                      Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceBetween,
                                                        children: [
                                                          TextWidget(
                                                            textValue:
                                                                "Select From Gallery",
                                                            fontFamily: FontUtils
                                                                .interRegular,
                                                            fontSize: 1.8.t,
                                                            textColor:
                                                                ColorUtils
                                                                    .blackShade,
                                                          ),
                                                          SvgPicture.asset(
                                                              ImageUtils
                                                                  .selectGallery),
                                                        ],
                                                      ),
                                                      SizedBox(
                                                        height: 2.h,
                                                      ),
                                                      Divider(
                                                        color:
                                                            ColorUtils.silver,
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
                                        child: Icon(
                                          Icons.attach_file,
                                          color: ColorUtils.silver,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            GestureDetector(
                              onTap: () async {},
                              child: Container(
                                //margin: EdgeInsets.only(bottom: 2.2.h),
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: ColorUtils.red,
                                ),
                                child: Padding(
                                    padding: EdgeInsets.all(15.0),
                                    child: SvgPicture.asset(
                                        ImageUtils.recordingIcon)),
                              ),
                              // Icon(
                              //   Icons.arrow_forward_ios,
                              // ),
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
