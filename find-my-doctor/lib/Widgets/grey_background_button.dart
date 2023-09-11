import 'package:find_my_doctor/Utils/extensions.dart';
import 'package:find_my_doctor/Utils/font_utils.dart';
import 'package:flutter/material.dart';

class GreyBackGroundButton extends StatelessWidget {

  String? text;
  Color? buttonColor, buttonTextColor;
  final VoidCallback? onButtonPressed;

  GreyBackGroundButton({Key? key, this.text, this.buttonColor, this.buttonTextColor, this.onButtonPressed}) : super(key: key);

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
          color: buttonColor,
        ),
        child: MaterialButton(
          padding: EdgeInsets.zero,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          onPressed: onButtonPressed,
          child: Text(
            text!,
            style: TextStyle(
                fontFamily: FontUtils.interSemiBold,
                fontSize: 1.8.t,
                color: buttonTextColor!,
            ),
          ),
        ),
      ),
    );
  }
}
