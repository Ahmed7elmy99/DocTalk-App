import 'package:doc_talk/app/utils/app_assets.dart';
import 'package:doc_talk/app/utils/app_colors.dart';
import 'package:doc_talk/app/utils/consts.dart';
import 'package:doc_talk/app/widgets/button_widget.dart';
import 'package:doc_talk/app/widgets/text_widget.dart';
import 'package:doc_talk/features/questionair_feature/presentation/screens/q7_screen.dart';
import 'package:doc_talk/features/questionair_feature/presentation/widgets/custom_answer_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../app/widgets/default_app_bar_widget.dart';

class Q6Screen extends StatelessWidget {
  const Q6Screen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor:const  Color(0xfffef3d5),
      appBar:const DefaultAppBarWidget(
        backColor: Color(0xfffef3d5),
        systemUiOverlayStyle:  SystemUiOverlayStyle(
            statusBarColor: Colors.transparent,
            statusBarBrightness: Brightness.dark,
            statusBarIconBrightness: Brightness.dark
        ),

      ),
      body: Column(
        children: [
          Padding(
            padding:  EdgeInsets.symmetric(horizontal: 24.w),
            child: Row(
              children: [
                TextWidget(
                  title: "6 of 12",
                  titleSize: 16.sp,
                  titleColor: AppColors.mainColor,
                  titleMaxLines: 15,
                ),
                9.horizontalSpace,
                Expanded(
                  child: Container(
                    height: 7.h,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      gradient: LinearGradient(
                        colors: [
                          AppColors.mainColor,
                          AppColors.mainColor.withOpacity(0.2),
                          AppColors.mainColor.withOpacity(0.2),
                          AppColors.mainColor.withOpacity(0.2),
                          AppColors.mainColor.withOpacity(0.2),
                          AppColors.mainColor.withOpacity(0.2),
                        ]
                      )
                    ),
                  ),
                )
              ],
            ),
          ),
          Expanded(
            child: Container(
              width: double.infinity,
              decoration:const BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage(
                    AppImages.q6,
                  )
                )
              ),
            ),
          ),
          Expanded(
            flex: 2,
            child: Container(
              decoration: BoxDecoration(
                color: AppColors.white,
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(40.r),
                  topLeft: Radius.circular(40.r),
                )
              ),
              child: ListView(
                padding: EdgeInsets.symmetric(horizontal: 15.w,vertical: 40.h),
                children: [
                  TextWidget(
                      title: 'Does your child ask you to repeat yourself?',
                      titleSize: 16.sp,
                    titleColor: AppColors.black,
                    titleMaxLines: 15,
                  ),
                  16.verticalSpace,
                  const CustomAnswerItem(
                      text: "Very Often",
                    isCorrect: true,
                  ),
                  16.verticalSpace,
                  const CustomAnswerItem(
                    text: "Often",
                  ),
                  16.verticalSpace,
                  const CustomAnswerItem(
                    text: "Sometimes",
                  ),
                  16.verticalSpace,
                  const CustomAnswerItem(
                    text: "Rarely",
                  ),
                  16.verticalSpace,
                  const CustomAnswerItem(
                    text: "Never",
                  ),
                  40.verticalSpace,
                  ButtonWidget(
                    onPressed: () {
                      navigateTo(context: context, widget: Q7Screen());
                    },
                    text: "Next",
                    height: 50.h,
                    mainAxisAlignment: MainAxisAlignment.center,
                    icon: Icon(
                      Icons.arrow_forward,
                      size: 20.sp,
                      color: Colors.white,
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
