import 'package:cached_network_image/cached_network_image.dart';
import 'package:expand_tap_area/expand_tap_area.dart';
import 'package:find_my_doctor/App/locator.dart';
import 'package:find_my_doctor/UI/Home/Pharmacy/medicine_details.dart';
import 'package:find_my_doctor/UI/Home/Pharmacy/pharmacy_confirm_details.dart';
import 'package:find_my_doctor/Utils/color_utils.dart';
import 'package:find_my_doctor/Utils/extensions.dart';
import 'package:find_my_doctor/Utils/font_utils.dart';
import 'package:find_my_doctor/Utils/image_utils.dart';
import 'package:find_my_doctor/ViewModels/main_view_model.dart';
import 'package:find_my_doctor/Widgets/text_widget.dart';
import 'package:find_my_doctor/Widgets/top_margin_home.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:page_transition/page_transition.dart';
import 'package:stacked/stacked.dart';

import '../../../Utils/constants.dart';
import '../../../Utils/whole_page_loader.dart';

class CategoryProductList extends StatefulWidget {

  int categoryId;
  CategoryProductList({required this.categoryId,  Key? key}) : super(key: key);

  @override
  State<CategoryProductList> createState() => _CategoryProductListState();
}


class _CategoryProductListState extends State<CategoryProductList> {

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<MainViewModel>.reactive(
      viewModelBuilder: () => locator<MainViewModel>(),
      disposeViewModel: false,
      onViewModelReady: (model) async{
        await model.gettingPharmacyProductByCategory(context, widget.categoryId);
      },
      builder: (context, model, child) {
        return model.pharmacyProductByCategoryLoader == true ? WholePageLoader() : GestureDetector(
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
                      Container(
                        height: 10.h,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.5),
                              spreadRadius: 3,
                              blurRadius: 7,
                              offset:
                              Offset(0, 3), // changes position of shadow
                            ),
                          ],
                        ),
                        child: Padding(
                          padding:
                          EdgeInsets.only(left: 3.w, top: 2.h, right: 3.w),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  ExpandTapWidget(
                                    onTap: () {
                                      Navigator.pop(context);
                                    },
                                    tapPadding: EdgeInsets.all(50),
                                    child: SvgPicture.asset(
                                        ImageUtils.backArrowRed),
                                  ),
                                  SizedBox(
                                    width: 4.w,
                                  ),
                                  TextWidget(
                                    textValue: "Product List",
                                    fontFamily: FontUtils.interSemiBold,
                                    fontSize: 2.t,
                                    textColor: ColorUtils.red,
                                  ),
                                ],
                              ),
                              GestureDetector(
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        PageTransition(
                                            type: PageTransitionType.fade,
                                            child: PharmacyConfirmDetails()));
                                  },
                                  child: SvgPicture.asset(ImageUtils.basket)),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  Expanded(
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          TopMarginHome(),
                          SizedBox(
                            height: 4.h,
                          ),
                          GridView.builder(
                            padding: EdgeInsets.zero,
                            shrinkWrap: true,
                            primary: false,
                            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2,
                                crossAxisSpacing: 10.0,
                                mainAxisSpacing: 10.0,
                                childAspectRatio: 0.8),
                            itemBuilder: (context, index) {
                              return Container(
                                margin: EdgeInsets.only(left: 3.w),
                                child: Column(
                                  crossAxisAlignment:
                                  CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      mainAxisSize: MainAxisSize.min,
                                      crossAxisAlignment:
                                      CrossAxisAlignment.end,
                                      children: [
                                        CachedNetworkImage(
                                          placeholder: (context, url) {
                                            return Image.asset(ImageUtils.tablets);
                                          },
                                          width: 35.i,
                                          height: 35.i,
                                          fit: BoxFit.cover,
                                          imageUrl: model.pharmacyProductByCategoryModel?[index].featuredImg != null ? Constants.imageUrl + model.pharmacyProductByCategoryModel![index].featuredImg! : '',
                                          errorWidget: (context, url, error) => Image.asset(ImageUtils.tablets),
                                        ),
                                        InkWell(
                                          onTap: () {
                                            Navigator.push(
                                                context,
                                                PageTransition(
                                                    type: PageTransitionType
                                                        .fade,
                                                    child:
                                                    MedicineDetails()));
                                          },
                                          child: Container(
                                            decoration: BoxDecoration(
                                              shape: BoxShape.circle,
                                              color: ColorUtils.red,
                                            ),
                                            child: Icon(
                                              Icons.add,
                                              color: ColorUtils.white,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      height: 2.h,
                                    ),
                                    Row(
                                      crossAxisAlignment:
                                      CrossAxisAlignment.start,
                                      children: [
                                        Column(
                                          crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                          children: [
                                            TextWidget(
                                              textValue:
                                              model.pharmacyProductByCategoryModel?[
                                              index].name,
                                              fontFamily:
                                              FontUtils.interSemiBold,
                                              fontSize: 1.8.t,
                                              textColor:
                                              ColorUtils.blackShade,
                                            ),
                                            TextWidget(
                                              textValue:
                                              model.pharmacyProductByCategoryModel?[index].quantity.toString(),
                                              fontFamily:
                                              FontUtils.interMedium,
                                              fontSize: 1.6.t,
                                              textColor: ColorUtils.silver2,
                                            ),
                                            SizedBox(
                                              height: 1.h,
                                            ),
                                            TextWidget(
                                              textValue:
                                              model.pharmacyProductByCategoryModel?[
                                              index].discountedPrice.toString(),
                                              fontFamily:
                                              FontUtils.interBold,
                                              fontSize: 2.2.t,
                                              textColor: ColorUtils.red,
                                            ),
                                            // Text(
                                            //   "\PKR 900",
                                            //   style: TextStyle(
                                            //     fontFamily:
                                            //         FontUtils.interMedium,
                                            //     fontSize: 1.4.t,
                                            //     color: ColorUtils.silver2,
                                            //     decoration: TextDecoration
                                            //         .lineThrough,
                                            //   ),
                                            // ),
                                          ],
                                        ),
                                        SizedBox(
                                          width: 8.w,
                                        ),
                                        SvgPicture.asset(
                                            ImageUtils.redHeartBorder),
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        Text(
                                          model.pharmacyProductByCategoryModel?[index].price.toString() ?? "0",
                                          style: TextStyle(
                                            fontFamily:
                                            FontUtils.interMedium,
                                            fontSize: 1.4.t,
                                            color: ColorUtils.silver2,
                                            decoration:
                                            TextDecoration.lineThrough,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              );
                            },
                            itemCount: model.pharmacyProductByCategoryModel?.length ?? 0,
                          ),
                          // SizedBox(
                          //   height: 1.5.h,
                          // ),
                        ],
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
