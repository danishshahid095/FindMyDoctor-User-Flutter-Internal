import 'package:find_my_doctor/Utils/color_utils.dart';
import 'package:find_my_doctor/Utils/extensions.dart';
import 'package:find_my_doctor/Utils/font_utils.dart';
import 'package:find_my_doctor/Widgets/text_widget.dart';
import 'package:flutter/material.dart';

class SquareDateTextField extends StatelessWidget {
  final Function()? onTap;
  String? hint, unit;

  SquareDateTextField({Key? key, this.onTap, this.hint, this.unit}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 4.w),
      padding: EdgeInsets.symmetric(vertical: 2.h),
      decoration: BoxDecoration(
        shape: BoxShape.rectangle,
        borderRadius: BorderRadius.circular(8),
        color: ColorUtils.silver1,
      ),
      child: Column(
        children: [
          GestureDetector(
            onTap: onTap,
            child: AbsorbPointer(
              child: TextField(
                readOnly: true, // Prevents keyboard from appearing
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontFamily: FontUtils.poppinsBold,
                  fontSize: 3.4.t,
                  color: ColorUtils.silver2,
                ),
                keyboardType: TextInputType.number,
                decoration: InputDecoration.collapsed(
                  hintText: hint,
                  hintStyle: TextStyle(
                    fontFamily: FontUtils.poppinsBold,
                    fontSize: 3.4.t,
                    color: ColorUtils.silver2,
                  ),
                ),
              ),
            ),
          ),
          TextWidget(
            textValue: unit,
            fontFamily: FontUtils.interRegular,
            fontSize: 1.6.t,
            textColor: ColorUtils.silver2,
          ),
        ],
      ),
    );
  }
}
