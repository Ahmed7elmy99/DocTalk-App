import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomIndicator extends StatelessWidget {
  const CustomIndicator({Key? key, required this.dotIndex}) : super(key: key);

  final int dotIndex;

  @override
  Widget build(BuildContext context) {
    return DotsIndicator(
      decorator: DotsDecorator(
        activeColor: Color(0xff2a7473),
        activeShape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(56),
        ),
        activeSize: Size(10.w, 10.h),
        spacing: EdgeInsets.all(5.w),
      ),
      dotsCount: 3,
      position: dotIndex,
    );
  }
}
