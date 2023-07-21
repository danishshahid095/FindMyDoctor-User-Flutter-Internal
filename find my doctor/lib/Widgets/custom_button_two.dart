
import 'package:find_my_doctor/Utils/color_utils.dart';
import 'package:find_my_doctor/Utils/extensions.dart';
import 'package:find_my_doctor/Utils/font_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomButtonTwo extends StatelessWidget {

  final VoidCallback? onButtonPressed;
  final String? textValue;
  final Color? buttonColor;
  final String? assetName;

  CustomButtonTwo({this.onButtonPressed, this.textValue, this.buttonColor, this.assetName, Key? key}) : super(key: key);

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
          border: Border.all(color: buttonColor!),
          borderRadius: BorderRadius.circular(8),
          color: ColorUtils.white,
        ),
        child: MaterialButton(
          padding: EdgeInsets.zero,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          onPressed: onButtonPressed,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset(assetName!),
              SizedBox(width: 4.w,),
              Text(
                textValue!,
                style: TextStyle(
                    fontFamily: FontUtils.interSemiBold,
                    fontSize: 1.8.t,
                    color: buttonColor),
              ),
            ],
          ),
        ),
      ),
    );
  }
}