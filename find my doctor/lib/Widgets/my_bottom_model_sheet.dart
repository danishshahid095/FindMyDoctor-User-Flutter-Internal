
import 'package:find_my_doctor/Utils/color_utils.dart';
import 'package:find_my_doctor/Utils/extensions.dart';
import 'package:find_my_doctor/Utils/font_utils.dart';
import 'package:find_my_doctor/Utils/image_utils.dart';
import 'package:find_my_doctor/Widgets/page_horizontal_margin.dart';
import 'package:find_my_doctor/Widgets/text_widget.dart';
import 'package:flutter/material.dart';

class MyBottomModelSheet{
  static void showModelSheet(BuildContext context,double height,String modelName, Widget widget){
    showModalBottomSheet(
      isScrollControlled: true,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(24.0),
          topRight: Radius.circular(24.0),
        ),
      ),
      backgroundColor: Colors.white, context: context, builder: (BuildContext context) {
      return PageHorizontalMargin(
        widget: Container(
          height: height,
          child: Column(
            children: [
              SizedBox(height: 2.h,),
              Align(
                alignment: Alignment.centerLeft,
                child: TextWidget(
                  textValue: modelName,
                  fontFamily: FontUtils.poppinsBold,
                  fontSize: 2.8.t,
                  textColor: ColorUtils.red,
                ),
              ),
              Image.asset(
                ImageUtils.femaleDoctor,
                width: 60.i,
                height: 60.i,
              ),
              SizedBox(height: 2.h,),
              widget,
              SizedBox(height: 2.h,),
            ],
          ),
        ),
      );
    },
    );
  }
}
