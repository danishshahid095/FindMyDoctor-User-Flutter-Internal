import 'package:find_my_doctor/Utils/color_utils.dart';
import 'package:find_my_doctor/Utils/extensions.dart';
import 'package:find_my_doctor/Utils/font_utils.dart';
import 'package:flutter/material.dart';

class RedButton extends StatelessWidget {

  final VoidCallback? onButtonPressed;
  final String? textValue;

  RedButton({this.onButtonPressed, this.textValue, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        shape: BoxShape.rectangle,
        borderRadius: BorderRadius.all(Radius.circular(8)),
      ),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 400),
        width: MediaQuery.of(context).size.width / 1,
        height: 6.35.h,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: ColorUtils.red,
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
                color: ColorUtils.white),
          ),
        ),
      ),
    );
  }
}
