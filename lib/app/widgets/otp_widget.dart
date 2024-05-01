import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pinput/pinput.dart';

import '../utils/app_colors.dart';

class OtpWidget extends StatelessWidget {
  final void Function(String)? onCompleted;
  final int length;
  final TextEditingController? controller;
  const OtpWidget(
      {this.onCompleted, this.length = 4, this.controller, super.key});

  @override
  Widget build(BuildContext context) {
    return Pinput(
      controller: controller,
      length: length,
      onCompleted: onCompleted,
      defaultPinTheme: PinTheme(
        width: 50.w,
        height: 50.w,
        textStyle: TextStyle(
          fontSize: 20.sp,
          color: AppColors.black,
          fontWeight: FontWeight.w700,
          // fontFamily: fontRegular,
        ),
        decoration: BoxDecoration(
          color: Color(0xffD9D9D9),
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: Color(0xffD9D9D9)),
        ),
      ),
      focusedPinTheme: PinTheme(
        width: 50.w,
        height: 50.w,
        textStyle: TextStyle(
          fontSize: 20.sp,
          color: AppColors.black3333,
          // fontFamily: fontRegular,
        ),
        decoration: BoxDecoration(
          color: const Color(0xffF8F8F8),
          borderRadius: BorderRadius.circular(5),
          border: Border.all(
            color: AppColors.mainColor,
          ),
        ),
      ),
    );
  }
}
