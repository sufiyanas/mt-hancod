import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mt_hancod/core/consts/color_const.dart';

class CustomGreenButon extends StatelessWidget {
  const CustomGreenButon({
    super.key,
    required this.onTap,
  });
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 327.w,
      height: 50.h,
      decoration: BoxDecoration(
        color: ColorConst.kGreen,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Phone',
            style: TextStyle(
              color: ColorConst.kWhite,
              fontSize: 16.sp,
              fontWeight: FontWeight.w700,
            ),
          ),
        ],
      ),
    );
  }
}
