import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomListileDrawer extends StatelessWidget {
  const CustomListileDrawer({
    super.key,
    required this.imageUrl,
    required this.title,
    this.onTap,
  });
  final String imageUrl;
  final String title;
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return ListTile(
        title: Row(
          children: [
            SizedBox(width: 24.w, height: 24.h, child: Image.asset(imageUrl)),
            SizedBox(
              width: 12.w,
            ),
            Text(
              title,
              style: TextStyle(
                color: const Color(0xFF2A7473),
                fontSize: 18.sp,
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w400,
                height: 0.h,
              ),
            )
          ],
        ),
        onTap: onTap);
  }
}
