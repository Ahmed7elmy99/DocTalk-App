import 'package:doc_talk/app/utils/app_colors.dart';
import 'package:doc_talk/app/widgets/text_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomAnswerItem extends StatefulWidget {
  const CustomAnswerItem({
    Key? key,
    required this.text,
    this.isActive = false,
  }) : super(key: key);

  final String text;
  final bool isActive;

  @override
  State<CustomAnswerItem> createState() => _CustomAnswerItemState();
}

class _CustomAnswerItemState extends State<CustomAnswerItem> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 9.h, horizontal: 16.w),
      margin: EdgeInsets.symmetric(horizontal: 25.w),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(25),
          color: widget.isActive
              ? const Color(0xffFDEDA2)
              : const Color(0xffEEEEEE)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          TextWidget(
            title: widget.text ?? "Very Often",
            titleSize: 16.sp,
            titleColor: AppColors.black,
          ),
          Icon(
            widget.isActive
                ? Icons.check_circle_outline
                : Icons.circle_outlined,
            size: 23.sp,
            color: Colors.black,
          )
        ],
      ),
    );
  }
}
