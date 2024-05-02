import 'package:cached_network_image/cached_network_image.dart';
import 'package:find_my_doctor/App/locator.dart';
import 'package:find_my_doctor/UI/Home/BookDoctor/select_doctor.dart';
import 'package:find_my_doctor/Utils/color_utils.dart';
import 'package:find_my_doctor/Utils/extensions.dart';
import 'package:find_my_doctor/Utils/font_utils.dart';
import 'package:find_my_doctor/ViewModels/main_view_model.dart';
import 'package:find_my_doctor/Widgets/back_with_signleText.dart';
import 'package:find_my_doctor/Widgets/margin_below_appbar.dart';
import 'package:find_my_doctor/Widgets/page_horizontal_margin.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:stacked/stacked.dart';

import '../../../Utils/constants.dart';
import '../../../Utils/image_utils.dart';
import '../../../Utils/whole_page_loader.dart';

class SelectSpecialistCategory extends StatefulWidget {
  const SelectSpecialistCategory({Key? key}) : super(key: key);

  @override
  State<SelectSpecialistCategory> createState() => _SelectSpecialistCategoryState();
}

class _SelectSpecialistCategoryState extends State<SelectSpecialistCategory> {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<MainViewModel>.reactive(
      viewModelBuilder: () => locator<MainViewModel>(),
      disposeViewModel: false,
      onViewModelReady: (model) async{
        await model.getSpecialistCategory(context);
      },
      builder: (context, model, child) {
        return model.specialistCatLoader == true ? WholePageLoader() : GestureDetector(
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
                        backText: "Select Specialist Category",
                      ),
                    ],
                  ),
                  PageHorizontalMargin(
                    widget: Column(
                      children: [
                        // TextField(
                        //   style: TextStyle(color: ColorUtils.silver2),
                        //   decoration: InputDecoration(
                        //     fillColor: ColorUtils.silver1,
                        //     filled: true,
                        //     enabledBorder: OutlineInputBorder(
                        //       borderSide: BorderSide(color: ColorUtils.silver1),
                        //       borderRadius:
                        //       BorderRadius.all(Radius.circular(30.0)),
                        //     ),
                        //     focusedBorder: OutlineInputBorder(
                        //       borderRadius:
                        //       BorderRadius.all(Radius.circular(30.0)),
                        //       borderSide: BorderSide(
                        //           color: ColorUtils.silver1, width: 1.5),
                        //     ),
                        //     labelStyle:
                        //     const TextStyle(color: Color(0xFFDEDEDE)),
                        //     hintText: "Search",
                        //     hintStyle: TextStyle(
                        //         fontFamily: FontUtils.interRegular,
                        //         color: ColorUtils.silver2
                        //     ),
                        //     prefixIcon: Padding(
                        //       padding: EdgeInsets.symmetric(horizontal: 14.0),
                        //       child: SvgPicture.asset(
                        //         ImageUtils.searchIcon,
                        //         height: 1.i,
                        //         width: 1.i,
                        //       ),
                        //     ),
                        //   ),
                        // ),
                        //
                        SizedBox(height: 3.h,),
                        GridView.builder(
                          itemCount: model.specialistCategoryModel != null ? model.specialistCategoryModel!.length : 0,
                          padding: EdgeInsets.zero,
                          shrinkWrap: true,
                          primary: false,
                          gridDelegate:
                          SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              crossAxisSpacing: 10.0,
                              mainAxisSpacing: 10.0,
                              childAspectRatio: 1.7),
                          itemBuilder: (context, index) {
                            return GestureDetector(
                              onTap: (){
                                Navigator.push(context,
                                    PageTransition(type: PageTransitionType.fade, child:  SelectDoctor(categoryId: model.specialistCategoryModel?[index].id ?? 0,)));
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                  shape: BoxShape.rectangle,
                                  borderRadius: BorderRadius.circular(8),
                                  color: ColorUtils.silver1,
                                ),
                                child: Padding(
                                  padding:
                                  EdgeInsets.symmetric(horizontal: 1.w),
                                  child: Row(
                                    children: [
                                      CachedNetworkImage(
                                          placeholder: (context, url) {
                                            return Image.asset(ImageUtils.stetescope);
                                          },
                                          width: 16.i,
                                          //height: MediaQuery.of(context).size.height / 3,
                                          fit: BoxFit.cover,
                                          imageUrl: Constants.imageUrl+model.specialistCategoryModel![index].image!,
                                          errorWidget: (context, url, error) => Image.asset(ImageUtils.stetescope)
                                      ),
                                      SizedBox(
                                        width: 1.w,
                                      ),
                                      Expanded(
                                        child: Align(
                                          alignment: Alignment.centerLeft,
                                          child: Text(
                                            model.specialistCategoryModel![index].title!,
                                            style: TextStyle(
                                                fontFamily:
                                                FontUtils.poppinsBold,
                                                fontSize: 2.t,
                                                color: ColorUtils.blackShade),
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                      ],
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
