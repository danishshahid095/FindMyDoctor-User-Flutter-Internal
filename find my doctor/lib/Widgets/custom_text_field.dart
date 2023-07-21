
import 'package:find_my_doctor/Utils/color_utils.dart';
import 'package:find_my_doctor/Utils/extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController? controller;
  final TextInputType? textInputType;
  final String? hintText;
  final IconData? prefixIconData;
  final bool? prefixRequired;
  final bool? suffixRequired;
  final String? svgImage;
  final double? suffixImageWidth;
  final double? suffixImageHeight;

  const CustomTextField({
    this.controller,
    this.textInputType,
    this.hintText,
    this.prefixIconData,
    this.prefixRequired,
    this.suffixRequired,
    this.svgImage,
    this.suffixImageWidth,
    this.suffixImageHeight,
    Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(
            Radius.circular(10.0),
          ),
        ),
        child: prefixRequired == true ?
        TextField(
          controller: controller,
          style:  TextStyle(color: ColorUtils.black),
          keyboardType: textInputType,
          decoration:  InputDecoration(
            contentPadding: EdgeInsets.only(left: 5.w,top: 2.h, right: 2.w, bottom: 3.h),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: ColorUtils.black.withOpacity(0.5), width: 1),
              borderRadius: BorderRadius.all(Radius.circular(10.0)),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(10.0)),
              borderSide: BorderSide(color: ColorUtils.red, width: 1.5),
            ),
            hintText: hintText,
            hintStyle: TextStyle(color: ColorUtils.black.withOpacity(0.5)),
            prefixIcon: Icon(
              prefixIconData,
              //color: ColorUtils.blue1,
            ),
          ),
        ) :
        suffixRequired == true?
        TextField(
          controller: controller,
          style:  TextStyle(color: ColorUtils.black),
          keyboardType: textInputType,
          decoration:  InputDecoration(
            //isDense: true,
            suffixIconConstraints: BoxConstraints(
              minHeight: suffixImageHeight!,
              minWidth: suffixImageWidth!,
            ),
            contentPadding: EdgeInsets.only(left: 5.w,top: 3.h, right: 2.w, bottom: 3.h),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: ColorUtils.black.withOpacity(0.5), width: 1),
              borderRadius: BorderRadius.all(Radius.circular(10.0)),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(10.0)),
              borderSide: BorderSide(color: ColorUtils.red, width: 1.5),
            ),
            hintText: hintText,
            hintStyle: TextStyle(color: ColorUtils.black.withOpacity(0.5)),
            suffixIcon: Padding(
              padding: EdgeInsets.only(right: 4.w),
              child: SvgPicture.asset(
                svgImage!,
              ),
            ),
          ),
        ) :
        TextField(
          controller: controller,
          style:  TextStyle(color: ColorUtils.black),
          keyboardType: textInputType,
          decoration:  InputDecoration(
            //isDense: true,
            contentPadding: EdgeInsets.only(left: 5.w,top: 2.h, right: 2.w, bottom: 3.h),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: ColorUtils.black.withOpacity(0.5), width: 1),
              borderRadius: BorderRadius.all(Radius.circular(10.0)),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(10.0)),
              borderSide: BorderSide(color: ColorUtils.red, width: 1.5),
            ),
            hintText: hintText,
            hintStyle: TextStyle(color: ColorUtils.black.withOpacity(0.5)),
          ),
        )
    );
  }
}
