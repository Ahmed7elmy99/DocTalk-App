import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FirstSettingsContainer extends StatelessWidget {
  const FirstSettingsContainer({
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
            title: const Text('Daily Progress'),
            trailing: SizedBox(
              width: 100.w,
              child: Row(
                children: [
                  Image.asset(
                    "assets/images/Clyde – 02.png",
                    width: 40.w,
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(CupertinoIcons.right_chevron),
                  ),
                ],
              ),
            ),
          ),
          Divider(
            endIndent: 30.w,
            indent: 30.w,
          ),
          ListTile(
            title: const Text('Daily Progress'),
            trailing: SizedBox(
              width: 100.w,
              child: Row(
                children: [
                  Image.asset(
                    "assets/images/Frame 2610679.png",
                    width: 40.w,
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(CupertinoIcons.right_chevron),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
