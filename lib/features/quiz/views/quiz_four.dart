
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
  bool isMom =false;
  bool isBrother =false;
  bool isSister =false;
  bool isGrand =false;
  bool isMom2 =false;
  bool isBrother2 =false;
  bool isSister2 =false;
  bool isGrand2 =false;
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
                style: TextStyle(fontSize: 18.sp,fontWeight: FontWeight.bold),
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
                              isBrother = true;
                            });
                          },
                            child: Image.asset(questions[0])),
                        InkWell(
                          onTap: () {
                            setState(() {
                              isMom2=true;
                            });
                          },
                          child: Text(
                            questions2[0],
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: (isMom&&isMom2)?Colors.green:Colors.black,
                                fontSize: 20.sp),
                          ),
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
                                isSister= true;
                              });
                            },
                            child: Image.asset(questions[1])),
                        InkWell(
                          onTap: () {
                            setState(() {
                              isGrand2=true;
                            });
                          },
                          child: Text(
                            questions2[1],
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: isGrand && isGrand2 ?Colors.green:Colors.black,
                                fontSize: 20.sp),
                          ),
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
                                isMom=true;
                              });
                            },
                            child: Image.asset(questions[2])),
                        InkWell(
                          onTap: () {
                            setState(() {
                             isSister2 = true;
                            });
                          },
                          child: Text(
                            questions2[2],
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: (isSister && isSister2)?Colors.green:Colors.black,
                                fontSize: 20.sp),
                          ),
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
                                isGrand =true;
                              });
                            },
                            child: Image.asset(questions[3])),
                        InkWell(
                          onTap: () {
                            setState(() {
                              isBrother2 =true;
                            });
                          },
                          child: Text(
                            questions2[3],
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: (isBrother && isBrother2)?Colors.green:Colors.black,
                                fontSize: 20.sp),
                          ),
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
                  if((isBrother == true &&isBrother2 == true) &&
                    (  isSister==true && isSister2==true )
                      &&
                      (isMom==true && isMom2==true)
                      &&
                      (isGrand==true && isGrand2==true)
                  ){
                    QuizCubit.getObject(context).correct= 50;
                    _showGlobalAlertDialog(success: true);
                  }else{
                    _showGlobalAlertDialog(success: false);
                  }
                },
                color: AppColors.quizButtonColor,
              ),
            )
          ],
        ),
      ),
    );
  }
  void _showGlobalAlertDialog({required bool success}) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          content: success
              ? Image.asset("assets/images/thank.gif")
              :
          Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Image.asset("assets/images/oops.gif"),
              const Text(
                "That's wrong",
                style: TextStyle(
                  color: Colors.red,
                  fontSize: 24,
                ),
              ),
            ],
          ),
          backgroundColor: Colors.white,
          actions: <Widget>[
            CustomButton(
              color: AppColors.quizButtonColor,
              onTap: () {
                Navigator.pop(context);
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => const LoadingScreen()),
                );
              },
            )
          ],
        );
      },
    );
  }
}
