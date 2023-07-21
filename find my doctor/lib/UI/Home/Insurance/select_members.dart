import 'package:find_my_doctor/App/locator.dart';
import 'package:find_my_doctor/UI/Home/Insurance/add_beneficiary.dart';
import 'package:find_my_doctor/UI/Home/Insurance/member_details_after.dart';
import 'package:find_my_doctor/Utils/color_utils.dart';
import 'package:find_my_doctor/Utils/extensions.dart';
import 'package:find_my_doctor/Utils/font_utils.dart';
import 'package:find_my_doctor/ViewModels/main_view_model.dart';
import 'package:find_my_doctor/Widgets/back_with_signleText.dart';
import 'package:find_my_doctor/Widgets/page_horizontal_margin.dart';
import 'package:find_my_doctor/Widgets/text_widget.dart';
import 'package:find_my_doctor/Widgets/top_margin_home.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:stacked/stacked.dart';

class SelectMembers extends StatefulWidget {
  const SelectMembers({Key? key}) : super(key: key);

  @override
  State<SelectMembers> createState() => _SelectMembersState();
}

class _SelectMembersState extends State<SelectMembers> {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<MainViewModel>.reactive(
      viewModelBuilder: () => locator<MainViewModel>(),
      disposeViewModel: false,
      onModelReady: (model) {
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
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    children: [
                      SizedBox(
                        height: context.getPadding().top,
                      ),
                      BackSingleText(
                        backText: "Insurance Market Place (4/5)",
                      ),
                      SizedBox(height: 1.h,),
                    ],
                  ),
                  Expanded(
                    child: PageHorizontalMargin(
                      widget: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          TopMarginHome(),
                          TextWidget(
                            textValue: "Select 2 Members",
                            fontFamily: FontUtils.poppinsSemiBold,
                            fontSize: 2.t,
                            textColor: ColorUtils.red,
                          ),
                          SizedBox(height: 3.h,),
                          SizedBox(
                            height: 21.h,
                              child: SelectingMember()),
                          Divider(
                            color: ColorUtils.silver,
                          ),
                          SizedBox(height: 1.h,),
                          GestureDetector(
                            onTap: (){
                              Navigator.push(context,
                                  PageTransition(type: PageTransitionType.fade, child:  AddNewBeneficiary()));
                            },
                            child: Row(
                              children: [
                                Container(
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    border: Border.all(color: ColorUtils.red),
                                  ),
                                  child: Icon(Icons.add,
                                    size: 3.i,
                                    color: ColorUtils.red,
                                  ),
                                ),
                                SizedBox(width: 2.w,),
                                TextWidget(
                                  textValue: "Add New Beneficiary",
                                  textColor: ColorUtils.red,
                                  fontFamily: FontUtils.interMedium,
                                  fontSize: 1.8.t,
                                ),
                              ],
                            ),
                          ),
                          SizedBox(height: 2.h,),
                          Divider(
                            color: ColorUtils.silver,
                          ),
                          SizedBox(height: 1.h,),
                        ],
                      ),
                    ),
                  ),
                  PageHorizontalMargin(
                    widget: Container(
                      decoration: const BoxDecoration(
                        shape: BoxShape.rectangle,
                        borderRadius: BorderRadius.all(Radius.circular(8)),
                      ),
                      child: AnimatedContainer(
                        duration: const Duration(milliseconds: 400),
                        width: MediaQuery.of(context).size.width / 1,
                        height: 6.35.h,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color: model.memberSelected == false ? ColorUtils.white1 : ColorUtils.red,
                        ),
                        child: MaterialButton(
                          padding: EdgeInsets.zero,
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                          onPressed: (){
                            Navigator.push(context,
                                PageTransition(type: PageTransitionType.fade, child:  MemberDetailsAfter()));
                          },
                          child: Text(
                            "Confirm",
                            style: TextStyle(
                                fontFamily: FontUtils.interSemiBold,
                                fontSize: 1.8.t,
                                color: ColorUtils.white),
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 1.h,),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}

class SelectingMember extends StatefulWidget {


  SelectingMember({Key? key}) : super(key: key);

  @override
  State<SelectingMember> createState() => _SelectingMemberState();
}

class _SelectingMemberState extends State<SelectingMember> {

  int? value;

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<MainViewModel>.reactive(
      viewModelBuilder: () => locator<MainViewModel>(),
      disposeViewModel: false,
      onModelReady: (model) {
      },
      builder: (context, model, child) {
        return ListView.separated(
          itemBuilder: (context, index) {
            return Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  flex: 4,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TextWidget(
                        textValue: model.insuranceMembers[index]["relation"],
                        fontFamily: FontUtils.poppinsBold,
                        fontSize: 1.8.t,
                        textColor: ColorUtils.red,
                      ),
                      SizedBox(height: 1.h,),
                      TextWidget(
                        textValue: model.insuranceMembers[index]["name"],
                        fontFamily: FontUtils.interRegular,
                        fontSize: 1.8.t,
                        textColor: ColorUtils.blackShade,
                      ),
                    ],
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: RadioListTile(
                    activeColor: ColorUtils.red,
                    value: index,
                    groupValue: value,
                    onChanged: (ind) {
                      model.memberSelected = true;
                      model.notifyListeners();
                      return setState(() => value = ind as int?);
            }
                  ),
                ),
              ],
            );
          },
          itemCount: model.insuranceMembers.length,
          separatorBuilder: (BuildContext context, int index) {
            return Divider(
              color: ColorUtils.silver,
            );
          },
        );
      },
    );
  }
}

