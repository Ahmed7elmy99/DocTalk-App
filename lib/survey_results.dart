import 'package:doc_talk/app/utils/app_assets.dart';
import 'package:doc_talk/app/utils/cach_helper.dart';


import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SurveyResults extends StatelessWidget {
  const SurveyResults({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: const BoxDecoration(
          image: DecorationImage(
              fit: BoxFit.cover, image: AssetImage(AppImages.back)),
        ),
        child: Center(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Survey Results:  ${CashHelper.getString(key: "surveyResult")}",
              style: TextStyle(fontSize: 25.sp),
            ),
            SizedBox(
              height: 20.h,
            ),
            Text(
              "Diagnoses:  ${CashHelper.getString(key: "diagnosis")}",
              style: TextStyle(fontSize: 25.sp),
            ),
          ],
        )),
      ),
    );
  }
}

/*class SurveyResultts extends StatefulWidget {
  const SurveyResultts({super.key,required this.userModel});
  final UserModel userModel;
  @override
  State<SurveyResultts> createState() => _SurveyResulttsState();
}

class _SurveyResulttsState extends State<SurveyResultts> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: const BoxDecoration(
          image: DecorationImage(
              fit: BoxFit.cover, image: AssetImage(AppImages.back)),
        ),
        child: Center(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Survey Results:  ${widget.userModel.patient?.surveyResult}",
              style: TextStyle(fontSize: 25.sp),
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              "Diagnoses:  ${widget.userModel.patient?.diagnoses}",
              style: TextStyle(fontSize: 25.sp),
            ),
          ],
        )),
      ),
    );
  }
}*/
