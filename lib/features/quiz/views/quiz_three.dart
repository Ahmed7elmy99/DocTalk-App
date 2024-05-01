import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../app/utils/app_colors.dart';
import '../widgets/background_widget.dart';
import '../widgets/custom_button.dart';
import 'quiz_four.dart';

class QuizThreeView extends StatefulWidget {
  const QuizThreeView({Key? key}) : super(key: key);

  @override
  State<QuizThreeView> createState() => _QuizThreeViewState();
}

class _QuizThreeViewState extends State<QuizThreeView> {
  List<String> questions = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: QuizBackGround(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(top: 40.sp, right: 10.sp),
              child: Text(
                'Quiz 3',
                style: TextStyle(fontSize: 18.sp),
              ),
            ),
            SizedBox(height: 20.h),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'Who is this.?',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16.sp),
              ),
            ),
            Image.asset('assets/images/Frame 2610771.png'),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 8, vertical: 32.sp),
              child: CustomButton(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const QuizFourView()),
                  );
                },
                color: AppColors.quizButtonColor,
              ),
            )
          ],
        ),
      ),
    );
  }
}
