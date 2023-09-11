import 'package:cached_network_image/cached_network_image.dart';
import 'package:find_my_doctor/App/locator.dart';
import 'package:find_my_doctor/UI/Home/BookDoctor/physical_visit_book_slot.dart';
import 'package:find_my_doctor/Utils/color_utils.dart';
import 'package:find_my_doctor/Utils/extensions.dart';
import 'package:find_my_doctor/Utils/font_utils.dart';
import 'package:find_my_doctor/Utils/image_utils.dart';
import 'package:find_my_doctor/ViewModels/main_view_model.dart';
import 'package:find_my_doctor/Widgets/back_with_signleText.dart';
import 'package:find_my_doctor/Widgets/forward_button_black.dart';
import 'package:find_my_doctor/Widgets/page_horizontal_margin.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:stacked/stacked.dart';

import '../../../Utils/constants.dart';
import '../../../Utils/whole_page_loader.dart';

class SelectDoctorType extends StatefulWidget {
  const SelectDoctorType({Key? key}) : super(key: key);

  @override
  State<SelectDoctorType> createState() => _SelectDoctorTypeState();
}

class _SelectDoctorTypeState extends State<SelectDoctorType> {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<MainViewModel>.reactive(
      viewModelBuilder: () => locator<MainViewModel>(),
      disposeViewModel: false,
      onViewModelReady: (model) async {
        await model.gettingDoctorTypes(context);
      },
      builder: (context, model, child) {
        return model.doctorTypeCatLoader == true
            ? WholePageLoader()
            : GestureDetector(
                onTap: () => FocusScope.of(context).unfocus(),
                child: SafeArea(
                  top: false,
                  bottom: false,
                  child: Scaffold(
                    backgroundColor: Colors.white,
                    body: SingleChildScrollView(
                      child: Column(
                        children: [
                          Column(
                            children: [
                              SizedBox(
                                height: context.getPadding().top,
                              ),
                              BackSingleText(
                                backText: "Select Doctor Type",
                              ),
                            ],
                          ),
                          PageHorizontalMargin(
                            widget: Column(
                              children: [
                                SizedBox(
                                  child: ListView.separated(
                                    shrinkWrap: true,
                                    physics: BouncingScrollPhysics(),
                                    itemBuilder: (context, index) {
                                      return InkWell(
                                        onTap: () {
                                          Navigator.push(
                                              context,
                                              PageTransition(
                                                  type: PageTransitionType.fade,
                                                  child: PhysicalVisitBookSlot(
                                                    id: model
                                                            .doctorTypeModel?[
                                                                index]
                                                            .id ??
                                                        0,
                                                  )));
                                        },
                                        child: Row(
                                          children: [
                                            CachedNetworkImage(
                                                placeholder: (context, url) {
                                                  return Image.asset(
                                                      ImageUtils.stetescope);
                                                },
                                                width: 20.i,
                                                height: 20.i,
                                                //height: MediaQuery.of(context).size.height / 3,
                                                fit: BoxFit.cover,
                                                imageUrl: Constants.imageUrl +
                                                    model
                                                        .doctorTypeModel![index]
                                                        .image!,
                                                errorWidget: (context, url,
                                                        error) =>
                                                    Image.asset(
                                                        ImageUtils.stetescope)),
                                            SizedBox(
                                              width: 3.w,
                                            ),
                                            Expanded(
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    model
                                                            .doctorTypeModel?[
                                                                index]
                                                            .title ??
                                                        '',
                                                    style: TextStyle(
                                                      color: ColorUtils.red,
                                                      fontFamily:
                                                          FontUtils.poppinsBold,
                                                      fontSize: 1.8.t,
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    height: 0.75.h,
                                                  ),
                                                  Text(
                                                    model
                                                            .doctorTypeModel?[
                                                                index]
                                                            .description ??
                                                        '',
                                                    style: TextStyle(
                                                      color:
                                                          ColorUtils.blackShade,
                                                      fontFamily: FontUtils
                                                          .interRegular,
                                                      fontSize: 1.6.t,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            SizedBox(
                                              width: 2.w,
                                            ),
                                            ForwardButtonBlack(),
                                          ],
                                        ),
                                      );
                                    },
                                    separatorBuilder: (context, index) {
                                      return Divider(
                                        color: ColorUtils.silver,
                                      );
                                    },
                                    itemCount:
                                        model.doctorTypeModel?.length ?? 0,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              );
      },
    );
  }
}
