import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mt_hancod/core/consts/color_const.dart';
import 'package:mt_hancod/core/consts/font_const.dart';

class AccountScreen extends StatelessWidget {
  const AccountScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            "Account Screen",
            style: TextStyle(
              fontFamily: FontConst.kNunito,
              fontSize: 20.sp,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        body: SingleChildScrollView(
          child: Column(children: [
            const NameCardWidget(),
            const WalletBalanceCard(),
            SizedBox(
              height: 10.h,
            ),
            const AccountScreenTile(
              title: "Edit Profile",
              icon: "assets/svgs/accounts.svg",
            ),
            const AccountScreenTile(
              title: "Saved Address",
              icon: "assets/svgs/Locatiion.svg",
            ),
            const AccountScreenTile(
              title: "Terms & Conditions",
              icon: "assets/svgs/accounts.svg",
            ),
            const AccountScreenTile(
              title: "Privacy Policy",
              icon: "assets/svgs/accounts.svg",
            ),
            const AccountScreenTile(
              title: "Refer a friend",
              icon: "assets/svgs/reffer_a_friend.svg",
            ),
            const AccountScreenTile(
              title: "Customer Support",
              icon: "assets/svgs/customer_suport.svg",
            ),
            const AccountScreenTile(
              title: "Log Out",
              icon: "assets/svgs/accounts.svg",
            ),
          ]),
        ));
  }
}

class AccountScreenTile extends StatelessWidget {
  const AccountScreenTile({
    super.key,
    required this.title,
    required this.icon,
  });
  final String title;
  final String icon;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20.w, vertical: 5.h),
      width: 325.w,
      height: 50.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.r),
        border: Border.all(color: ColorConst.kLightGray),
      ),
      child: ListTile(
        leading: SvgPicture.asset(
          icon,
          width: 20.w,
          height: 20.h,
        ),
        title: Text(
          title,
          style: TextStyle(
            fontFamily: FontConst.kNunito,
            fontSize: 16.sp,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }
}

class WalletBalanceCard extends StatelessWidget {
  const WalletBalanceCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 46.h,
      width: 320.w,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.r),
        color: ColorConst.kLightGreen,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Text(
            "Wallet",
            style: TextStyle(
              fontFamily: FontConst.kNunito,
              color: ColorConst.kGreen,
              fontSize: 16.sp,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(),
          Container(
              width: 141.w,
              height: 27.h,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.r),
                color: ColorConst.kWhite,
              ),
              child: Center(
                child: Text(
                  "₹ 100",
                  style: TextStyle(
                    fontFamily: FontConst.kNunito,
                    fontSize: 16.sp,
                    color: ColorConst.kGreen,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ))
        ],
      ),
    );
  }
}

class NameCardWidget extends StatelessWidget {
  const NameCardWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Container(
        width: 45.w,
        height: 45.h,
        decoration: BoxDecoration(
          gradient: ColorConst.kPrimaryGradient,
          borderRadius: BorderRadius.circular(10.r),
        ),
        child: Center(
          child: Text(
            "FE",
            style: TextStyle(
              fontFamily: FontConst.kNunito,
              fontSize: 20.sp,
              fontWeight: FontWeight.w600,
              color: Colors.white,
            ),
          ),
        ),
      ),
      title: Text(
        "Fathima Ebrahim",
        style: TextStyle(
          fontFamily: FontConst.kNunito,
          fontSize: 16.sp,
          fontWeight: FontWeight.w600,
        ),
      ),
      subtitle: Text(
        "+91 908 786 4233",
        style: TextStyle(
          fontFamily: FontConst.kNunito,
          fontSize: 14.sp,
          fontWeight: FontWeight.w400,
        ),
      ),
    );
  }
}
