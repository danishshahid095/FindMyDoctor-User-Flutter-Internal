import 'package:find_my_doctor/Utils/image_utils.dart';
import 'package:find_my_doctor/Widgets/components_heightwidth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ForwardButtonBlack extends StatelessWidget {

  const ForwardButtonBlack({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(ImageUtils.forwardIcon,
      width:ComponentsWidthHeight.forwardIconWidth,
      height: ComponentsWidthHeight.forwardIconHeight,
    );
  }
}
