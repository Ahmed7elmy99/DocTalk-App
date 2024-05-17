import 'package:doc_talk/features/quiz/views/loading_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../app/utils/app_colors.dart';
import '../widgets/background_widget.dart';
import '../widgets/custom_button.dart';


class QuizFourView extends StatefulWidget {
  const QuizFourView({Key? key}) : super(key: key);

  @override
  State<QuizFourView> createState() => _QuizFourViewState();
}

class _QuizFourViewState extends State<QuizFourView> {
  List<String> questions = [
    "assets/images/quiz_one_1.png",
    "assets/images/quiz_one_2.png",
    "assets/images/quiz_one_3.png",
    "assets/images/quiz_one_4.png",
  ];
  List<String> questions2 = [
    "MOM",
    "Grand-Ma",
    "Sister",
    "Brother",
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
                'Quiz 4',
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
                    'Match each picture \nwith its word',
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
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: questions.length,
                itemBuilder: (context, index) {
                  return Container(
                      padding: const EdgeInsets.all(8.0),
                      height: 120,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Image.asset(questions[index]),
                          Text(
                            questions2[index],
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 20.sp),
                          )
                        ],
                      ));
                },
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 8, vertical: 22.sp),
              child: CustomButton(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const LoadingScreen()),
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
