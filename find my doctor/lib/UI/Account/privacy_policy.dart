import 'package:find_my_doctor/App/locator.dart';
import 'package:find_my_doctor/Utils/color_utils.dart';
import 'package:find_my_doctor/Utils/extensions.dart';
import 'package:find_my_doctor/Utils/font_utils.dart';
import 'package:find_my_doctor/Utils/image_utils.dart';
import 'package:find_my_doctor/ViewModels/main_view_model.dart';
import 'package:find_my_doctor/Widgets/back_with_signleText.dart';
import 'package:find_my_doctor/Widgets/page_horizontal_margin.dart';
import 'package:find_my_doctor/Widgets/text_widget.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';


class Privacy_Policy extends StatefulWidget {
  const Privacy_Policy({Key? key}) : super(key: key);

  @override
  State<Privacy_Policy> createState() => _Privacy_PolicyState();
}

class _Privacy_PolicyState extends State<Privacy_Policy> {
  @override
    Widget build(BuildContext context) {
      return ViewModelBuilder<MainViewModel>.reactive(
        viewModelBuilder: () => locator<MainViewModel>(),
        disposeViewModel: false,
        onModelReady: (model) {},
        builder: (context, model, child) {
          return GestureDetector(
            onTap: () => FocusScope.of(context).unfocus(),
            child: SafeArea(
              top: false,
              bottom: false,
              child: Scaffold(
                backgroundColor: Colors.white,
                body: Column(
                  children: [
                    Column(
                      children: [
                        SizedBox(
                          height: context.getPadding().top,
                        ),
                        BackSingleText(
                          backText: "Privacy Policy",
                        ),
                        SizedBox(
                          height: 1.h,
                        ),
                      ],
                    ),
                    Expanded(
                      child: SingleChildScrollView(
                        child: PageHorizontalMargin(
                            widget: Column(
                              children: [
                                Image.asset(
                                  ImageUtils.doctorVerification,
                                  width: 60.i,
                                  height: 60.i,
                                ),
                                TextWidget(
                                  textValue: "Find My Doctor FAQs",
                                  textColor: ColorUtils.red,
                                  fontFamily: FontUtils.interBold,
                                  fontSize: 2.4.t,
                                ),
                                Container(
                                  height: 50.h,
                                  child: ListView.builder(
                                    itemCount: model.privacy_policy.length,
                                    itemBuilder: (BuildContext context, int index) {
                                      return ExpansionTile(
                                        title: Container(
                                          child: TextWidget(
                                            textValue: model.privacy_policy[index]["question"],
                                            textColor: ColorUtils.black,
                                            fontFamily: FontUtils.interRegular,
                                            fontSize: 1.6.t,
                                          ),
                                        ),
                                        children: [
                                          Padding(
                                            padding: EdgeInsets.only(
                                                left: 15, right: 15, bottom: 10),
                                            child: TextWidget(
                                              textValue: model.privacy_policy[index]["answer"],
                                              textColor: ColorUtils.black,
                                              fontFamily: FontUtils.interRegular,
                                              fontSize: 1.6.t,
                                            ),
                                          ),
                                        ],
                                      );
                                    },
                                  ),
                                ),
                              ],
                            )),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      );
    }

}
