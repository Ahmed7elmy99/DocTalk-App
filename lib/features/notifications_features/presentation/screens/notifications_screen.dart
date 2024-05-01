import 'package:doc_talk/app/utils/app_colors.dart';
import 'package:doc_talk/features/notifications_features/presentation/widgets/custom_listile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class NotificationsScreen extends StatelessWidget {
  const NotificationsScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        leading: IconButton(
          alignment: Alignment.center,
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.arrow_back_ios,
            color: AppColors.black101010,
            size: 20.sp,
          ),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
        scrolledUnderElevation: 0,
        title: Text(
          "Notifications",
          style: TextStyle(
            fontSize: 24.sp,
            color: Colors.black, // Customize your title color
          ),
        ),
        centerTitle: true,
      ),
      body: Stack(
        children: [
          Container(
            //  width: double.infinity,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/images/setting_background.png"),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Positioned(
            top: 132.h,
            left: 12.w,
            //   right: 12.w,
            //   bottom: 200.h,
            child: Container(
              width: 404.w,
              height: 594.h,
              alignment: Alignment.center,
              decoration: ShapeDecoration(
                  color: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.r),
                  )),
              padding: EdgeInsets.symmetric(horizontal: 12.w),
              child: Column(
                //   mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CustomListile(
                    title: 'Push notifications',
                    onChanged: (val) {},
                  ),
                  SizedBox(
                    height: 15.h,
                  ),
                  const CustomSubTitleListile(
                      subTitle:
                          'Receive push notifications reminding your child\nto practice'),
                  SizedBox(
                    height: 15.h,
                  ),
                  CustomListile(
                    title: 'Announce emails',
                    onChanged: (val) {},
                  ),
                  SizedBox(
                    height: 15.h,
                  ),
                  const CustomSubTitleListile(
                      subTitle:
                          'Receive emails with important announcements\nregarding our app'),
                  SizedBox(
                    height: 15.h,
                  ),
                  CustomListile(
                    title: 'Campaign emails',
                    onChanged: (val) {},
                  ),
                  SizedBox(
                    height: 15.h,
                  ),
                  const CustomSubTitleListile(
                      subTitle:
                          'Get the latest offers we provide with our campaigns'),
                  SizedBox(
                    height: 15.h,
                  ),
                  CustomListile(
                    title: 'Child report emails',
                    onChanged: (val) {},
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  const CustomSubTitleListile(
                      subTitle:
                          'Get emails of your child’s daily/weekly/monthly\nprogress reports depending on your selection'),
                  SizedBox(
                    height: 15.h,
                  ),
                  CustomListile(
                    title: 'Goal reminder',
                    onChanged: (val) {},
                  ),
                  SizedBox(
                    height: 15.h,
                  ),
                  const CustomSubTitleListile(
                      subTitle:
                          'Get a push notification for your daily goal when you\nclose the app'),
                  SizedBox(
                    height: 15.h,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
