import 'package:doc_talk/features/auth_feature/presentation/screens/otp_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../app/utils/app_assets.dart';
import '../../../../app/utils/app_colors.dart';
import '../../../../app/utils/consts.dart';
import '../../../../app/widgets/button_widget.dart';
import '../../../../app/widgets/custom_form_field.dart';
import '../../../../app/widgets/default_app_bar_widget.dart';
import '../../../../app/widgets/image_widget.dart';

import '../../../../app/widgets/text_widget.dart';


class ForgetPasswordScreen extends StatelessWidget {
  const ForgetPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: true,
        appBar:const DefaultAppBarWidget(
          backColor: Colors.transparent,
          systemUiOverlayStyle:  SystemUiOverlayStyle(
              statusBarColor: Colors.transparent,
              statusBarBrightness: Brightness.dark,
              statusBarIconBrightness: Brightness.dark
          ),
          centerTitle: true,
          title: "Forget Password!",
        ),
        body:ListView(
          padding: EdgeInsets.symmetric(horizontal: 24.w),
          children: [
            ImageWidget(
              imageUrl: AppImages.authLogo,
              width: 170.w,
              height: 170.h,
            ),
            40.verticalSpace,
            TextWidget(
              title: "Do you forget your password!!",
              titleColor: AppColors.black,
              titleSize: 20.sp,
            ),
            10.verticalSpace,
            TextWidget(
              title: "Type your email, click the link we send, make a new password. Easy!",
              titleColor: AppColors.black,
              titleSize: 16.sp,
            ),
            32.verticalSpace,
            const CustomFormField(
              hint: "Enter email",
            ),
           56.verticalSpace,
            ButtonWidget(
              onPressed: () {
                navigateTo(context: context, widget: const OtpScreen());
              },
              color: AppColors.mainColor,
              mainAxisAlignment: MainAxisAlignment.center,
              outlined: false,
              border: Border.all(color: AppColors.mainColor),
              text: "Reset Password",
              textSize: 20.sp,
              textColor: AppColors.white,
            ),
            16.verticalSpace,


          ],
        )
    );
  }
}
