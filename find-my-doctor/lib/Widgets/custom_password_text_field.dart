import 'package:find_my_doctor/Utils/extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../Utils/color_utils.dart';

class CustomPasswordTextField extends StatefulWidget {
  final TextEditingController? controller;
  final TextInputType? textInputType;
  final String? hintText;
  final IconData? prefixIconData;
  final bool? prefixRequired;
  final bool? suffixRequired;
  final String? svgImage;
  final double? suffixImageWidth;
  final double? suffixImageHeight;

  const CustomPasswordTextField({
    this.controller,
    this.textInputType,
    this.hintText,
    this.prefixIconData,
    this.prefixRequired,
    this.suffixRequired,
    this.svgImage,
    this.suffixImageWidth,
    this.suffixImageHeight,
    Key? key,
  }) : super(key: key);

  @override
  _CustomPasswordTextFieldState createState() => _CustomPasswordTextFieldState();
}

class _CustomPasswordTextFieldState extends State<CustomPasswordTextField> {
  bool _obscureText = true;

  void _togglePasswordVisibility() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(
          Radius.circular(10.0),
        ),
      ),
      child: widget.prefixRequired == true
          ? TextField(
        controller: widget.controller,
        obscureText: _obscureText,
        style: TextStyle(color: Colors.black),
        keyboardType: widget.textInputType,
        decoration: InputDecoration(
          contentPadding: EdgeInsets.only(left: 5.w,top: 2.h, right: 2.w, bottom: 3.h),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: ColorUtils.black.withOpacity(0.5), width: 1),
            borderRadius: BorderRadius.all(Radius.circular(10.0)),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(10.0)),
            borderSide: BorderSide(color: ColorUtils.red, width: 1.5),
          ),
          hintText: widget.hintText,
          hintStyle: TextStyle(color: ColorUtils.black.withOpacity(0.5)),
          prefixIcon: Icon(
            widget.prefixIconData,
            //color: ColorUtils.blue1,
          ),
        ),
      ) :
      widget.suffixRequired == true?
      TextField(
        controller: widget.controller,
        style:  TextStyle(color: ColorUtils.black),
        keyboardType: widget.textInputType,
        decoration:  InputDecoration(
          //isDense: true,
          suffixIconConstraints: BoxConstraints(
            minHeight: widget.suffixImageHeight!,
            minWidth: widget.suffixImageWidth!,
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
          hintText: widget.hintText,
          hintStyle: TextStyle(color: ColorUtils.black.withOpacity(0.5)),
          suffixIcon: IconButton(
            icon: Icon(_obscureText ? Icons.visibility : Icons.visibility_off),
            onPressed: _togglePasswordVisibility,
          ),
        ),
      )
          : widget.suffixRequired == true
          ? TextField(
        controller: widget.controller,
        obscureText: _obscureText,
        style: TextStyle(color: Colors.black),
        keyboardType: widget.textInputType,
        decoration: InputDecoration(
          suffixIcon: Padding(
            padding: EdgeInsets.only(right: 4.0),
            child: GestureDetector(
              onTap: _togglePasswordVisibility,
              child: SvgPicture.asset(
                widget.svgImage!,
              ),
            ),
          ),
          contentPadding: EdgeInsets.only(
            left: 5.w,
            top: 3.h,
            right: 2.w,
            bottom: 3.h,
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.black.withOpacity(0.5),
              width: 1,
            ),
            borderRadius: BorderRadius.all(Radius.circular(10.0)),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(10.0)),
            borderSide: BorderSide(color: Colors.red, width: 1.5),
          ),
          hintText: widget.hintText,
          hintStyle: TextStyle(color: Colors.black.withOpacity(0.5)),
        ),
      )
          : TextField(
        controller: widget.controller,
        obscureText: _obscureText,
        style: TextStyle(color: Colors.black),
        keyboardType: widget.textInputType,
        decoration: InputDecoration(
          contentPadding: EdgeInsets.only(
            left: 5.w,
            top: 2.h,
            right: 2.w,
            bottom: 3.h,
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.black.withOpacity(0.5),
              width: 1,
            ),
            borderRadius: BorderRadius.all(Radius.circular(10.0)),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(10.0)),
            borderSide: BorderSide(color: Colors.red, width: 1.5),
          ),
          hintText: widget.hintText,
          hintStyle: TextStyle(color: Colors.black.withOpacity(0.5)),
          suffixIcon: IconButton(
            icon: Icon(_obscureText ? Icons.visibility : Icons.visibility_off),
            onPressed: _togglePasswordVisibility,
          ),
        ),
      ),
    );
  }
}
