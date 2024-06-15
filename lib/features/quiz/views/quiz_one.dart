<<<<<<< HEAD
import 'package:doc_talk/app/utils/consts.dart';
=======
>>>>>>> c4827c53ae93b65a9a1f680dbac2dfac087b5090
import 'package:doc_talk/features/quiz/cubit/quiz_cubit.dart';
import 'package:doc_talk/features/quiz/views/quiz_two.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_tts/flutter_tts.dart';

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

  @override
  void initState() {
    super.initState();
    QuizCubit.getObject(context).getQuiz();
  }

  FlutterTts flutterTts = FlutterTts();
  int? selectedIndex;
  bool? isTrue;
<<<<<<< HEAD
=======
  FlutterTts flutterTts = FlutterTts();
>>>>>>> c4827c53ae93b65a9a1f680dbac2dfac087b5090

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: QuizBackGround(
        child: BlocBuilder<QuizCubit, QuizState>(
          builder: (context, state) {
<<<<<<< HEAD
            var c = QuizCubit.getObject(context);
=======
            var cubit = QuizCubit.get(context);
>>>>>>> c4827c53ae93b65a9a1f680dbac2dfac087b5090
            return Column(
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
<<<<<<< HEAD
                        onPressed: () async {
                          await FlutterTts().speak("Where is mom?");
=======
                        onPressed: () async{
                          await flutterTts.speak("Where is mom?");
>>>>>>> c4827c53ae93b65a9a1f680dbac2dfac087b5090
                        },
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
<<<<<<< HEAD
                              index == 2 ?
                                  c.correct = 25
                                  :
                                  c.correct= 0;
                              print(c.correct);
                              navigateTo(context: context, widget: QuizTwoView());

=======
                              if (index == 0) {
                                isTrue = true;
                                setState(() {});
                                debugPrint('true');
                              } else {
                                isTrue = false;
                                setState(() {});
                                debugPrint('false');
                              }
>>>>>>> c4827c53ae93b65a9a1f680dbac2dfac087b5090
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
            );
          },
        ),
      ),
    );
  }
}
