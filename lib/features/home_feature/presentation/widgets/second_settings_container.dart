import 'package:doc_talk/app/utils/colors.dart';
import 'package:doc_talk/app/utils/consts.dart';
import 'package:doc_talk/features/home_feature/presentation/screens/profile_screen.dart';
import 'package:doc_talk/features/notifications_features/presentation/screens/notifications_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SecondSettingsContainer extends StatefulWidget {
  const SecondSettingsContainer({
    super.key,
  });

  @override
  State<SecondSettingsContainer> createState() =>
      _SecondSettingsContainerState();
}

class _SecondSettingsContainerState extends State<SecondSettingsContainer> {
  bool isAllowed = true;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 404.w,
      height: 250.h,
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(15.r)),
      child: Column(
        children: [
          ListTile(
            leading: const Icon(
              CupertinoIcons.music_note_2,
              color: AppColors.musicBG,
            ),
            title: const Text('Background Music'),
            trailing: Transform.scale(
              scale: 1.sp,
              child: Switch(
                activeColor: AppColors.primaryColor,
                activeTrackColor: Colors.white,
                trackOutlineColor: isAllowed
                    ? const MaterialStatePropertyAll(AppColors.primaryColor)
                    : MaterialStatePropertyAll(
                        AppColors.blackColor.withOpacity(.5)),
                value: isAllowed,
                onChanged: (bool value) {
                  isAllowed = !isAllowed;
                  setState(() {});
                },
              ),
            ),
          ),
          Divider(
            endIndent: 30.w,
            indent: 30.w,
          ),
          ListTile(
            leading: const Icon(
              CupertinoIcons.person_fill,
              color: AppColors.accountIcon,
            ),
            title: const Text('Account'),
            trailing: IconButton(
              onPressed: () {
                navigateTo(context: context, widget: AccountScreen());
              },
              icon: const Icon(CupertinoIcons.right_chevron),
            ),
          ),
          Divider(
            endIndent: 30.w,
            indent: 30.w,
          ),
          ListTile(
            leading: const Icon(
              CupertinoIcons.bell_fill,
              color: AppColors.notificationIcon,
            ),
            title: const Text('Notification'),
            trailing: IconButton(
              onPressed: () {
                navigateTo(context: context, widget: NotificationsScreen());
              },
              icon: const Icon(CupertinoIcons.right_chevron),
            ),
          )
        ],
      ),
    );
  }
}
