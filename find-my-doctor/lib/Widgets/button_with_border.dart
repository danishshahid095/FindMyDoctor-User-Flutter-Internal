import 'package:find_my_doctor/Utils/color_utils.dart';
import 'package:find_my_doctor/Utils/extensions.dart';
import 'package:find_my_doctor/Utils/font_utils.dart';
import 'package:flutter/material.dart';

class ButtonWithBorder extends StatelessWidget {

  final VoidCallback? onButtonPressed;
  final String? textValue;
  final Color? buttonTextColor, borderColor;

  ButtonWithBorder({this.onButtonPressed, this.textValue, this.buttonTextColor, this.borderColor, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        shape: BoxShape.rectangle,
        borderRadius: BorderRadius.all(Radius.circular(8)),
        border: Border.all(color: borderColor!),
      ),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 400),
        width: MediaQuery.of(context).size.width / 1,
        height: 6.35.h,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: borderColor!),
          color: ColorUtils.white,
        ),
        child: MaterialButton(
          padding: EdgeInsets.zero,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          onPressed: onButtonPressed,
          child: Text(
            textValue!,
            style: TextStyle(
                fontFamily: FontUtils.interSemiBold,
                fontSize: 1.8.t,
                color: buttonTextColor),
          ),
        ),
      ),
    );
  }
}
