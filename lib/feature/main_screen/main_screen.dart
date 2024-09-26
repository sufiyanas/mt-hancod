import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mt_hancod/core/consts/color_const.dart';
import 'package:mt_hancod/feature/accounts/account_screen.dart';
import 'package:mt_hancod/feature/booking/booking_screen.dart';
import 'package:mt_hancod/feature/home/home_screen.dart';
import 'package:persistent_bottom_nav_bar/persistent_bottom_nav_bar.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
            child: PersistentTabView(
          context,
          screens: _buildScreens(),
          items: _navBarsItems(),
          handleAndroidBackButtonPress: true,
          resizeToAvoidBottomInset: true,
          stateManagement: true,
          hideNavigationBarWhenKeyboardAppears: true,
          padding: const EdgeInsets.only(top: 8),
          confineToSafeArea: true,
          navBarHeight: kBottomNavigationBarHeight,
        )));
  }

  List<Widget> _buildScreens() {
    return [
      const HomeScreen(),
      const BookingScreen(),
      const AccountScreen(),
    ];
  }

  List<PersistentBottomNavBarItem> _navBarsItems() {
    return [
      PersistentBottomNavBarItem(
        icon: SvgPicture.asset(
          "assets/svgs/Home.svg",
        ),
        title: ("Home"),
        textStyle: const TextStyle(color: ColorConst.kBlack, fontSize: 12),
        activeColorPrimary: Colors.green,
        inactiveColorPrimary: CupertinoColors.systemGrey,
      ),
      PersistentBottomNavBarItem(
        icon: SvgPicture.asset(
          "assets/svgs/calender.svg",
        ),
        title: ("Bookings"),
        activeColorPrimary: Colors.green,
        inactiveColorPrimary: CupertinoColors.systemGrey,
      ),
      PersistentBottomNavBarItem(
        icon: SvgPicture.asset(
          "assets/svgs/accounts.svg",
        ),
        title: ("Accounts"),
        activeColorPrimary: Colors.green,
        inactiveColorPrimary: CupertinoColors.systemGrey,
      ),
    ];
  }
}
