import 'package:find_my_doctor/Utils/extensions.dart';
import 'package:flutter/material.dart';

class PageHorizontalMargin extends StatelessWidget {

  final Widget? widget;

  PageHorizontalMargin({this.widget, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 3.w),
      child: widget,
    );
  }
}
