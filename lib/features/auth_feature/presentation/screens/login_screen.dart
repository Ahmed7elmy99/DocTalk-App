import 'package:doc_talk/features/auth_feature/presentation/cubit/auth_cubit.dart';
import 'package:doc_talk/features/auth_feature/presentation/screens/forget_password_screen.dart';
import 'package:doc_talk/features/auth_feature/presentation/screens/register_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../app/utils/app_assets.dart';
import '../../../../app/utils/app_colors.dart';
import '../../../../app/utils/consts.dart';
import '../../../../app/widgets/button_widget.dart';
import '../../../../app/widgets/custom_form_field.dart';
import '../../../../app/widgets/default_app_bar_widget.dart';
import '../../../../app/widgets/image_widget.dart';
import '../../../../app/widgets/text_button_widget.dart';
import '../../../../app/widgets/text_widget.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

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
          title: "Sign in",
        ),
        body: BlocConsumer<AuthCubit, AuthState>(
          listener: (context, state) {
            if (state is AuthLoading) {
              showDialog(
                context: context,
                builder: (context) =>
                    const Center(child: CircularProgressIndicator()),
              );
            } else if (state is AuthError) {
              navigator!.pop(context);
              showDialog(
                context: context,
                builder: (context) => const Center(
                    child: Text(
                  "Wrong Email or Password",
                  style: TextStyle(fontWeight: FontWeight.bold),
                )),
              );
            }
          },
          builder: (context, state) {
            var cubit = AuthCubit.get(context);
            return Form(
              key: cubit.formstate,
              child: ListView(
                padding: EdgeInsets.symmetric(horizontal: 24.w),
                children: [
                  ImageWidget(
                    imageUrl: AppImages.authLogo,
                    width: 170.w,
                    height: 170.h,
                  ),
                  64.verticalSpace,
                  CustomFormField(
                    hint: "Enter email",
                    controller: cubit.loginEmailCon,
                    keyboardType: TextInputType.emailAddress,
                  ),
                  16.verticalSpace,
                  CustomFormField(
                    hint: "Type password",
                    controller: cubit.loginPasswordCon,
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
                  8.verticalSpace,
                  Align(
                    alignment: AlignmentDirectional.centerEnd,
                    child: CustomTextButton(
                      title: "Forget password?",
                      onPressed: () {
                        navigateTo(
                            context: context,
                            widget: const ForgetPasswordScreen());
                      },
                      titleSize: 14.sp,
                      textDecoration: TextDecoration.underline,
                    ),
                  ),
                  56.verticalSpace,
                  ButtonWidget(
                    onPressed: () async {
                      await cubit.login(context);
                    },
                    color: AppColors.mainColor,
                    mainAxisAlignment: MainAxisAlignment.center,
                    outlined: false,
                    border: Border.all(color: AppColors.mainColor),
                    text: "Sign in",
                    textSize: 20.sp,
                    textColor: AppColors.white,
                  ),
                  16.verticalSpace,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      TextWidget(
                        title: "Don’t have account?",
                        titleColor: AppColors.black,
                        titleSize: 18.sp,
                      ),
                      CustomTextButton(
                        title: "Create one",
                        onPressed: () {
                          navigateTo(
                              context: context, widget: const RegisterScreen());
                        },
                        titleSize: 18.sp,
                        titleColor: AppColors.mainColor,
                        textDecoration: TextDecoration.underline,
                      ),
                    ],
                  ),
                  56.verticalSpace,
                  TextWidget(
                    title: "Or sign in with",
                    titleColor: AppColors.black,
                    titleSize: 20.sp,
                  ),
                  16.verticalSpace,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ImageWidget(
                        imageUrl: AppImages.twitter,
                        width: 50.w,
                        height: 50.h,
                      ),
                      24.horizontalSpace,
                      ImageWidget(
                        imageUrl: AppImages.google,
                        width: 50.w,
                        height: 50.h,
                      ),
                    ],
                  ),
                  50.verticalSpace,
                ],
              ),
            );
          },
        ));
  }
}
