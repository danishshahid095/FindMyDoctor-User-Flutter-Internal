import 'package:cached_network_image/cached_network_image.dart';
import 'package:expand_tap_area/expand_tap_area.dart';
import 'package:find_my_doctor/App/locator.dart';
import 'package:find_my_doctor/UI/Home/Pharmacy/all_brand.dart';
import 'package:find_my_doctor/UI/Home/Pharmacy/all_categories.dart';
import 'package:find_my_doctor/UI/Home/Pharmacy/medicine_details.dart';
import 'package:find_my_doctor/UI/Home/Pharmacy/pharmacy_confirm_details.dart';
import 'package:find_my_doctor/Utils/color_utils.dart';
import 'package:find_my_doctor/Utils/extensions.dart';
import 'package:find_my_doctor/Utils/font_utils.dart';
import 'package:find_my_doctor/Utils/image_utils.dart';
import 'package:find_my_doctor/ViewModels/main_view_model.dart';
import 'package:find_my_doctor/Widgets/page_horizontal_margin.dart';
import 'package:find_my_doctor/Widgets/text_widget.dart';
import 'package:find_my_doctor/Widgets/top_margin_home.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:page_transition/page_transition.dart';
import 'package:stacked/stacked.dart';

import '../../../Utils/constants.dart';
import '../../../Utils/whole_page_loader.dart';
import 'category_product_list.dart';

class SearchMedicine extends StatefulWidget {
  const SearchMedicine({Key? key}) : super(key: key);

  @override
  State<SearchMedicine> createState() => _SearchMedicineState();
}

class _SearchMedicineState extends State<SearchMedicine> {
  var ind;
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<MainViewModel>.reactive(
      viewModelBuilder: () => locator<MainViewModel>(),
      disposeViewModel: false,
      onViewModelReady: (model) async {
        await model.gettingPharmacyBrands(context);
        await model.gettingPharmacyCategory(context);
        await model.gettingPharmacyBestSellers(context);
        await model.gettingPharmacyFrequntly(context);
      },
      builder: (context, model, child) {
        return model.pharmacyBrandsLoader == true ||
                model.pharmacyCategoryLoader == true ||
                model.pharmacyBestSellerLoader == true ||
                model.pharmacyFreq
            ? WholePageLoader()
            : GestureDetector(
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
                                    offset: Offset(
                                        0, 3), // changes position of shadow
                                  ),
                                ],
                              ),
                              child: Padding(
                                padding: EdgeInsets.only(
                                    left: 3.w, top: 2.h, right: 3.w),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
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
                                          textValue: "Search Medicines",
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
                                                  child:
                                                      PharmacyConfirmDetails()));
                                        },
                                        child: SvgPicture.asset(
                                            ImageUtils.basket)),
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
                                PageHorizontalMargin(
                                  widget: Column(
                                    children: [
                                      Image.asset(ImageUtils.pharmacyAd),
                                      SizedBox(
                                        height: 2.h,
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          TextWidget(
                                            textValue: "Categories",
                                            fontFamily: FontUtils.poppinsBold,
                                            fontSize: 2.t,
                                            textColor: ColorUtils.red,
                                          ),
                                          GestureDetector(
                                            onTap: () {
                                              Navigator.push(
                                                  context,
                                                  PageTransition(
                                                      type: PageTransitionType
                                                          .fade,
                                                      child:
                                                          AllPharmacyCategories()));
                                            },
                                            child: TextWidget(
                                              textValue: "View All",
                                              fontFamily:
                                                  FontUtils.interSemiBold,
                                              fontSize: 2.t,
                                              textColor: ColorUtils.red,
                                            ),
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                        height: 2.5.h,
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  height: 15.h,
                                  child: ListView.builder(
                                      physics: BouncingScrollPhysics(),
                                      scrollDirection: Axis.horizontal,
                                      itemBuilder: (context, index) {
                                        ind = index;
                                        return InkWell(
                                          onTap: () {
                                            Navigator.push(
                                                context,
                                                PageTransition(
                                                    type:
                                                        PageTransitionType.fade,
                                                    child: CategoryProductList(
                                                      categoryId: model
                                                              .pharmacyCategoryModel?[
                                                                  index]
                                                              .id ??
                                                          0,
                                                    )));
                                          },
                                          child: Container(
                                            padding: EdgeInsets.symmetric(
                                                horizontal: 3.w),
                                            margin: EdgeInsets.only(left: 3.w),
                                            constraints: BoxConstraints(
                                                maxWidth: MediaQuery.of(context)
                                                        .size
                                                        .width -
                                                    164),
                                            decoration: BoxDecoration(
                                              shape: BoxShape.rectangle,
                                              color: ColorUtils.silver1,
                                              borderRadius:
                                                  BorderRadius.circular(8),
                                            ),
                                            child: Row(
                                              children: [
                                                CachedNetworkImage(
                                                  placeholder: (context, url) {
                                                    return Image.asset(
                                                        ImageUtils.tablets);
                                                  },
                                                  width: 16.i,
                                                  height: 16.i,
                                                  fit: BoxFit.cover,
                                                  imageUrl: model
                                                              .pharmacyCategoryModel![
                                                                  index]
                                                              .image !=
                                                          null
                                                      ? Constants.imageUrl +
                                                          model
                                                              .pharmacyCategoryModel![
                                                                  index]
                                                              .image!
                                                      : '',
                                                  errorWidget: (context, url,
                                                          error) =>
                                                      Image.asset(
                                                          ImageUtils.tablets),
                                                ),
                                                SizedBox(
                                                    width:
                                                        8), // Add spacing between the image and text
                                                Expanded(
                                                  child: TextWidget(
                                                    textValue: model
                                                            .pharmacyCategoryModel?[
                                                                index]
                                                            .name
                                                            .toString() ??
                                                        '',
                                                    textColor:
                                                        ColorUtils.blackShade,
                                                    fontFamily:
                                                        FontUtils.poppinsBold,
                                                    fontSize: 2.t,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        );
                                      },
                                      itemCount:
                                          model.pharmacyCategoryModel?.length ??
                                              0),
                                ),

                                // Best Seller
                                PageHorizontalMargin(
                                  widget: Column(
                                    children: [
                                      SizedBox(
                                        height: 2.h,
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          TextWidget(
                                            textValue: "Best Sellers",
                                            fontFamily: FontUtils.poppinsBold,
                                            fontSize: 2.t,
                                            textColor: ColorUtils.red,
                                          ),
                                          InkWell(
                                            onTap: () {
                                              Navigator.push(
                                                  context,
                                                  PageTransition(
                                                      type: PageTransitionType
                                                          .fade,
                                                      child:
                                                          CategoryProductList(
                                                        categoryId: model
                                                                .pharmacyCategoryModel?[
                                                                    ind]
                                                                .id ??
                                                            0,
                                                      )));
                                            },
                                            child: TextWidget(
                                              textValue: "View More",
                                              fontFamily:
                                                  FontUtils.interSemiBold,
                                              fontSize: 2.t,
                                              textColor: ColorUtils.red,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  height: 1.h,
                                ),
                                SizedBox(
                                  height: 30.h,
                                  child: ListView.builder(
                                      physics: BouncingScrollPhysics(),
                                      scrollDirection: Axis.horizontal,
                                      itemBuilder: (context, index) {
                                        return InkWell(
                                          onTap: () {
                                            Navigator.push(
                                                context,
                                                PageTransition(
                                                    type:
                                                        PageTransitionType.fade,
                                                    child: MedicineDetails(
                                                        prodcutId: model
                                                            .pharmacyBestSellerModel![
                                                                index]
                                                            .id
                                                            .toString())));
                                          },
                                          child: Container(
                                            padding: EdgeInsets.symmetric(
                                                horizontal: 2.w),
                                            margin: EdgeInsets.only(left: 3.w),
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Row(
                                                  mainAxisSize:
                                                      MainAxisSize.min,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.end,
                                                  children: [
                                                    CachedNetworkImage(
                                                      placeholder:
                                                          (context, url) {
                                                        return Image.asset(
                                                            ImageUtils.tablets);
                                                      },
                                                      width: 35.i,
                                                      height: 35.i,
                                                      fit: BoxFit.cover,
                                                      imageUrl: model
                                                                  .pharmacyBestSellerModel?[
                                                                      index]
                                                                  .featured_img !=
                                                              null
                                                          ? Constants.imageUrl +
                                                              model
                                                                  .pharmacyBestSellerModel![
                                                                      index]
                                                                  .featured_img!
                                                          : '',
                                                      errorWidget: (context,
                                                              url, error) =>
                                                          Image.asset(ImageUtils
                                                              .tablets),
                                                    ),
                                                    InkWell(
                                                      onTap: () {
                                                        Navigator.push(
                                                            context,
                                                            PageTransition(
                                                                type:
                                                                    PageTransitionType
                                                                        .fade,
                                                                child:
                                                                    MedicineDetails(
                                                                  img: model
                                                                      .pharmacyBestSellerModel![
                                                                          index]
                                                                      .featured_img
                                                                      .toString(),
                                                                  prodcutId: model
                                                                      .pharmacyBestSellerModel![
                                                                          index]
                                                                      .id
                                                                      .toString(),
                                                                )));
                                                      },
                                                      child: Container(
                                                        decoration:
                                                            BoxDecoration(
                                                          shape:
                                                              BoxShape.circle,
                                                          color: ColorUtils.red,
                                                        ),
                                                        child: Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                  .all(4.0),
                                                          child: Icon(
                                                            Icons.add,
                                                            color: ColorUtils
                                                                .white,
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                SizedBox(
                                                  height: 1.5.h,
                                                ),
                                                Row(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Column(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        TextWidget(
                                                          textValue: model
                                                              .pharmacyBestSellerModel?[
                                                                  index]
                                                              .name,
                                                          fontFamily: FontUtils
                                                              .interSemiBold,
                                                          fontSize: 1.8.t,
                                                          textColor: ColorUtils
                                                              .blackShade,
                                                        ),
                                                        // TextWidget(
                                                        //   textValue: model
                                                        //       .pharmacyBestSellerModel?[
                                                        //           index]
                                                        //       .quantity
                                                        //       .toString(),
                                                        //   fontFamily: FontUtils
                                                        //       .interMedium,
                                                        //   fontSize: 1.6.t,
                                                        //   textColor: ColorUtils
                                                        //       .silver2,
                                                        // ),
                                                        SizedBox(
                                                          height: 1.h,
                                                        ),
                                                        TextWidget(
                                                          textValue:
                                                              'Rs.' + (model.pharmacyBestSellerModel![index].discounted_price == 0.0 ? model.pharmacyBestSellerModel![index].price.toString() : (model.pharmacyBestSellerModel![index].price!.toDouble()-((model.pharmacyBestSellerModel![index].price!.toDouble()/100.0)*model.pharmacyBestSellerModel![index].discounted_price!.toDouble())).toString()),
                                                          fontFamily: FontUtils
                                                              .interBold,
                                                          fontSize: 2.2.t,
                                                          textColor:
                                                              ColorUtils.red,
                                                        ),
                                                        if (model.pharmacyBestSellerModel![index].price! > 0 && model.pharmacyBestSellerModel![index].discounted_price! != 0.0)
                                                        Text(
                                                          "\Rs. ${model.pharmacyBestSellerModel![index].price.toString()}",
                                                          style: TextStyle(
                                                            fontFamily: FontUtils
                                                                .interMedium,
                                                            fontSize: 1.4.t,
                                                            color: ColorUtils
                                                                .silver2,
                                                            decoration:
                                                                TextDecoration
                                                                    .lineThrough,
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                    SizedBox(
                                                      width: 16.w,
                                                    ),
                                                    SvgPicture.asset(ImageUtils
                                                        .redHeartBorder),
                                                  ],
                                                ),
                                              ],
                                            ),
                                          ),
                                        );
                                      },
                                      itemCount: model.pharmacyBestSellerModel
                                              ?.length ??
                                          0),
                                ),

                                // Frequently Bought
                                PageHorizontalMargin(
                                  widget: Column(
                                    children: [
                                      SizedBox(
                                        height: 2.h,
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          TextWidget(
                                            textValue: "Frequently Bought",
                                            fontFamily: FontUtils.poppinsBold,
                                            fontSize: 2.t,
                                            textColor: ColorUtils.red,
                                          ),
                                          InkWell(
                                            onTap: () {
                                              Navigator.push(
                                                  context,
                                                  PageTransition(
                                                      type: PageTransitionType
                                                          .fade,
                                                      child:
                                                          CategoryProductList(
                                                        categoryId: model
                                                                .pharmacyCategoryModel?[
                                                                    ind]
                                                                .id ??
                                                            0,
                                                      )));
                                            },
                                            child: TextWidget(
                                              textValue: "View More",
                                              fontFamily:
                                                  FontUtils.interSemiBold,
                                              fontSize: 2.t,
                                              textColor: ColorUtils.red,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  height: 1.h,
                                ),
                                SizedBox(
                                  height: 30.h,
                                  child: ListView.builder(
                                      physics: BouncingScrollPhysics(),
                                      scrollDirection: Axis.horizontal,
                                      itemBuilder: (context, index) {
                                        return InkWell(
                                          onTap: () {
                                            Navigator.push(
                                                context,
                                                PageTransition(
                                                    type:
                                                        PageTransitionType.fade,
                                                    child: MedicineDetails(
                                                      img: model
                                                          .pharmacyFreqModel![
                                                              index]
                                                          .featured_img
                                                          .toString(),
                                                      prodcutId: model
                                                          .pharmacyFreqModel![
                                                              index]
                                                          .id
                                                          .toString(),
                                                    )));
                                          },
                                          child: Container(
                                            padding: EdgeInsets.symmetric(
                                                horizontal: 2.w),
                                            margin: EdgeInsets.only(left: 3.w),
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Row(
                                                  mainAxisSize:
                                                      MainAxisSize.min,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.end,
                                                  children: [
                                                    CachedNetworkImage(
                                                      placeholder:
                                                          (context, url) {
                                                        return Image.asset(
                                                            ImageUtils.tablets);
                                                      },
                                                      width: 35.i,
                                                      height: 35.i,
                                                      fit: BoxFit.cover,
                                                      imageUrl: model
                                                                  .pharmacyFreqModel?[
                                                                      index]
                                                                  .featured_img !=
                                                              null
                                                          ? Constants.imageUrl +
                                                              model
                                                                  .pharmacyFreqModel![
                                                                      index]
                                                                  .featured_img!
                                                          : '',
                                                      errorWidget: (context,
                                                              url, error) =>
                                                          Image.asset(ImageUtils
                                                              .tablets),
                                                    ),
                                                    InkWell(
                                                      onTap: () {
                                                        Navigator.push(
                                                            context,
                                                            PageTransition(
                                                                type:
                                                                    PageTransitionType
                                                                        .fade,
                                                                child:
                                                                    MedicineDetails(
                                                                  img: model
                                                                      .pharmacyFreqModel![
                                                                          index]
                                                                      .featured_img
                                                                      .toString(),
                                                                  prodcutId: model
                                                                      .pharmacyFreqModel![
                                                                          index]
                                                                      .id
                                                                      .toString(),
                                                                )));
                                                      },
                                                      child: Container(
                                                        decoration:
                                                            BoxDecoration(
                                                          shape:
                                                              BoxShape.circle,
                                                          color: ColorUtils.red,
                                                        ),
                                                        child: Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                  .all(4.0),
                                                          child: Icon(
                                                            Icons.add,
                                                            color: ColorUtils
                                                                .white,
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                SizedBox(
                                                  height: 1.5.h,
                                                ),
                                                Row(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [

                                                    Column(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                          Container(
                                                            width: 30.w,
                                                            child: Text(model.pharmacyFreqModel?[index].name ?? "",
                                                            style: TextStyle(
                                                              fontFamily: FontUtils
                                                                  .interSemiBold,
                                                              fontSize: 1.8.t,
                                                              color: ColorUtils
                                                                  .blackShade,
                                                              overflow: TextOverflow.ellipsis,
                                                            ),
                                                              softWrap: true,
                                                              maxLines: 1,
                                                            ),
                                                          ),
                                                        // TextWidget(
                                                        //   textValue: model
                                                        //       .pharmacyFreqModel?[
                                                        //           index]
                                                        //       .quantity
                                                        //       .toString(),
                                                        //   fontFamily: FontUtils
                                                        //       .interMedium,
                                                        //   fontSize: 1.6.t,
                                                        //   textColor:
                                                        //       ColorUtils.silver2,
                                                        // ),
                                                        TextWidget(
                                                          textValue: 'Rs. ' + (model.pharmacyFreqModel![index].discounted_price == 0.0 ? model.pharmacyFreqModel![index].price.toString() : (model.pharmacyFreqModel![index].price!.toDouble()-((model.pharmacyFreqModel![index].price!.toDouble()/100.0)*model.pharmacyFreqModel![index].discounted_price!.toDouble())).toString()),
                                                          fontFamily: FontUtils
                                                              .interBold,
                                                          fontSize: 2.2.t,
                                                          textColor:
                                                              ColorUtils.red,
                                                        ),
                                                        SizedBox(
                                                          height: 1.h,
                                                        ),
                                                        if (model.pharmacyFreqModel![index].price! > 0 && model.pharmacyFreqModel![index].discounted_price != 0.0)
                                                        Text(
                                                          "\Rs. ${model.pharmacyFreqModel![index].price.toString()}",
                                                          style: TextStyle(
                                                            fontFamily: FontUtils
                                                                .interMedium,
                                                            fontSize: 1.4.t,
                                                            color: ColorUtils
                                                                .silver2,
                                                            decoration:
                                                                TextDecoration
                                                                    .lineThrough,
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                    SizedBox(
                                                      width: 16.w,
                                                    ),
                                                    SvgPicture.asset(ImageUtils
                                                        .redHeartBorder),
                                                  ],
                                                ),
                                              ],
                                            ),
                                          ),
                                        );

                                        // Container(
                                        //   margin: EdgeInsets.only(left: 3.w),
                                        //   child: Column(
                                        //     crossAxisAlignment:
                                        //         CrossAxisAlignment.start,
                                        //     children: [
                                        //       Row(
                                        //         mainAxisSize: MainAxisSize.min,
                                        //         crossAxisAlignment:
                                        //             CrossAxisAlignment.end,
                                        //         children: [
                                        //           Image.asset(
                                        //             model.pharmacyFrequentlyBought[
                                        //                 index]["image"],
                                        //             width: 35.i,
                                        //             fit: BoxFit.cover,
                                        //           ),
                                        //           Container(
                                        //             decoration: BoxDecoration(
                                        //               shape: BoxShape.circle,
                                        //               color: ColorUtils.red,
                                        //             ),
                                        //             child: Padding(
                                        //               padding:
                                        //                   const EdgeInsets.all(
                                        //                       4.0),
                                        //               child: Icon(
                                        //                 Icons.add,
                                        //                 color: ColorUtils.white,
                                        //               ),
                                        //             ),
                                        //           ),
                                        //         ],
                                        //       ),
                                        //       Row(
                                        //         crossAxisAlignment:
                                        //             CrossAxisAlignment.start,
                                        //         children: [
                                        //           Column(
                                        //             crossAxisAlignment:
                                        //                 CrossAxisAlignment
                                        //                     .start,
                                        //             children: [
                                        //               TextWidget(
                                        //                 textValue: model
                                        //                         .pharmacyFrequentlyBought[
                                        //                     index]["name"],
                                        //                 fontFamily: FontUtils
                                        //                     .interSemiBold,
                                        //                 fontSize: 1.8.t,
                                        //                 textColor: ColorUtils
                                        //                     .blackShade,
                                        //               ),
                                        //               TextWidget(
                                        //                 textValue: model
                                        //                         .pharmacyFrequentlyBought[
                                        //                     index]["quantity"],
                                        //                 fontFamily: FontUtils
                                        //                     .interMedium,
                                        //                 fontSize: 1.6.t,
                                        //                 textColor:
                                        //                     ColorUtils.silver2,
                                        //               ),
                                        //               SizedBox(
                                        //                 height: 1.h,
                                        //               ),
                                        //               TextWidget(
                                        //                 textValue: model
                                        //                         .pharmacyFrequentlyBought[
                                        //                     index]["price"],
                                        //                 fontFamily:
                                        //                     FontUtils.interBold,
                                        //                 fontSize: 2.2.t,
                                        //                 textColor:
                                        //                     ColorUtils.red,
                                        //               ),
                                        //               Text(
                                        //                 "\$8.99",
                                        //                 style: TextStyle(
                                        //                   fontFamily: FontUtils
                                        //                       .interMedium,
                                        //                   fontSize: 1.4.t,
                                        //                   color: ColorUtils
                                        //                       .silver2,
                                        //                   decoration:
                                        //                       TextDecoration
                                        //                           .lineThrough,
                                        //                 ),
                                        //               ),
                                        //             ],
                                        //           ),
                                        //           SizedBox(
                                        //             width: 2.w,
                                        //           ),
                                        //           SvgPicture.asset(ImageUtils
                                        //               .redHeartBorder),
                                        //         ],
                                        //       ),
                                        //     ],
                                        //   ),
                                        // );
                                      },
                                      itemCount:
                                          model.pharmacyFreqModel?.length ?? 0),
                                ),

                                // Brands
                                PageHorizontalMargin(
                                  widget: Column(
                                    children: [
                                      SizedBox(
                                        height: 2.h,
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          TextWidget(
                                            textValue: "Brands",
                                            fontFamily: FontUtils.poppinsBold,
                                            fontSize: 2.t,
                                            textColor: ColorUtils.red,
                                          ),
                                          GestureDetector(
                                            onTap: () {
                                              Navigator.push(
                                                  context,
                                                  PageTransition(
                                                      type: PageTransitionType
                                                          .fade,
                                                      child:
                                                          AllPharmacyBrand()));
                                            },
                                            child: TextWidget(
                                              textValue: "View All",
                                              fontFamily:
                                                  FontUtils.interSemiBold,
                                              fontSize: 2.t,
                                              textColor: ColorUtils.red,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  height: 1.5.h,
                                ),
                                SizedBox(
                                  height: 13.h,
                                  child: ListView.builder(
                                      physics: BouncingScrollPhysics(),
                                      scrollDirection: Axis.horizontal,
                                      itemBuilder: (context, index) {
                                        return Container(
                                          padding: EdgeInsets.symmetric(
                                              horizontal: 3.w),
                                          margin: EdgeInsets.only(left: 3.w),
                                          constraints: BoxConstraints(
                                              maxWidth: MediaQuery.of(context)
                                                      .size
                                                      .width -
                                                  164),
                                          decoration: BoxDecoration(
                                            shape: BoxShape.rectangle,
                                            color: ColorUtils.silver1,
                                            borderRadius:
                                                BorderRadius.circular(8),
                                          ),
                                          child: Padding(
                                            padding: EdgeInsets.only(
                                                left: 3.w, right: 3.w),
                                            child: CachedNetworkImage(
                                              placeholder: (context, url) {
                                                return Image.asset(
                                                    ImageUtils.tablets);
                                              },
                                              width: 45.i,
                                              height: 45.i,
                                              fit: BoxFit.cover,
                                              imageUrl: model
                                                          .pharmacyBrandsModel![
                                                              index]
                                                          .logo !=
                                                      null
                                                  ? Constants.imageUrl +
                                                      model
                                                          .pharmacyBrandsModel![
                                                              index]
                                                          .logo!
                                                  : '',
                                              errorWidget:
                                                  (context, url, error) =>
                                                      Image.asset(
                                                          ImageUtils.tablets),
                                            ),
                                          ),
                                        );
                                      },
                                      itemCount:
                                          model.pharmacyBrandsModel?.length ??
                                              0),
                                ),
                                SizedBox(
                                  height: 1.h,
                                ),
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
