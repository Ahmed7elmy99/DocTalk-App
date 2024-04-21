import 'package:doc_talk/app/utils/consts.dart';
import 'package:doc_talk/features/questionair_feature/cubit/survey_cubit.dart';
import 'package:doc_talk/features/questionair_feature/data/model/survey_result_model.dart';

import 'package:doc_talk/result/widgets/result_conatiner_widget.dart';
import 'package:doc_talk/welcome_home_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ResultView extends StatelessWidget {
  const ResultView({Key? key, required this.surveyResultModel}) : super(key: key);
 final SurveyResultModel surveyResultModel;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        scrolledUnderElevation: 0,
        actions: [
          IconButton(
            onPressed: () {
              navigateTo(context: context, widget: const WelcomeScreen());
            },
            icon: Icon(CupertinoIcons.xmark_circle,
                color: Colors.white.withOpacity(.9)),
          ),
        ],
      ),
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage(
                "assets/images/result_backgorund.png",
              ),
              fit: BoxFit.cover),
        ),
        alignment: Alignment.center,
        child:  ResultContainer(surveyResultModel:SurveyCubit.get(context).surveyResultModel,),
      ),
    );
  }
}
