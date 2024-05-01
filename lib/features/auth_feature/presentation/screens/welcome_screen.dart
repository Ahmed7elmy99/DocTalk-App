import 'package:doc_talk/app/utils/consts.dart';
import 'package:doc_talk/features/auth_feature/presentation/screens/login_screen.dart';
import 'package:doc_talk/features/auth_feature/presentation/screens/register_screen.dart';
import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../app/utils/app_assets.dart';
import '../../../../app/utils/app_colors.dart';
import '../../../../app/widgets/button_widget.dart';

import '../../../../app/widgets/default_app_bar_widget.dart';
import '../../../../app/widgets/image_widget.dart';
import '../../../../app/widgets/text_button_widget.dart';
import '../../../../app/widgets/text_widget.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: true,
        appBar: const DefaultAppBarWidget(
          backColor: Colors.transparent,
          canBack: false,
        ),
        body: ListView(
          padding: EdgeInsets.symmetric(horizontal: 24.w),
          children: [
            ImageWidget(
              imageUrl: AppImages.authLogo,
              width: 237.w,
              height: 275.h,
            ),
            80.verticalSpace,
            RichText(
              textAlign: TextAlign.center,
              text: TextSpan(
                  text: "Welcome to DOC",
                  style: TextStyle(fontSize: 24.sp, color: AppColors.mainColor),
                  children: [
                    TextSpan(
                      text: "TALK",
                      style: TextStyle(
                          fontSize: 24.sp, color: const Color(0xffFCB8B5)),
                    ),
                    TextSpan(
                      text: "!",
                      style: TextStyle(
                          fontSize: 24.sp, color: AppColors.mainColor),
                    )
                  ]),
            ),
            40.verticalSpace,
            ButtonWidget(
              onPressed: () {
                navigateTo(context: context, widget: const RegisterScreen());
              },
              color: AppColors.mainColor,
              mainAxisAlignment: MainAxisAlignment.center,
              outlined: false,
              border: Border.all(color: AppColors.mainColor),
              text: "Create account",
              textSize: 20.sp,
              textColor: AppColors.white,
            ),
            16.verticalSpace,
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextWidget(
                  title: "Already have one.",
                  titleColor: AppColors.black,
                  titleSize: 18.sp,
                ),
                CustomTextButton(
                  title: "Sign in",
                  onPressed: () {
                    navigateTo(context: context, widget: const LoginScreen());
                  },
                  titleSize: 18.sp,
                  titleColor: AppColors.mainColor,
                  textDecoration: TextDecoration.underline,
                ),
              ],
            ),
            50.verticalSpace,
          ],
        ));
  }
}
