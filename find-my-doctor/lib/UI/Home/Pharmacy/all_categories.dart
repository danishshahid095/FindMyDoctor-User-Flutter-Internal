import 'package:cached_network_image/cached_network_image.dart';
import 'package:find_my_doctor/App/locator.dart';
import 'package:find_my_doctor/Utils/color_utils.dart';
import 'package:find_my_doctor/Utils/extensions.dart';
import 'package:find_my_doctor/Utils/font_utils.dart';
import 'package:find_my_doctor/Utils/image_utils.dart';
import 'package:find_my_doctor/ViewModels/main_view_model.dart';
import 'package:find_my_doctor/Widgets/back_with_signleText.dart';
import 'package:find_my_doctor/Widgets/margin_below_appbar.dart';
import 'package:find_my_doctor/Widgets/page_horizontal_margin.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:stacked/stacked.dart';

import '../../../Utils/constants.dart';
import '../../../Utils/whole_page_loader.dart';
import '../../../Widgets/text_widget.dart';

class AllPharmacyCategories extends StatefulWidget {
  const AllPharmacyCategories({Key? key}) : super(key: key);

  @override
  State<AllPharmacyCategories> createState() => _AllPharmacyCategoriesState();
}

class _AllPharmacyCategoriesState extends State<AllPharmacyCategories> {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<MainViewModel>.reactive(
      viewModelBuilder: () => locator<MainViewModel>(),
      disposeViewModel: false,
      onViewModelReady: (model) async{
        await model.gettingPharmacyCategory(context);
      },
      builder: (context, model, child) {
        return model.pharmacyCategoryLoader == true ? WholePageLoader() : GestureDetector(
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
                        backText: "Shop By Category",
                      ),
                      MarginBelowAppBar(),
                    ],
                  ),
                  Expanded(
                    child: SingleChildScrollView(
                      child: PageHorizontalMargin(
                        widget: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            TextField(
                              style: TextStyle(color: ColorUtils.silver2),
                              decoration: InputDecoration(
                                fillColor: ColorUtils.silver1,
                                filled: true,
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: ColorUtils.silver1),
                                  borderRadius:
                                  BorderRadius.all(Radius.circular(30.0)),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius:
                                  BorderRadius.all(Radius.circular(30.0)),
                                  borderSide: BorderSide(
                                      color: ColorUtils.silver1, width: 1.5),
                                ),
                                labelStyle:
                                const TextStyle(color: Color(0xFFDEDEDE)),
                                hintText: "Search Category",
                                hintStyle: TextStyle(
                                    fontFamily: FontUtils.interRegular,
                                    color: ColorUtils.silver2
                                ),
                                prefixIcon: Padding(
                                  padding: EdgeInsets.symmetric(horizontal: 14.0),
                                  child: SvgPicture.asset(
                                    ImageUtils.searchIcon,
                                    height: 1.i,
                                    width: 1.i,
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(height: 3.h,),
                            GridView.builder(
                              itemCount: model.allCategories.length,
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
                                  onTap: (){},
                                  child:
                                  Container(
                                    padding: EdgeInsets.symmetric(horizontal: 3.w),
                                    constraints: BoxConstraints(maxWidth: MediaQuery.of(context).size.width / 2),
                                    decoration: BoxDecoration(
                                      shape: BoxShape.rectangle,
                                      color: ColorUtils.silver1,
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                    child: Row(
                                      children: [
                                        CachedNetworkImage(
                                          placeholder: (context, url) {
                                            return Image.asset(ImageUtils.tablets);
                                          },
                                          width: 16.i,
                                          height: 16.i,
                                          fit: BoxFit.cover,
                                          imageUrl: model.pharmacyCategoryModel![index].image != null ? Constants.imageUrl + model.pharmacyCategoryModel![index].image! : '',
                                          errorWidget: (context, url, error) => Image.asset(ImageUtils.tablets),
                                        ),
                                        SizedBox(width: 8), // Add spacing between the image and text
                                        Expanded(
                                          child: TextWidget(
                                            textValue: model.pharmacyCategoryModel?[index].name.toString() ?? '',
                                            textColor: ColorUtils.blackShade,
                                            fontFamily: FontUtils.poppinsBold,
                                            fontSize: 2.t,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  // Container(
                                  //   decoration: BoxDecoration(
                                  //     shape: BoxShape.rectangle,
                                  //     borderRadius: BorderRadius.circular(8),
                                  //     color: ColorUtils.silver1,
                                  //   ),
                                  //   child: Padding(
                                  //     padding:
                                  //     EdgeInsets.symmetric(horizontal: 1.w),
                                  //     child: Row(
                                  //       children: [
                                  //         Image.asset(
                                  //           ImageUtils.tablets,
                                  //           width: 16.i,
                                  //           fit: BoxFit.cover,
                                  //         ),
                                  //         SizedBox(
                                  //           width: 1.w,
                                  //         ),
                                  //         Expanded(
                                  //           child: Align(
                                  //             alignment: Alignment.centerLeft,
                                  //             child: Text(
                                  //               model.allCategories[index],
                                  //               style: TextStyle(
                                  //                   fontFamily:
                                  //                   FontUtils.poppinsBold,
                                  //                   fontSize: 2.t,
                                  //                   color: ColorUtils.blackShade),
                                  //             ),
                                  //           ),
                                  //         )
                                  //       ],
                                  //     ),
                                  //   ),
                                  // ),
                                );
                              },
                            ),
                          ],
                        ),
                      ),
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
