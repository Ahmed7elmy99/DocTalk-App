import 'package:doc_talk/app/widgets/otp_widget.dart';
import 'package:doc_talk/features/auth_feature/presentation/cubit/auth_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../app/utils/app_assets.dart';
import '../../../../app/utils/app_colors.dart';
import '../../../../app/utils/consts.dart';
import '../../../../app/widgets/button_widget.dart';

import '../../../../app/widgets/custom_form_field.dart';
import '../../../../app/widgets/default_app_bar_widget.dart';
import '../../../../app/widgets/image_widget.dart';
import '../../../../app/widgets/text_button_widget.dart';
import '../../../../app/widgets/text_widget.dart';
import 'login_screen.dart';

class OtpScreen extends StatelessWidget {
  const OtpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: true,
        appBar: const DefaultAppBarWidget(
          backColor: Colors.transparent,
          systemUiOverlayStyle: SystemUiOverlayStyle(
              statusBarColor: Colors.transparent,
              statusBarBrightness: Brightness.dark,
              statusBarIconBrightness: Brightness.dark),
          centerTitle: true,
          title: "Forget Password!",
        ),
        body: BlocBuilder<AuthCubit, AuthState>(
          builder: (context, state) {
            var cubit = AuthCubit.get(context);
            return ListView(
              padding: EdgeInsets.symmetric(horizontal: 24.w),
              children: [
                ImageWidget(
                  imageUrl: AppImages.authLogo,
                  width: 170.w,
                  height: 170.h,
                ),
                40.verticalSpace,
                TextWidget(
                  title: "Recovery Email Sent!",
                  titleColor: AppColors.black,
                  titleSize: 20.sp,
                ),
                10.verticalSpace,
                TextWidget(
                  title:
                      "Please check your email and enter the code we sent to confirm your account",
                  titleColor: AppColors.black,
                  titleSize: 16.sp,
                ),
                32.verticalSpace,
                CustomFormField(
                  hint: "Enter Code",
                  controller: cubit.otpCon,
                ),
                16.verticalSpace,
                CustomTextButton(
                  title: "Resend..",
                  onPressed: () {},
                  titleSize: 15.sp,
                  titleColor: AppColors.mainColor,
                  textDecoration: TextDecoration.underline,
                ),
                56.verticalSpace,
                ButtonWidget(
                  onPressed: () {
                    cubit.verifyOtp(context);
                  },
                  color: AppColors.mainColor,
                  mainAxisAlignment: MainAxisAlignment.center,
                  outlined: false,
                  border: Border.all(color: AppColors.mainColor),
                  text: "Done",
                  textSize: 20.sp,
                  textColor: AppColors.white,
                ),
                16.verticalSpace,
              ],
            );
          },
        ));
  }
}
