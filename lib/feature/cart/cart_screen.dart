import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mt_hancod/core/consts/color_const.dart';
import 'package:mt_hancod/feature/widget/appbar_widget.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(kToolbarHeight),
        child: CommonAppBar(title: 'Cart'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const CartItems(),
              SizedBox(
                height: 10.h,
              ),
              const FreequnetlyAddedServices(),
              SizedBox(
                height: 10.h,
              ),
              const WalletBalanceTile(),
              SizedBox(
                height: 10.h,
              ),
              const BillDetailsContiner(),
              Column(
                children: [
                  Container(
                    width: double.infinity,
                    // height: 100.h,
                    decoration: const BoxDecoration(
                      color: ColorConst.kWhite,
                    ),
                    child: const Center(
                      child: Text("Grand Total | ₹ 1000"),
                    ),
                  ),
                  Container(
                    width: double.infinity,
                    height: 50.h,
                    decoration: BoxDecoration(
                      gradient: ColorConst.kPrimaryGradient,
                      borderRadius: BorderRadius.circular(10.r),
                    ),
                    child: Center(
                      child: Text(
                        "Book Slot",
                        style: TextStyle(
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w800,
                          color: ColorConst.kWhite,
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class CartItems extends StatelessWidget {
  const CartItems({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CartItemWidget(
          title: "Kitchen Cleaning",
          price: "₹ 100",
          quantity: "1",
          index: "1",
          onTapMinus: () {},
          onTapPlus: () {},
        ),
        CartItemWidget(
          title: "Fan Cleaning",
          price: "₹ 250",
          quantity: "2",
          index: "2",
          onTapMinus: () {},
          onTapPlus: () {},
        ),
        Text(
          "Add more Services",
          style: TextStyle(
            fontSize: 16.sp,
            fontWeight: FontWeight.w500,
            color: ColorConst.kGreen,
          ),
        ),
      ],
    );
  }
}

class FreequnetlyAddedServices extends StatelessWidget {
  const FreequnetlyAddedServices({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Frequently added services",
          style: TextStyle(
            fontSize: 16.sp,
            fontWeight: FontWeight.w500,
            color: ColorConst.kBlack,
          ),
        ),
        SizedBox(
          height: 150.h,
          child: ListView.builder(
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            itemCount: 10,
            itemBuilder: (context, index) {
              return const FreeqentlyAskedItemCard();
            },
          ),
        ),
      ],
    );
  }
}

class WalletBalanceTile extends StatelessWidget {
  const WalletBalanceTile({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SvgPicture.asset(
          "assets/svgs/done.svg",
        ),
        SizedBox(
          width: 10.w,
        ),
        SizedBox(
            width: 0.8.sw,
            child: Text(
              "Your wallet balance is ₹125, you can redeem ₹10 in this order. ",
              style: TextStyle(
                fontSize: 12.sp,
                color: ColorConst.kGray,
                fontWeight: FontWeight.w500,
              ),
            )),
      ],
    );
  }
}

class BillDetailsContiner extends StatelessWidget {
  const BillDetailsContiner({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      // height: 172.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.r),
        border: Border.all(
          color: ColorConst.kGray,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 110.w,
            height: 32.h,
            decoration: BoxDecoration(
              color: ColorConst.kLightGray,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(10.r),
              ),
            ),
            child: Center(
              child: Text(
                "Bill Details",
                style: TextStyle(
                  fontSize: 15.sp,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
          SizedBox(
            height: 10.h,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                const BilDetailsItemWidget(
                  title: "Kitchen Cleaning",
                  price: "₹ 299",
                ),
                const BilDetailsItemWidget(
                  title: "Fan Cleaning",
                  price: "₹ 299",
                ),
                const BilDetailsItemWidget(
                  title: "Bathroom Cleaning",
                  price: "₹ 299",
                ),
                SizedBox(
                  height: 10.h,
                ),
                DottedLine(
                  direction: Axis.horizontal,
                  // lineLength: 100.w,
                  lineThickness: 1.w,
                  dashLength: 4.w,
                  dashColor: ColorConst.kGray,
                ),
                const BilDetailsItemWidget(
                  title: "Total",
                  price: "₹ 898",
                  isTotal: true,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class BilDetailsItemWidget extends StatelessWidget {
  const BilDetailsItemWidget({
    super.key,
    required this.title,
    required this.price,
    this.isTotal = false,
  });
  final String title;
  final String price;
  final bool isTotal;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(4),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: isTotal
                ? TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w500)
                : const TextStyle(),
          ),
          Text(
            price,
            style: isTotal
                ? TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w500)
                : const TextStyle(),
          ),
        ],
      ),
    );
  }
}

class FreeqentlyAskedItemCard extends StatelessWidget {
  const FreeqentlyAskedItemCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      shadowColor: ColorConst.kBlack,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.r),
      ),
      color: ColorConst.kWhite,
      child: Column(
        children: [
          Image.asset(
            "assets/pngs/cleanning_image_1.png",
          ),
          Text(
            "Bathroom Cleaning",
            style: TextStyle(
              fontSize: 10.sp,
              fontWeight: FontWeight.w500,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                "₹ 250",
                style: TextStyle(
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w800,
                ),
              ),
              SizedBox(
                width: 35.w,
              ),
              Container(
                width: 23.w,
                height: 23.h,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: ColorConst.kGray,
                  gradient: ColorConst.kPrimaryGradient,
                ),
                child: const Center(
                  child: Icon(
                    Icons.add,
                    color: ColorConst.kWhite,
                  ),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}

class CartItemWidget extends StatelessWidget {
  const CartItemWidget({
    super.key,
    required this.title,
    required this.price,
    required this.quantity,
    required this.index,
    required this.onTapMinus,
    required this.onTapPlus,
  });
  final String title;
  final String price;
  final String quantity;
  final String index;
  final Function() onTapMinus;
  final Function() onTapPlus;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      //    mainAxisAlignment: MainAxisAlignment.spaceBetween,

      leading: Text(
        "$index.",
        style: TextStyle(
          fontSize: 16.sp,
          fontWeight: FontWeight.w500,
        ),
      ),
      title: Text(
        textAlign: TextAlign.start,
        title,
        style: TextStyle(
          fontSize: 16.sp,
          fontWeight: FontWeight.w500,
        ),
      ),
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          GestureDetector(
            onTap: onTapMinus,
            child: Container(
              width: 23.w,
              height: 23.h,
              decoration: BoxDecoration(
                color: ColorConst.kGray,
                borderRadius: BorderRadius.circular(2.r),
              ),
              child: const Center(
                child: Icon(
                  Icons.remove,
                ),
              ),
            ),
          ),
          Container(
            width: 50.w,
            height: 23.h,
            decoration: BoxDecoration(
              color: ColorConst.klightGray,
              borderRadius: BorderRadius.circular(2.r),
            ),
            child: Center(
              child: Text(
                quantity,
                style: TextStyle(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ),
          GestureDetector(
            onTap: onTapPlus,
            child: Container(
              width: 23.w,
              height: 23.h,
              decoration: BoxDecoration(
                color: ColorConst.kGray,
                borderRadius: BorderRadius.circular(2.r),
              ),
              child: const Center(
                child: Icon(
                  Icons.add,
                  color: ColorConst.kWhite,
                ),
              ),
            ),
          ),
          //  const Spacer(),
          SizedBox(
            width: 10.w,
          ),
          Text(
            price,
            style: TextStyle(
              fontSize: 16.sp,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}
