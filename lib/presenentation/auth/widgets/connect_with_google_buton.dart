import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mt_hancod/core/consts/color_const.dart';

class ConnectwithGoogleButon extends StatelessWidget {
  const ConnectwithGoogleButon({
    super.key,
    required this.onTap,
  });
  final Function() onTap;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: 327.w,
        height: 50.h,
        decoration: BoxDecoration(
          color: ColorConst.klightGray,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(
              'assets/svgs/Google_Icon.svg',
              width: 20.w,
              height: 20.h,
            ),
            Text(
              'Continue with Google',
              style: TextStyle(
                color: ColorConst.kBlack,
                fontSize: 16.sp,
                fontWeight: FontWeight.w700,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
