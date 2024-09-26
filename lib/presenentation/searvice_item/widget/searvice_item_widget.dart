import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mt_hancod/core/consts/color_const.dart';
import 'package:mt_hancod/models/service_model.dart';

class SearviceItemWidget extends StatelessWidget {
  const SearviceItemWidget({
    super.key,
    required this.service,
  });

  final ServiceModel service;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
        left: 10.w,
      ),
      height: 100.h,
      width: 100.w,
      margin: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
      decoration: BoxDecoration(
        color: ColorConst.kWhite,
        borderRadius: BorderRadius.circular(10.r),
        boxShadow: [
          BoxShadow(
            color: ColorConst.kBlack.withOpacity(0.1),
            blurRadius: 5.r,
            spreadRadius: 5.r,
          ),
        ],
      ),
      child: Row(
        // mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 86,
                height: 82,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.r),
                  image: const DecorationImage(
                    image: AssetImage('assets/pngs/cleaning_image_full.jpeg'),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(width: 10.w),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                children: [
                  SvgPicture.asset(
                    'assets/svgs/star.svg',
                    width: 10.w,
                    height: 10.h,
                  ),
                  SizedBox(width: 5.w),
                  Text(
                    '(${service.rating}/${service.ratingOutOf}) ${service.totalOrders} Orders',
                    style: TextStyle(
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w400,
                      color: ColorConst.kGray,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 5.h),
              Text(
                service.serviceName,
                style: TextStyle(
                  fontSize: 15.sp,
                  color: ColorConst.kBlack,
                  fontWeight: FontWeight.w700,
                ),
              ),
              SizedBox(height: 5.h),
              Text(
                '${service.duration} Minutes',
                style: TextStyle(
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w400,
                  color: ColorConst.kGray,
                ),
              ),
              SizedBox(height: 5.h),
              Text(
                '₹ ${service.servicePrice}',
                style: TextStyle(
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w700,
                  color: ColorConst.kBlack,
                ),
              ),
            ],
          ),
          SizedBox(width: 10.w),
          const Spacer(),
          Container(
            width: 83.w,
            height: 34.h,
            decoration: BoxDecoration(
              gradient: ColorConst.kPrimaryGradient,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(10.r),
                bottomRight: Radius.circular(10.r),
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Add",
                  style: TextStyle(
                    fontSize: 15.sp,
                    fontWeight: FontWeight.w800,
                    color: ColorConst.kWhite,
                  ),
                ),
                SizedBox(width: 5.w),
                const Icon(
                  Icons.add,
                  color: ColorConst.kWhite,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
