import 'package:doc_talk/app/utils/cach_helper.dart';
import 'package:doc_talk/features/home_feature/presentation/screens/alert.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../app/utils/app_colors.dart';
import '../widgets/background_widget.dart';
import '../widgets/custom_button.dart';
import 'quiz_three.dart';

class QuizTwoView extends StatefulWidget {
  const QuizTwoView({Key? key}) : super(key: key);

  @override
  State<QuizTwoView> createState() => _QuizTwoViewState();
}

class _QuizTwoViewState extends State<QuizTwoView> {
  final List<String> questions = [
    'assets/images/quiz_one_1.png',
    'assets/images/quiz_one_2.png',
    'assets/images/quiz_one_1.png',
    'assets/images/quiz_one_2.png',
  ];

  final String hiddenCardPath = 'assets/images/logo.png';
  List<String> gameImg = [];
  List<Map<int, String>> matchCheck = [];
  int tries = 0;
  int score = 0;
  int gameResult = 0; // Variable to track the game result

  @override
  void initState() {
    super.initState();
    questions.shuffle();
    gameImg = List<String>.filled(questions.length, hiddenCardPath);
  }

  void _onCardTap(int index) {
    setState(() {
      tries++;
      gameImg[index] = questions[index];
      matchCheck.add({index: questions[index]});
    });

    if (matchCheck.length == 2) {
      if (matchCheck[0].values.first == matchCheck[1].values.first) {
        setState(() {
          score += 100;
          matchCheck.clear();
        });
        if (gameImg.every((img) => img != hiddenCardPath)) {
          gameResult = 25;
          CashHelper.setInt(key: 'quizTwo', value: gameResult);
          // Update gameResult to 25 if passed
          print('Game Result: $gameResult'); // Print game result to console
          _showGlobalAlertDialog(success: true);
        }
      } else {
        Future.delayed(const Duration(milliseconds: 500), () {
          setState(() {
            gameImg[matchCheck[0].keys.first] = hiddenCardPath;
            gameImg[matchCheck[1].keys.first] = hiddenCardPath;
            matchCheck.clear();
          });
          if (tries >= 4) {
            CashHelper.setInt(key: 'quizTwo', value: gameResult);
            gameResult = 0; // Update gameResult to 0 if failed
            print('Game Result: $gameResult'); // Print game result to console
            _showGlobalAlertDialog(success: false);
          }
        });
      }
    }
  }

  void _showGlobalAlertDialog({required bool success}) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          content: success
              ? Image.asset("assets/images/thank.gif")
              : Text(
                  "That's wrong",
                  style: TextStyle(
                    color: Colors.red,
                    fontSize: 24,
                  ),
                ),
          backgroundColor: Colors.white,
          actions: <Widget>[
            CustomButton(
              color: AppColors.quizButtonColor,
              onTap: () {
                Navigator.pop(context);
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => QuizThreeView()),
                );
              },
            )
          ],
        );
      },
    );
  }

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
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16.sp,
                    ),
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
                  mainAxisSpacing: 20,
                ),
                itemCount: questions.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () => _onCardTap(index),
                    child: Container(
                      margin: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        color: const Color(0xFFFFB46A),
                        borderRadius: BorderRadius.circular(15.0),
                        image: DecorationImage(
                          image: AssetImage(gameImg[index]),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}