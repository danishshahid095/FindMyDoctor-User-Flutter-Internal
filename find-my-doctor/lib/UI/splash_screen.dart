import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:stacked/stacked.dart';
import 'package:find_my_doctor/app/locator.dart';
import 'package:find_my_doctor/utils/color_utils.dart';
import 'package:find_my_doctor/utils/extensions.dart';
import 'package:find_my_doctor/utils/image_utils.dart';

import '../ViewModels/main_view_model.dart';

class Splashscreen extends StatefulWidget {
  const Splashscreen({Key? key}) : super(key: key);

  @override
  State<Splashscreen> createState() => _SplashscreenState();
}

class _SplashscreenState extends State<Splashscreen> {

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<MainViewModel>.reactive(
      viewModelBuilder: () => locator<MainViewModel>(),
      disposeViewModel: false,
      onViewModelReady: (model) {
        model.goToScreen(context);
      },
      builder: (context, model, child) {
        return SafeArea(
          top: false,
          bottom: false,
          child: Scaffold(
            backgroundColor: Colors.red,
            body: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: Center(
                    child: Image.asset(
                      ImageUtils.splashLogo,
                      width: 70.i,
                      height: 70.i,
                    ),
                  ),
                ),
                SpinKitFadingCircle(
                  color: ColorUtils.white,
                  size: 50.0,
                ),
                SizedBox(height: 3.h,),
              ],
            ),
          ),
        );
      },
    );
  }
}
