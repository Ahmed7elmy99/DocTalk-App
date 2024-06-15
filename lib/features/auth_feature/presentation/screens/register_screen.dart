import 'package:doc_talk/app/utils/consts.dart';
import 'package:doc_talk/app/widgets/flutter_toast.dart';
import 'package:doc_talk/features/auth_feature/presentation/cubit/auth_cubit.dart';
import 'package:doc_talk/features/auth_feature/presentation/screens/login_screen.dart';
import 'package:doc_talk/features/parents_and_child_info_feature/presntation/screens/second.dart';
import 'package:doc_talk/features/questionair_feature/presentation/screens/q1_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../app/utils/app_assets.dart';
import '../../../../app/utils/app_colors.dart';
import '../../../../app/widgets/button_widget.dart';
import '../../../../app/widgets/custom_drop_down.dart';
import '../../../../app/widgets/custom_form_field.dart';
import '../../../../app/widgets/default_app_bar_widget.dart';
import '../../../../app/widgets/image_widget.dart';
import '../../../../app/widgets/text_button_widget.dart';
import '../../../../app/widgets/text_widget.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
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
          title: "Create account",
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
                  64.verticalSpace,
                  CustomFormField(
                    hint: "Enter email",
                    controller: cubit.signupEmailCon,
                    keyboardType: TextInputType.emailAddress,
                  ),
                  16.verticalSpace,
                  CustomFormField(
                    hint: "Type Phone",
                    controller: cubit.phoneCon,
                    keyboardType: TextInputType.phone,
                  ),
                  16.verticalSpace,
                  CustomFormField(
                    hint: "Type password",
                    controller: cubit.passwordCon,
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
                    hint: "Confirm password",
                    controller: cubit.conFirmPasswordCon,
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
                  40.verticalSpace,
                  ButtonWidget(
                    onPressed: () {
                      if (cubit.passwordCon.text ==
                              cubit.conFirmPasswordCon.text &&
                          formKey.currentState!.validate()) {
                        navigateTo(context: context, widget: const Second());
                      } else if (cubit.passwordCon.text !=
                          cubit.conFirmPasswordCon.text) {
                        showToast(
                            msg:
                                "Chek That password and Confirmed password are the Same");
                      }
                    },
                    loading: state is AuthLoading,
                    color: AppColors.mainColor,
                    mainAxisAlignment: MainAxisAlignment.center,
                    outlined: false,
                    border: Border.all(color: AppColors.mainColor),
                    text: "Join DocTalk",
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
                          navigateTo(
                              context: context, widget: const LoginScreen());
                        },
                        titleSize: 18.sp,
                        titleColor: AppColors.mainColor,
                        textDecoration: TextDecoration.underline,
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
