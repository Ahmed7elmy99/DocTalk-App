import 'package:doc_talk/features/auth_feature/presentation/cubit/auth_cubit.dart';
import 'package:doc_talk/features/auth_feature/presentation/screens/otp_screen.dart';
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
import '../../../../app/widgets/flutter_toast.dart';
import '../../../../app/widgets/image_widget.dart';

import '../../../../app/widgets/text_widget.dart';

class ResetPasswordScreen extends StatefulWidget {
  const ResetPasswordScreen({super.key});

  @override
  State<ResetPasswordScreen> createState() => _ResetPasswordScreenState();
}

class _ResetPasswordScreenState extends State<ResetPasswordScreen> {
  final formKey = GlobalKey<FormState>();

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
            return Form(
              key: formKey,
              child: ListView(
                padding: EdgeInsets.symmetric(horizontal: 24.w),
                children: [
                  ImageWidget(
                    imageUrl: AppImages.authLogo,
                    width: 170.w,
                    height: 170.h,
                  ),
                  40.verticalSpace,
                  TextWidget(
                    title: "Now you can change your password.!",
                    titleColor: AppColors.black,
                    titleSize: 20.sp,
                  ),
                  32.verticalSpace,
                  CustomFormField(
                    hint: "Enter new password",
                    controller: cubit.newPassCon,
                    obscure: cubit.isVisiable,
                    suffixIconWidget: IconButton(
                      onPressed: () {
                        cubit.changePass();
                      },
                      icon: Icon(cubit.isVisiable
                          ? Icons.visibility
                          : Icons.visibility_off),
                    ),
                  ),
                  16.verticalSpace,
                  CustomFormField(
                    hint: "Confirm new password",
                    controller: cubit.confirmNewPassCon,
                    obscure: cubit.isConfirm,
                    suffixIconWidget: IconButton(
                      onPressed: () {
                        cubit.changeIsConfirm();
                      },
                      icon: Icon(cubit.isConfirm
                          ? Icons.visibility
                          : Icons.visibility_off),
                    ),
                  ),
                  56.verticalSpace,
                  ButtonWidget(
                    onPressed: () {
                      if (cubit.passwordCon.text ==
                              cubit.conFirmPasswordCon.text &&
                          formKey.currentState!.validate()) {
                        cubit.resetPassword(context);
                      } else {
                        showToast(
                            msg:
                                "Chek That password and Confirmed password are the Same");
                      }
                    },
                    color: AppColors.mainColor,
                    mainAxisAlignment: MainAxisAlignment.center,
                    outlined: false,
                    border: Border.all(color: AppColors.mainColor),
                    text: "Confirm",
                    textSize: 20.sp,
                    textColor: AppColors.white,
                  ),
                  16.verticalSpace,
                ],
              ),
            );
          },
        ));
  }
}
