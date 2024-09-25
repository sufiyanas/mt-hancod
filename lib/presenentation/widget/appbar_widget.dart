import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../core/consts/color_const.dart';

class CommonAppBar extends StatelessWidget {
  const CommonAppBar({
    super.key,
    required this.title,
  });
  final String title;
  @override
  Widget build(BuildContext context) {
    return PreferredSize(
      preferredSize: const Size.fromHeight(kToolbarHeight),
      child: AppBar(
        elevation: 0,
        backgroundColor: ColorConst.kScafoldbackground,
        leading: GestureDetector(
          onTap: () => Navigator.pop(context),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: SvgPicture.asset(
              "assets/svgs/Back-Navs.svg",
              width: 10.w,
              height: 10.h,
            ),
          ),
        ),
        title: Text(title),
      ),
    );
  }
}
