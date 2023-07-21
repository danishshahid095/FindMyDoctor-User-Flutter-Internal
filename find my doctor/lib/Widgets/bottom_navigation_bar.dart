
import 'package:find_my_doctor/App/locator.dart';
import 'package:find_my_doctor/UI/Account/account_main_screen.dart';
import 'package:find_my_doctor/UI/Bookings/bookings_main_screen.dart';
import 'package:find_my_doctor/UI/Helpline/helpline_main_screen.dart';
import 'package:find_my_doctor/UI/Home/home_main_screen.dart';
import 'package:find_my_doctor/Utils/color_utils.dart';
import 'package:find_my_doctor/Utils/extensions.dart';
import 'package:find_my_doctor/Utils/image_utils.dart';
import 'package:find_my_doctor/ViewModels/main_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:stacked/stacked.dart';

class MyBottomNavBar extends StatefulWidget {

  bool? fromAgent;
  int? index;

  MyBottomNavBar({this.fromAgent, this.index,Key? key}) : super(key: key);

  @override
  State<MyBottomNavBar> createState() => _MyBottomNavBarState();
}

class _MyBottomNavBarState extends State<MyBottomNavBar> {

  int currentIndex = 0;
  Widget? body;

  @override
  void initState() {
    currentIndex = widget.index ?? 0;
    onClick(currentIndex);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<MainViewModel>.reactive(
        onModelReady: (model)async {
        },
        viewModelBuilder: () => locator<MainViewModel>(),
        disposeViewModel: false,
        builder: (context, model, child){
          return Scaffold(
            body: Container(
              child: body,
            ),
            bottomNavigationBar:
            BottomNavigationBar(
              backgroundColor: ColorUtils.white,
              type: BottomNavigationBarType.fixed,
              items:  <BottomNavigationBarItem>[
                BottomNavigationBarItem(
                  icon: Padding(
                    padding: EdgeInsets.only(bottom: 1.h),
                    child: SvgPicture.asset(ImageUtils.bottomHomeIcon,
                      color: currentIndex != 0 ? ColorUtils.blackShade : ColorUtils.red,
                    ),
                  ),
                  label: "Home",
                ),
                BottomNavigationBarItem(
                  icon: Padding(
                    padding: EdgeInsets.only(bottom: 1.h),
                    child: SvgPicture.asset(ImageUtils.bottomHeadPhoneIcon,
                      color: currentIndex != 1 ? ColorUtils.blackShade : ColorUtils.red,
                    ),
                  ),
                  label: 'Helpline',
                ),
                BottomNavigationBarItem(
                  icon: Padding(
                    padding: EdgeInsets.only(bottom: 1.h),
                    child: SvgPicture.asset(ImageUtils.bottomBookingIcon,
                      color: currentIndex != 2 ? ColorUtils.blackShade : ColorUtils.red,
                    ),
                  ),
                  label: 'Bookings',
                ),
                BottomNavigationBarItem(
                  icon: Padding(
                    padding: EdgeInsets.only(bottom: 1.h),
                    child: SvgPicture.asset(ImageUtils.bottomAccountIcon,
                      color: currentIndex != 3 ? ColorUtils.blackShade : ColorUtils.red,
                    ),
                  ),
                  label: 'Account',
                ),
              ],
              currentIndex: currentIndex,
              //fixedColor: ColorUtils.orangeColor,
              selectedItemColor: ColorUtils.red,
              unselectedItemColor: ColorUtils.blackShade,
              //unselectedItemColor: ColorUtils.fieldIconColor,
              unselectedLabelStyle: TextStyle(
                color: ColorUtils.white,
              ),
              //backgroundColor: Colors.green,
              onTap: (index) {
                currentIndex = index;
                //MainView(index: 3,);
                onClick(currentIndex);
                setState(() {});
              },
            ),
          );
        }
    );
  }
  onClick(int selectedIndex){
    setState(() {
      var model = locator<MainViewModel>();
      currentIndex = selectedIndex;
      switch(currentIndex){
        case 0:
          body = HomeMainScreen();
          break;
        case 1:
          body = HelpLineMainScreen();
          break;
        case 2:
          body = BookingsMainScreen();
          break;
        case 3:
          body = AccountMainScreen();
          break;
      }
    });
  }
}
