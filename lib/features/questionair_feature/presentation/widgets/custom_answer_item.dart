import 'package:doc_talk/app/utils/app_colors.dart';
import 'package:doc_talk/app/widgets/text_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomAnswerItem extends StatelessWidget {
  const CustomAnswerItem(
      {super.key, required this.text, this.isCorrect = false});
  final String text;
  final bool isCorrect;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 9.h, horizontal: 16.w),
      margin: EdgeInsets.symmetric(horizontal: 25.w),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25),
        color: isCorrect ? const Color(0xffFDEDA2) : const Color(0xffEEEEEE),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          TextWidget(
            title: text ?? "Very Often",
            titleSize: 16.sp,
            titleColor: AppColors.black,
          ),
          Icon(
            isCorrect ? Icons.check_circle_outline : Icons.circle_outlined,
            size: 23.sp,
            color: Colors.black,
          )
        ],
      ),
    );
  }
}
