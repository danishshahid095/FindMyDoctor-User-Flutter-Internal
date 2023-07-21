import 'package:find_my_doctor/App/locator.dart';
import 'package:find_my_doctor/Utils/color_utils.dart';
import 'package:find_my_doctor/Utils/extensions.dart';
import 'package:find_my_doctor/Utils/font_utils.dart';
import 'package:find_my_doctor/ViewModels/main_view_model.dart';
import 'package:find_my_doctor/Widgets/back_with_signleText.dart';
import 'package:find_my_doctor/Widgets/margin_below_appbar.dart';
import 'package:find_my_doctor/Widgets/page_horizontal_margin.dart';
import 'package:find_my_doctor/Widgets/red_button.dart';
import 'package:find_my_doctor/Widgets/text_widget.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

class EnterAddress extends StatelessWidget {
  const EnterAddress({Key? key}) : super(key: key);

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
                        backText: "Enter Address",
                      ),
                      MarginBelowAppBar(),
                    ],
                  ),
                  Expanded(
                    child: PageHorizontalMargin(
                      widget: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          TextWidget(
                            textValue: "Sindh | Karachi",
                            fontFamily: FontUtils.interSemiBold,
                            fontSize: 2.t,
                            textColor: ColorUtils.blackShade,
                          ),
                          SizedBox(height: 2.h,),
                          TextField(
                            style:  TextStyle(color: ColorUtils.black),
                            decoration:  InputDecoration(
                              //isDense: true,
                              focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: ColorUtils.red, width: 1.5),
                              ),
                              contentPadding: EdgeInsets.only(left: 5.w,top: 2.h, right: 2.w, bottom: 3.h),
                              hintText: "Enter Address",
                              hintStyle: TextStyle(color: ColorUtils.black.withOpacity(0.5)),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  PageHorizontalMargin(
                    widget: RedButton(
                      textValue: "Change Address",
                      onButtonPressed: (){
                        Navigator.pop(context);
                        // Navigator.push(context,
                        //     PageTransition(type: PageTransitionType.fade, child:  BookADoctor()));
                      },
                    ),
                  ),
                  SizedBox(height: 2.h,),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
