import 'package:expand_tap_area/expand_tap_area.dart';
import 'package:find_my_doctor/Utils/color_utils.dart';
import 'package:find_my_doctor/Utils/extensions.dart';
import 'package:find_my_doctor/Utils/font_utils.dart';
import 'package:find_my_doctor/Utils/image_utils.dart';
import 'package:find_my_doctor/Widgets/text_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class BackSingleText extends StatelessWidget {

  String? backText;

  BackSingleText({this.backText, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
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
        padding: EdgeInsets.only(left: 3.w, top: 2.h),
        child: Row(
          children: [
            ExpandTapWidget(
              onTap: (){
                Navigator.pop(context);
              },
                tapPadding: EdgeInsets.all(50),
              child:SvgPicture.asset(ImageUtils.backArrowRed),
            ),
            SizedBox(width: 4.w,),
            TextWidget(
              textValue: backText,
              fontFamily: FontUtils.interSemiBold,
              fontSize: 2.t,
              textColor: ColorUtils.red,
            ),
          ],
        ),
      ),
    );
  }
}
