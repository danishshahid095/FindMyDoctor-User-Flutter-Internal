import 'package:expand_tap_area/expand_tap_area.dart';
import 'package:find_my_doctor/App/locator.dart';
import 'package:find_my_doctor/Utils/color_utils.dart';
import 'package:find_my_doctor/Utils/extensions.dart';
import 'package:find_my_doctor/Utils/font_utils.dart';
import 'package:find_my_doctor/Utils/image_utils.dart';
import 'package:find_my_doctor/ViewModels/main_view_model.dart';
import 'package:find_my_doctor/Widgets/text_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:stacked/stacked.dart';

class PharmacyTrackOrder extends StatelessWidget {
  const PharmacyTrackOrder({Key? key}) : super(key: key);

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
                      Container(
                        height: 10.h,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.5),
                              spreadRadius: 3,
                              blurRadius: 7,
                              offset: Offset(0, 3), // changes position of shadow
                            ),
                          ],
                        ),
                        child: Padding(
                          padding: EdgeInsets.only(left: 3.w, top: 2.h, right: 3.w),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              ExpandTapWidget(
                                onTap: () {
                                  Navigator.pop(context);
                                },
                                tapPadding: EdgeInsets.all(50),
                                child:
                                SvgPicture.asset(ImageUtils.backArrowRed),
                              ),
                              SizedBox(
                                width: 4.w,
                              ),
                              Padding(
                                padding: EdgeInsets.only(top: 1.h),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    TextWidget(
                                      textValue: "Order ID# F12M34D56",
                                      fontFamily: FontUtils.interBold,
                                      fontSize: 2.t,
                                      textColor: ColorUtils.red,
                                    ),
                                    SizedBox(height: 1.h,),
                                    TextWidget(
                                      textValue: "Mon, 28 June 2022 • 02:30 pm",
                                      fontFamily: FontUtils.interRegular,
                                      fontSize: 1.6.t,
                                      textColor: ColorUtils.blackShade,
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(height: 1.h,),
                    ],
                  ),
                  Expanded(
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                           SizedBox(
                             height: MediaQuery.of(context).size.height/2,
                               width: MediaQuery.of(context).size.width/1,
                               child: Image.asset(ImageUtils.pharmacyTrackImage,
                               fit: BoxFit.cover,
                               ),
                           ),
                          Image.asset(ImageUtils.pharmacyTrackOrderBottomSheet),
                        ],
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
