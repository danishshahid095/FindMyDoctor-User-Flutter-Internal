import 'package:flutter/material.dart';

class TextWidget extends StatelessWidget {

  final String? textValue;
  final String? fontFamily;
  final double? fontSize;
  final Color? textColor;
  final TextAlign? textAlign;

  TextWidget({this.textValue, this.fontFamily, this.fontSize, this.textColor, this.textAlign, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      textValue!,
      textAlign: textAlign,
      style: TextStyle(
        fontFamily: fontFamily!,
        fontSize: fontSize!,
        color: textColor!,
      ),
    );
  }
}
