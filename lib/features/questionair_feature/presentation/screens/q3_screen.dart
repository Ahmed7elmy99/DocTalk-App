import 'package:doc_talk/app/utils/app_assets.dart';
import 'package:doc_talk/app/utils/app_colors.dart';
import 'package:doc_talk/app/widgets/button_widget.dart';
import 'package:doc_talk/app/widgets/flutter_toast.dart';
import 'package:doc_talk/app/widgets/text_widget.dart';
import 'package:doc_talk/features/home_feature/presentation/screens/bottom_nav_bar.dart';
import 'package:doc_talk/features/questionair_feature/cubit/states_survey.dart';
import 'package:doc_talk/features/questionair_feature/cubit/survey_cubit.dart';
import 'package:doc_talk/features/questionair_feature/data/model/survey_model.dart';

import 'package:doc_talk/features/questionair_feature/presentation/screens/q4_screen.dart';
import 'package:doc_talk/features/questionair_feature/presentation/widgets/custom_answer_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../app/utils/consts.dart';
import '../../../../app/widgets/default_app_bar_widget.dart';

class Q3Screen extends StatelessWidget {
   Q3Screen({Key? key, required this.surveyModel, required this.answerIds}) : super(key: key);
  final SurveyModel surveyModel;
  final List<int> answerIds;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: const Color(0xfffed2d3),
      appBar:  DefaultAppBarWidget(
          onPop: () {
            navigateAndRemove(context: context, widget: BottomNavBar());
          },
        backColor: Color(0xfffed2d3),
        systemUiOverlayStyle: SystemUiOverlayStyle(
            statusBarColor: Colors.transparent,
            statusBarBrightness: Brightness.dark,
            statusBarIconBrightness: Brightness.dark),
      ),
      body:BlocBuilder<SurveyCubit, SurveyStates>(builder: (context, state) {
      
    return
       Column(
        children: [
          Expanded(
            child: Container(
              width: double.infinity,
              alignment: Alignment.topCenter,
              decoration: const BoxDecoration(
                  image: DecorationImage(
                      fit: BoxFit.fill,
                      image: AssetImage(
                        AppImages.q3,
                      ))),
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 24.w),
                child: Row(
                  children: [
                    TextWidget(
                      title: "3 of 12",
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
                            gradient: LinearGradient(colors: [
                              AppColors.mainColor,
                              AppColors.mainColor,
                              AppColors.mainColor,
                              AppColors.mainColor.withOpacity(0.2),
                              AppColors.mainColor.withOpacity(0.2),
                              AppColors.mainColor.withOpacity(0.2),
                              AppColors.mainColor.withOpacity(0.2),
                            ])),
                      ),
                    )
                  ],
                ),
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
                  )),
              child: ListView(
                padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 40.h),
                children: [
                  TextWidget(
                    title:
                         surveyModel.surveyQuestions![2].question!,
                    titleSize: 16.sp,
                    titleColor: AppColors.black,
                    titleMaxLines: 15,
                  ),
                  16.verticalSpace,
                  ...List.generate(surveyModel.surveyAnswers!.length, (index) {
                    if (index >= 10 && index <= 14) {
                      return Column(
                        children: [
                        InkWell(
                                onTap: () {
                                  SurveyCubit.get(context).chooseAnswerSurvey(
                                      surveyModel.surveyAnswers![index].id!);
                                },
                                child: CustomAnswerItem(
                                  text:
                                      surveyModel.surveyAnswers![index].answer!,
                                  isActive: SurveyCubit.get(context).answerId ==
                                          surveyModel.surveyAnswers![index].id!
                                      ? true
                                      : false,
                                ),
                              ),
                          16.verticalSpace
                        ],
                      );
                    } else {
                      return const SizedBox(); // Return an empty widget for indices greater than 2
                    }
                  }),
                  24.verticalSpace,
                  ButtonWidget(
                    onPressed: () {
                      if (SurveyCubit.get(context).answerId == null) {
                          return showToast(msg: "please choose an answer");
                        }else {
                          SurveyCubit.get(context).saveAnswerSurvey();
                               Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => Q4Screen(
                              answerIds: SurveyCubit.get(context).answerIds,
                            surveyModel: surveyModel,
                          ) ),
            );
                      /*    navigateTo(
                          context: context,
                          widget: Q4Screen(
                              answerIds: SurveyCubit.get(context).answerIds,
                            surveyModel: surveyModel,
                          ));*/
                          SurveyCubit.get(context).answerId = null;
                          print("answerId: ${SurveyCubit.get(context).answerId}");
                        }
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
          );
  }));
  }
}
