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
                  child: ListView.builder(
                    itemCount: 4,
                    shrinkWrap: true,
                    itemBuilder: (BuildContext context, int index) {
                      return TaskContainer(
                        ispassed: true,
                        index: index,
                      );
                    },
                  ),
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
                  child: ListView.builder(
                    itemCount: 4,
                    shrinkWrap: true,
                    itemBuilder: (BuildContext context, int index) {
                      return TaskContainer(
                        ispassed: true,
                        index: index,
                      );
                    },
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

