import 'package:doc_talk/app/utils/consts.dart';
import 'package:doc_talk/features/auth_feature/presentation/screens/login_screen.dart';
import 'package:doc_talk/features/questionair_feature/presentation/screens/q1_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
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
  List <String>  cities = ["cairo","mansoura","alex",];
  String ? selectedCity;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: true,
        appBar:const DefaultAppBarWidget(
          backColor: Colors.transparent,
          systemUiOverlayStyle: const SystemUiOverlayStyle(
              statusBarColor: Colors.transparent,
              statusBarBrightness: Brightness.dark,
              statusBarIconBrightness: Brightness.dark
          ),
          centerTitle: true,
          title: "Create account",
        ),
        body:ListView(
          padding: EdgeInsets.symmetric(horizontal: 24.w),
          children: [
            ImageWidget(
              imageUrl: AppImages.authLogo,
              width: 170.w,
              height: 170.h,
            ),
            64.verticalSpace,
            const CustomFormField(
              hint: "Enter email",
            ),
            16.verticalSpace,
            const CustomFormField(
              hint: "Type password",
            ),
            16.verticalSpace,
            const CustomFormField(
              hint: "Confirm password",
            ),
            40.verticalSpace,
            CustomDropDown(
              onItemChanged: (val) {
                selectedCity = val;
              },
              items: cities,
              dropDownHint: selectedCity ?? "Choose your city",
            ),
            40.verticalSpace,
            ButtonWidget(
              onPressed: () {
               navigateTo(context: context, widget: Q1Screen());
              },
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
        )
    );
  }
}
