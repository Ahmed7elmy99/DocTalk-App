import 'package:doc_talk/app/utils/app_assets.dart';
import 'package:doc_talk/app/utils/app_colors.dart';
import 'package:doc_talk/app/widgets/default_app_bar_widget.dart';
import 'package:doc_talk/app/widgets/image_widget.dart';
import 'package:doc_talk/app/widgets/text_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AccountScreen extends StatelessWidget {
  const AccountScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      decoration: const BoxDecoration(
        image: DecorationImage(
            fit: BoxFit.cover, image: AssetImage(AppImages.back)),
      ),
      child: SafeArea(
        child: Column(
          children: [
            24.verticalSpace,
            const DefaultAppBarWidget(
              title: "Account",
              centerTitle: true,
              canBack: true,
              backColor: Colors.transparent,
            ),
            Column(
              children: [
                32.verticalSpace,
                Container(
                  width: 404.w,
                  height: 145.h,
                  padding: EdgeInsets.all(16.sp),
                  margin: EdgeInsets.symmetric(horizontal: 12.w),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: AppColors.white),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              TextWidget(
                                title: "Info",
                                titleSize: 18.sp,
                                titleFontWeight: FontWeight.w400,
                                titleColor: AppColors.black,
                              ),
                              5.verticalSpace,
                              TextWidget(
                                title: "rahmaelmadawy@gmail.com",
                                titleSize: 14.sp,
                                titleFontWeight: FontWeight.w400,
                                titleColor: AppColors.black.withOpacity(.4),
                              ),
                            ],
                          ),
                          Spacer(),
                          Icon(
                            Icons.arrow_forward_ios_outlined,
                            color: AppColors.black101010,
                            size: 20.sp,
                          ),
                        ],
                      ),
                      8.verticalSpace,
                      Divider(
                        color: AppColors.gery4,
                      ),
                      8.verticalSpace,
                      Row(
                        children: [
                          TextWidget(
                            title: "Create Password",
                            titleSize: 18.sp,
                            titleFontWeight: FontWeight.w400,
                            titleColor: AppColors.black,
                          ),
                          Spacer(),
                          Icon(
                            Icons.arrow_forward_ios_outlined,
                            color: AppColors.black101010,
                            size: 20.sp,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                24.verticalSpace,
                Container(
                  padding: EdgeInsets.all(22.sp),
                  margin: EdgeInsets.symmetric(horizontal: 12.w),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: AppColors.white),
                  child: Column(
                    children: [
                      TextWidget(
                        title: "Connections",
                        titleSize: 24.sp,
                        titleFontWeight: FontWeight.w400,
                        titleColor: AppColors.black,
                      ),
                      5.verticalSpace,
                      TextWidget(
                        title:
                            """we will not share anything on your Apple, Facebook or Google account without your permission. By tapping Continue or Sign In, you accept the privacy policy of DOCKTALK""",
                        titleSize: 14.sp,
                        titleFontWeight: FontWeight.w400,
                        titleMaxLines: 50,
                        titleColor: AppColors.black.withOpacity(.4),
                      ),
                      24.verticalSpace,
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          ImageWidget(
                            imageUrl: AppImages.twitter,
                            width: 30.w,
                            height: 30.h,
                          ),
                          24.horizontalSpace,
                          ImageWidget(
                            imageUrl: AppImages.facebook,
                            width: 30.w,
                            height: 30.h,
                          ),
                          24.horizontalSpace,
                          ImageWidget(
                            imageUrl: AppImages.apple,
                            width: 30.w,
                            height: 30.h,
                          ),
                          24.horizontalSpace,
                          ImageWidget(
                            imageUrl: AppImages.google,
                            width: 30.w,
                            height: 30.h,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
