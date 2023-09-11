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

class AllPharmacyBrand extends StatefulWidget {
  const AllPharmacyBrand({Key? key}) : super(key: key);

  @override
  State<AllPharmacyBrand> createState() => _AllPharmacyBrandState();
}

class _AllPharmacyBrandState extends State<AllPharmacyBrand> {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<MainViewModel>.reactive(
      viewModelBuilder: () => locator<MainViewModel>(),
      disposeViewModel: false,
      onViewModelReady: (model) async{
        await model.gettingPharmacyBrands(context);
      },
      builder: (context, model, child) {
        return model.pharmacyBrandsLoader == true ? WholePageLoader() : GestureDetector(
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
                        backText: "Shop By Brands",
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
                                hintText: "Search Brand",
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
                              itemCount: model.allBrands.length,
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
                                  child: Container(
                                    padding: EdgeInsets.symmetric(horizontal: 3.w),
                                    constraints: BoxConstraints(maxWidth: MediaQuery.of(context).size.width - 164),
                                    decoration: BoxDecoration(
                                      shape: BoxShape.rectangle,
                                      color: ColorUtils.silver1,
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                    child: Padding(
                                      padding: EdgeInsets.only(
                                          left: 3.w, right: 3.w),
                                      child: CachedNetworkImage(
                                        placeholder: (context, url) {
                                          return Image.asset(ImageUtils.tablets);
                                        },
                                        width: 45.i,
                                        height: 45.i,
                                        fit: BoxFit.cover,
                                        imageUrl: model.pharmacyBrandsModel![index].logo != null ? Constants.imageUrl + model.pharmacyBrandsModel![index].logo! : '',
                                        errorWidget: (context, url, error) => Image.asset(ImageUtils.tablets),
                                      ),
                                    ),
                                  ),
                                );
                              },
                            )
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
