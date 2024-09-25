import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mt_hancod/core/consts/color_const.dart';
import 'package:mt_hancod/presenentation/accounts/account_screen.dart';
import 'package:mt_hancod/presenentation/booking/booking_screen.dart';
import 'package:mt_hancod/presenentation/home/home_screen.dart';
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
          //   backgroundColor: Colors.grey.shade900,
          // isVisible: true,
          // animationSettings: const NavBarAnimationSettings(
          //   navBarItemAnimation: ItemAnimationSettings(
          //     // Navigation Bar's items animation properties.
          //     duration: Duration(milliseconds: 400),
          //     curve: Curves.ease,
          //   ),
          //   screenTransitionAnimation: ScreenTransitionAnimationSettings(
          //     // Screen transition animation on change of selected tab.
          //     animateTabTransition: true,
          //     duration: Duration(milliseconds: 200),
          //     screenTransitionAnimationType:
          //         ScreenTransitionAnimationType.fadeIn,
          //   ),
          // ),
          confineToSafeArea: true,
          navBarHeight: kBottomNavigationBarHeight,
          // navBarStyle: _navBarStyle, // Choose the nav bar style with this property
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
          // color: ColorConst.kGray,
        ),
        title: ("Home"),
        textStyle: const TextStyle(color: ColorConst.kBlack, fontSize: 12),
        activeColorPrimary: Colors.green,
        inactiveColorPrimary: CupertinoColors.systemGrey,
        // scrollController: _scrollController1,
        // routeAndNavigatorSettings: RouteAndNavigatorSettings(
        //     initialRoute: "/",
        //     routes: {
        //     "/first": (final context) => const MainScreen2(),
        //     "/second": (final context) => const MainScreen3(),
        //     },
        // ),
      ),
      PersistentBottomNavBarItem(
        icon: SvgPicture.asset(
          "assets/svgs/calender.svg",
        ),
        title: ("Bookings"),
        activeColorPrimary: Colors.green,
        inactiveColorPrimary: CupertinoColors.systemGrey,
        // scrollController: _scrollController2,
        // routeAndNavigatorSettings: RouteAndNavigatorSettings(
        //     initialRoute: "/",
        // routes: {
        // "/first": (final context) => const MainScreen2(),
        // "/second": (final context) => const MainScreen3(),
        // },
        //  ),
      ),
      PersistentBottomNavBarItem(
        icon: SvgPicture.asset(
          "assets/svgs/accounts.svg",
        ),
        title: ("Accounts"),
        activeColorPrimary: Colors.green,
        inactiveColorPrimary: CupertinoColors.systemGrey,
        // scrollController: _scrollController2,
        // routeAndNavigatorSettings: RouteAndNavigatorSettings(
        //     initialRoute: "/",
        // routes: {
        // "/first": (final context) => const MainScreen2(),
        // "/second": (final context) => const MainScreen3(),
        // },
        //  ),
      ),
    ];
  }
}
