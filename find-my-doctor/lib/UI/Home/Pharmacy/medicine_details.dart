import 'dart:convert';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:expand_tap_area/expand_tap_area.dart';
import 'package:find_my_doctor/App/locator.dart';
import 'package:find_my_doctor/UI/Home/Pharmacy/pharmacy_confirm_details.dart';
import 'package:find_my_doctor/Utils/color_utils.dart';
import 'package:find_my_doctor/Utils/constants.dart';
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
import 'package:shared_preferences/shared_preferences.dart';
import 'package:stacked/stacked.dart';

class MedicineDetails extends StatefulWidget {
  String? img;
  String prodcutId;
  MedicineDetails({Key? key, required this.prodcutId, this.img})
      : super(key: key);

  @override
  State<MedicineDetails> createState() => _MedicineDetailsState();
}

class _MedicineDetailsState extends State<MedicineDetails> {
  // @override
  // void initState() {
  //   // TODO: implement initState
  //   super.initState();
  //   getData();
  // }

  int count = 1;

  List<String> items = [];
  void increment() {
    setState(() {
      count++;
    });
  }

  void decrement() {
    setState(() {
      if (count > 1) {
        count--;
      }
    });
  }

// save shareprfance data
  void saveData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    // Create a list of maps to represent your data
    List<Map<String, dynamic>> cartItems = [
      {"id": widget.prodcutId, "quantity": count},
      // Add more items as needed
    ];

    // Convert the list of maps to a JSON string
    String cartItemsJson = jsonEncode(cartItems);

    // Save the JSON string to SharedPreferences
    await prefs.setString('cartItems', cartItemsJson);

    // You can also save individual values like this:
    await prefs.setString('id', widget.prodcutId);
    await prefs.setInt('count', 1);
    print(cartItems);
  }

  void getData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    // Retrieve the JSON string from SharedPreferences
    String? cartItemsJson = prefs.getString('cartItems');

    if (cartItemsJson != null) {
      // Parse the JSON string back to a list of maps
      //List<Map<String, dynamic>> cartItems = jsonDecode(cartItemsJson);
      List<Map<String, dynamic>> cartItems =
          (jsonDecode(cartItemsJson) as List<dynamic>)
              .cast<Map<String, dynamic>>()
              .toList();
      // Access individual values
      String? id = (prefs.getString('id') ?? 0)
          as String?; // Use 0 as a default value if not found
      int count = prefs.getInt('count') ?? 0;

      // Use the data as needed
      print('ID: $id');
      print('Count: $count');
      print('Cart Items: $cartItems');
    } else {
      print('No data found in SharedPreferences');
    }
  }

  String? id;

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<MainViewModel>.reactive(
      viewModelBuilder: () => locator<MainViewModel>(),
      disposeViewModel: false,
      onModelReady: (model) async {
        model.prodDetials(
            context, model.prefService.userToken, widget.prodcutId);
      },
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
                      // Text(widget.prodcutId),
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
                                    textValue: " Medicines Details",
                                    fontFamily: FontUtils.interSemiBold,
                                    fontSize: 2.t,
                                    textColor: ColorUtils.red,
                                  ),
                                ],
                              ),
                              GestureDetector(
                                  onTap: () {
                                    //getData();
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
                  model.loadingWidget
                      ? Center(child: Text('loading......'))
                      : Expanded(
                          child: SingleChildScrollView(
                            child: Column(
                              children: [
                                TopMarginHome(),
                                PageHorizontalMargin(
                                  widget: Column(
                                    children: [
                                      // Image.asset(model
                                      //         .prodmodel.data!.featured_img
                                      //         .toString()
                                      //     //ImageUtils.panadol
                                      //     ),
                                      CachedNetworkImage(
                                        placeholder: (context, url) {
                                          return Image.asset(
                                              ImageUtils.tablets);
                                        },
                                        width: 35.i,
                                        height: 35.i,
                                        fit: BoxFit.cover,
                                        imageUrl: model.prodmodel.data!
                                                    .featured_img !=
                                                null
                                            ? Constants.imageUrl +
                                                model.prodmodel.data!
                                                    .featured_img
                                                    .toString()
                                            : '',
                                        errorWidget: (context, url, error) =>
                                            Image.asset(ImageUtils.tablets),
                                      ),
                                      SizedBox(
                                        height: 2.h,
                                      ),
                                    ],
                                  ),
                                ),
                                // Frequently Bought
                                model.loadingWidget
                                    ? Center(child: Text('loading......'))
                                    : PageHorizontalMargin(
                                        widget: Column(
                                          children: [
                                            SizedBox(
                                              height: 1.h,
                                            ),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                TextWidget(
                                                  textValue: model
                                                      .prodmodel.data!.name
                                                      .toString(),
                                                  //"Panadol",
                                                  fontFamily:
                                                      FontUtils.poppinsBold,
                                                  fontSize: 3.t,
                                                  textColor: ColorUtils.red,
                                                ),
                                                Container(
                                                  height: 30,
                                                  width: 100,
                                                  decoration: BoxDecoration(
                                                      color: Colors.white,
                                                      boxShadow: [
                                                        BoxShadow(
                                                          color: Colors.grey
                                                              .withOpacity(
                                                                  0.25),
                                                          spreadRadius: 2,
                                                          blurRadius: 5,
                                                          offset: Offset(0, 3),
                                                        ),
                                                      ],
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              20)),
                                                  child: Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    children: [
                                                      InkWell(
                                                        onTap: decrement,
                                                        child: Container(
                                                          decoration:
                                                              BoxDecoration(
                                                            shape:
                                                                BoxShape.circle,
                                                            color:
                                                                ColorUtils.red,
                                                          ),
                                                          child: Center(
                                                            child: Icon(
                                                              Icons.remove,
                                                              color: ColorUtils
                                                                  .white,
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                      TextWidget(
                                                        textValue: "$count",
                                                        fontFamily: FontUtils
                                                            .interMedium,
                                                        fontSize: 2.6.t,
                                                        textColor:
                                                            ColorUtils.black,
                                                      ),
                                                      InkWell(
                                                        onTap: increment,
                                                        child: Container(
                                                          decoration:
                                                              BoxDecoration(
                                                            shape:
                                                                BoxShape.circle,
                                                            color:
                                                                ColorUtils.red,
                                                          ),
                                                          child: Center(
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
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                SizedBox(
                                  height: 1.h,
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 10),
                                  child: Row(
                                    children: [
                                      TextWidget(
                                        textValue:
                                            model.pharmacyFrequentlyBought1[0]
                                                ["quantity"],
                                        fontFamily: FontUtils.interMedium,
                                        fontSize: 1.6.t,
                                        textColor: ColorUtils.silver2,
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  height: 1.h,
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 10),
                                  child: Row(
                                    children: [
                                      TextWidget(
                                        textValue: "Rs." +
                                            model.prodmodel.data!.price
                                                .toString(),
                                        // model.pharmacyFrequentlyBought1[0]
                                        //     ["price"],
                                        fontFamily: FontUtils.interMedium,
                                        fontSize: 2.2.t,
                                        textColor: ColorUtils.red,
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  height: 1.h,
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 10),
                                  child: Row(
                                    children: [
                                      Text(
                                        "\PKR.${model.prodmodel.data!.discountedPrice.toString()}",
                                        //"\PKR.900",
                                        style: TextStyle(
                                          fontFamily: FontUtils.interMedium,
                                          fontSize: 1.6.t,
                                          color: ColorUtils.silver2,
                                          decoration:
                                              TextDecoration.lineThrough,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  height: 1.h,
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
                                            textValue: "Description",
                                            fontFamily: FontUtils.poppinsBold,
                                            fontSize: 3.t,
                                            textColor: ColorUtils.red,
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),

                                PageHorizontalMargin(
                                  widget: Column(
                                    children: [
                                      SizedBox(
                                        height: 2.h,
                                      ),
                                      TextWidget(
                                        textValue: model
                                            .prodmodel.data!.description
                                            .toString(),
                                        // "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Etiam eu turpis molestie, dictum est a, mattis tellus. Sed dignissim, metus nec fringilla accumsan, risus sem sollicitudin lacus, ut interdum tellus elit sed risus. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Etiam eu turpis molestie, dictum est a, mattis tellus. Sed dignissim, metus nec fringilla nec sed  accumsan, risus sem sollicitudin lacus, ut interdum tellus elit sed risus. ",
                                        fontFamily: FontUtils.interRegular,
                                        fontSize: 1.8.t,
                                        textColor: ColorUtils.black1,
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  height: 4.h,
                                ),
                                InkWell(
                                  onTap: () {
                                    saveData();
                                    // id = widget.prodcutId;
                                    // model.prefService.saveProdID(id.toString());
                                    //print("this is id ${cartItems}");
                                  },
                                  child: Container(
                                    child: Image.asset(ImageUtils.addtocart),
                                  ),
                                ),
                                SizedBox(
                                  height: 5.h,
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
