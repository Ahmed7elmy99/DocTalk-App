import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PageViewItem extends StatelessWidget {
  const PageViewItem({
    super.key,
    required this.image,
    required this.title,
    required this.subTitle,
    required this.height,
    required this.width,
  });
  final String image;
  final String title;
  final String subTitle;
  final double height;
  final double width;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 121.h,
        ),
        SizedBox(height: height, width: width, child: Image.asset(image)),
        SizedBox(
          height: 33.3.h,
        ),
        Center(
          child: Text(
            title,
            textAlign: TextAlign.center,
            maxLines: 1,
            style: TextStyle(
              fontSize: 30.sp,

              fontWeight: FontWeight.w400,
              //    height: 1.5.h,
              color: const Color(0xff2a7473),
            ),
          ),
        ),
        Center(
          child: Text(
            subTitle,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 20.sp,
              fontWeight: FontWeight.w400,
              // height: 1.5.h,
              color: const Color(0xff2a7473),
            ),
          ),
        )
      ],
    );
  }
}
