import 'package:doc_talk/app/utils/cach_helper.dart';
import 'package:doc_talk/features/quiz/widgets/task_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../widgets/background_widget.dart';


class DoneView1 extends StatelessWidget {
  const DoneView1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: QuizBackGround(
        child: Stack(
          children: [
            Positioned(
              left: 0,
              top: 0,
              bottom: 0,
              right: 0, // Adjusted for better alignment
              child: Image.asset(
                "assets/images/lines 2.png",
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                SizedBox(height: 320.h),
                Image.asset('assets/images/Avatars1.png', width: 250),
                SizedBox(height: 50.h),
                Text(
                  'Good job, ${CashHelper.getString(key: "name")}..',
                  style:
                      TextStyle(fontWeight: FontWeight.w500, fontSize: 20.sp),
                ),
              //  const Spacer(),
              SizedBox(height: 15.h,),
                Expanded(
                  child:SingleChildScrollView(
                    child: Column(
                      children: [
                    TaskContainer(index: 1,widget: CashHelper.getInt(key: "quiz one")==25?  Image.asset("assets/images/correct image.png",width: 30.w, height: 30.h,): Image.asset("assets/images/false image.png",
                      width: 30.w, height: 30.h)) ,
                    TaskContainer(index: 2,widget: CashHelper.getInt(key: "quizTwo")==25?  Image.asset("assets/images/correct image.png",width: 30.w, height: 30.h,): Image.asset("assets/images/false image.png",
                      width: 30.w, height: 30.h) ),
                    TaskContainer(index: 3,widget: CashHelper.getInt(key: "quiz three")==25?  Image.asset("assets/images/correct image.png",width: 30.w, height: 30.h,): Image.asset("assets/images/false image.png",
                      width: 30.w, height: 30.h) ),
                    TaskContainer(index: 4,widget: CashHelper.getInt(key: "quiz four")==25?  Image.asset("assets/images/correct image.png",width: 30.w, height: 30.h,): Image.asset("assets/images/false image.png",
                      width: 30.w, height: 30.h) )
                      ]
                    ),
                  )
                  ),
                
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class DoneView2 extends StatelessWidget {
  const DoneView2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: QuizBackGround(
        child: Stack(
          children: [
            Positioned(
              left: 0,
              top: 0,
              bottom: 0,
              right: 0, // Adjusted for better alignment
              child: Image.asset(
                "assets/images/lines 2.png",
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                SizedBox(height: 320.h),
                Image.asset('assets/images/Avatars1.png', width: 250),
                SizedBox(height: 50.h),
                Text(
                  'Good job, ${CashHelper.getString(key: "name")}..',
                  style:
                      TextStyle(fontWeight: FontWeight.w500, fontSize: 20.sp),
                ),
                    SizedBox(height: 15.h,),
                Expanded(
                  child:Column(
                    children: [
TaskContainer(index: 1,widget: CashHelper.getInt(key: "quiz one shapes")==25?  Image.asset("assets/images/correct image.png",width: 30.w, height: 30.h,): Image.asset("assets/images/false image.png",
                    width: 30.w, height: 30.h)) ,
TaskContainer(index: 2,widget: CashHelper.getInt(key: "Quiz Shapes")==25?   Image.asset("assets/images/correct image.png",width: 30.w, height: 30.h,): Image.asset("assets/images/false image.png",
                    width: 30.w, height: 30.h) ),
TaskContainer(index: 3,widget: CashHelper.getInt(key: "quiz three shapes")==25?  Image.asset("assets/images/correct image.png",width: 30.w, height: 30.h,): Image.asset("assets/images/false image.png",
                    width: 30.w, height: 30.h) ),
TaskContainer(index: 4,widget: CashHelper.getInt(key: "quiz four shapes")==25?  Image.asset("assets/images/correct image.png",width: 30.w, height: 30.h,): Image.asset("assets/images/false image.png",
                    width: 30.w, height: 30.h) )
                    ]
                  )
                  ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

