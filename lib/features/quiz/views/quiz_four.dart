import 'package:doc_talk/features/quiz/cubit/quiz_cubit.dart';
import 'package:doc_talk/features/quiz/views/loading_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_tts/flutter_tts.dart';

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
  int select = 5;
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
                    onPressed: () async{
                      await FlutterTts().speak("'Match each picture with its word");
                    },
                    icon: Icon(Icons.volume_down_alt, size: 30.sp),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Column(
                children: [
                  Expanded(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        InkWell(
                          onTap:(){
                            setState(() {
                              select = 0;
                            });
                          },
                            child: Image.asset(questions[0])),
                        Text(
                          questions2[0],
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: select==2?Colors.green:Colors.black,
                              fontSize: 20.sp),
                        )
                      ],
                    ),
                  ),
                  Expanded(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        InkWell(
                            onTap:(){
                              setState(() {
                                select = 1;
                              });
                            },
                            child: Image.asset(questions[1])),
                        Text(
                          questions2[1],
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: select==3?Colors.green:Colors.black,
                              fontSize: 20.sp),
                        )
                      ],
                    ),
                  ),
                  Expanded(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        InkWell(
                            onTap:(){
                              setState(() {
                                select = 2;
                              });
                            },
                            child: Image.asset(questions[2])),
                        Text(
                          questions2[2],
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: select==1?Colors.green:Colors.black,
                              fontSize: 20.sp),
                        )
                      ],
                    ),
                  ),
                  Expanded(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        InkWell(
                            onTap:(){
                              setState(() {
                                select = 3;
                              });
                            },
                            child: Image.asset(questions[3])),
                        Text(
                          questions2[3],
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: select==0?Colors.green:Colors.black,
                              fontSize: 20.sp),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 8, vertical: 22.sp),
              child: CustomButton(
                onTap: () {
                  QuizCubit.getObject(context).correct= 50;
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
