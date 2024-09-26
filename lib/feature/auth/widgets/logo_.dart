import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mt_hancod/core/consts/color_const.dart';

class Logo extends StatelessWidget {
  const Logo({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
        color: ColorConst.kGreen,
        width: 159.w,
        height: 72.h,
        child: const Center(
          child: Text(
            'Logo',
            style: TextStyle(
              color: ColorConst.kWhite,
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
        ));
  }
}
