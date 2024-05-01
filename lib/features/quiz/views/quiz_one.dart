import 'package:doc_talk/features/quiz/views/quiz_two.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../app/utils/app_colors.dart';
import '../widgets/background_widget.dart';
import '../widgets/custom_button.dart';

class QuizOneView extends StatefulWidget {
  const QuizOneView({Key? key}) : super(key: key);

  @override
  State<QuizOneView> createState() => _QuizOneViewState();
}

class _QuizOneViewState extends State<QuizOneView> {
  List<String> questions = [
    "assets/images/quiz_one_1.png",
    "assets/images/quiz_one_2.png",
    "assets/images/quiz_one_3.png",
    "assets/images/quiz_one_4.png",
  ];
  int? selectedIndex;
  bool? isTrue;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: QuizBackGround(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(top: 40.sp, right: 10.sp),
              child: Text(
                'Quiz 1',
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
                    'Where is mom?',
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
                return GestureDetector(
                    onTap: () {
                      if (index == 0) {
                        isTrue = true;
                        setState(() {});
                        debugPrint('true');
                      } else {
                        isTrue = false;
                        setState(() {});
                        debugPrint('false');
                      }
                    },
                    child: Image.asset(questions[index]));
              },
            )),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 8, vertical: 32.sp),
              child: CustomButton(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const QuizTwoView()),
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
