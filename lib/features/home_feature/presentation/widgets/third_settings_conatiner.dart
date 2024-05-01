import 'package:doc_talk/app/utils/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ThirdSettingsContainer extends StatelessWidget {
  const ThirdSettingsContainer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 404.w,
      height: 175.h,
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(15.r)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          ListTile(
            leading: const Icon(
              CupertinoIcons.question_circle_fill,
              color: AppColors.greenColor,
            ),
            title: const Text('Support'),
            trailing: IconButton(
              onPressed: () {},
              icon: const Icon(CupertinoIcons.right_chevron),
            ),
          ),
          Divider(
            endIndent: 30.w,
            indent: 30.w,
          ),
          ListTile(
            leading: const Icon(
              CupertinoIcons.info_circle_fill,
              color: AppColors.accountIcon,
            ),
            title: const Text('About'),
            trailing: IconButton(
              onPressed: () {},
              icon: const Icon(CupertinoIcons.right_chevron),
            ),
          )
        ],
      ),
    );
  }
}
