
import 'package:doc_talk/features/quiz/views/quiz_three.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../app/utils/app_colors.dart';
import '../widgets/background_widget.dart';
import '../widgets/custom_button.dart';

class QuizTwoView extends StatefulWidget {
  const QuizTwoView({Key? key}) : super(key: key);

  @override
  State<QuizTwoView> createState() => _QuizTwoViewState();
}

class _QuizTwoViewState extends State<QuizTwoView> {
  List<String> questions = [
    'assets/images/image.png',
    'assets/images/image.png',
    'assets/images/image.png',
    'assets/images/image.png',
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: QuizBackGround(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(top: 40.sp, right: 10.sp),
              child: Text(
                'Quiz 2',
                style: TextStyle(fontSize: 18.sp),
              ),
            ),
            SizedBox(height: 20.h),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Choose matched cards',
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 16.sp),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: Icon(Icons.volume_down_alt, size: 30.sp),
                  ),
                ],
              ),
            ),
            Expanded(
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 20,
                ),
                shrinkWrap: true,
                itemCount: questions.length,
                itemBuilder: (context, index) {
                  return Image.asset(questions[index]);
                },
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 8, vertical: 32.sp),
              child: CustomButton(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const QuizThreeView()),
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
