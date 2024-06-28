import 'package:doc_talk/app/utils/cach_helper.dart';
import 'package:doc_talk/features/home_feature/presentation/screens/alert.dart';
import 'package:doc_talk/features/quiz/views/quiz_eight_view.dart';
import 'package:doc_talk/features/quiz/views/quiz_four.dart';
import 'package:doc_talk/features/quiz/widgets/background_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class QuizThreeShapesStory extends StatefulWidget {
  const QuizThreeShapesStory({Key? key}) : super(key: key);

  @override
  State<QuizThreeShapesStory> createState() => _QuizThreeShapesStoryState();
}

class _QuizThreeShapesStoryState extends State<QuizThreeShapesStory> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _controller1 = TextEditingController();
  final TextEditingController _controller2 = TextEditingController();
  final TextEditingController _controller3 = TextEditingController();
  final TextEditingController _controller4 = TextEditingController();
  final TextEditingController _controller5 = TextEditingController();
  final TextEditingController _controller6 = TextEditingController();
  int _score = 0;
  final String _correctName = 'CIRCLE';

  List<String> questions = [];

  void _handleCardTap(String title) {
    setState(() {
      if (_controller1.text.isEmpty) {
        _controller1.text = title;
      } else if (_controller2.text.isEmpty) {
        _controller2.text = title;
      } else if (_controller3.text.isEmpty) {
        _controller3.text = title;
      }else if (_controller4.text.isEmpty) {
        _controller4.text = title;
      } else if (_controller5.text.isEmpty) {
        _controller5.text = title;
      }else if (_controller6.text.isEmpty) {
        _controller6.text = title;
      }

      if (_controller1.text.isNotEmpty &&
          _controller2.text.isNotEmpty &&
          _controller3.text.isNotEmpty &&
          _controller4.text.isNotEmpty &&
          _controller5.text.isNotEmpty &&
          _controller6.text.isNotEmpty &&
          (_controller1.text + _controller2.text + _controller3.text + _controller4.text + _controller5.text + _controller6.text  ==
              _correctName)) {
        _showGlobalAlertDialog();
        _score = 25;
        print(_score);
      } else if (_controller1.text.isNotEmpty &&
          _controller2.text.isNotEmpty &&
          _controller3.text.isNotEmpty &&
          _controller4.text.isNotEmpty &&
          _controller5.text.isNotEmpty &&
          _controller6.text.isNotEmpty &&
          (_controller1.text + _controller2.text + _controller3.text + _controller4.text + _controller5.text + _controller6.text !=
              _correctName)) {
        _showGlobalAlertDialogWrong();
        _score = 0;
        print(_score);
      }
    });
  }

  void _showGlobalAlertDialog() {
    return globalAlertDialogue("",
        canGif: true,
        bColor: const Color(0xffF19336),
        context: context,
        okButtonText: "Next", onOk: () {
            CashHelper.setInt(
                              key: "quiz three shapes",
                              value: _score,
                                );
      Navigator.pop(context);
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => QuizEightView()),
      );
    }, canCancel: false);
  }
    void _showGlobalAlertDialogWrong() {
    return globalAlertDialogueWrong("",
        canGif: true,
        bColor: const Color(0xffF19336),
        context: context,
        okButtonText: "Next", onOk: () {
            CashHelper.setInt(
                              key: "quiz three shapes",
                              value: _score,
                                );
      Navigator.pop(context);
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => QuizEightView()),
      );
    }, canCancel: false);
  }


  void _showGlobalAlertDialog2() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return SizedBox(
          height: 250.h,
          width: 450.w,
          child: AlertDialog(
            content: Text(
              "That's wrong!",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 20.sp,
                fontWeight: FontWeight.bold,
              ),
            ),
            actions: [
              Center(
                child: TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (context) => QuizEightView()),
                      );
                    },
                    child: Container(
                      width: 189.w,
                      height: 50.h,
                      padding: EdgeInsets.all(10.sp),
                      decoration: ShapeDecoration(
                        color: Color(0xFFF19336),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(25.sp),
                        ),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            'Next',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 20.sp,
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.w600,
                              height: 0,
                              letterSpacing: 1.sp,
                            ),
                          ),
                        ],
                      ),
                    )),
              ),
            ],
          ),
        );
      },
    );
  }

  void navigateTo({required BuildContext context, required Widget widget}) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => widget),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        automaticallyImplyLeading: false,
        centerTitle: true,
        title: Text(
          'Quiz 3',
          style: TextStyle(
            color: Colors.black,
            fontSize: 22.sp,
            fontFamily: 'Poppins',
            fontWeight: FontWeight.w600,
            height: 0,
            letterSpacing: 1.10.sp,
          ),
        ),
      ),
      body: QuizBackGround(
        child: ListView(children: [
          Padding(
            padding: EdgeInsets.only(right: 24.0.w, left: 25.0.w),
            child: Container(
              width: 379.w,
              height: 425.h,
              decoration: ShapeDecoration(
                color: Color(0xFFFE9F4FF),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.sp),
                ),
              ),
              child: Column(
                children: [
                  SizedBox(height: 20.h),
                  Text(
                    'What is this.?',
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 20.sp),
                  ),SizedBox(height: 15.h),
                  Container(
                    width: 209.w,
                    height: 266.h,
                    child: Image.asset('assets/images/CIRCLE_QUIZ.png'),
                  ),
                  SizedBox(height: 40.h),
                  
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        width: 36.5.w,
                        height: 0,
                        child: TextFormField(
                          controller: _controller1,
                        ),
                      ),
                      SizedBox(
                        width: 20.w,
                      ),
                      SizedBox(
                        width: 36.5.w,
                        height: 0,
                        child: TextFormField(
                          controller: _controller2,
                        ),
                      ),
                      SizedBox(
                        width: 20.w,
                      ),
                      SizedBox(
                        width: 36.5.w,
                        height: 0,
                        child: TextFormField(
                          controller: _controller3,
                        ),
                      ),
                                            SizedBox(
                        width: 20.w,
                      ),
                        SizedBox(
                        width: 36.5.w,
                        height: 0,
                        child: TextFormField(
                          controller: _controller4,
                        ),
                      ),
                      SizedBox(
                        width: 20.w,
                      ),
                      SizedBox(
                        width: 36.5.w,
                        height: 0,
                        child: TextFormField(
                          controller: _controller5,
                        ),
                      ),
                      SizedBox(
                        width: 20.w,
                      ),
                      SizedBox(
                        width: 36.5.w,
                        height: 0,
                        child: TextFormField(
                          controller: _controller6,
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
          SizedBox(
            height: 24.h,
          ),
          Column(
            children: [
              Padding(
                padding: EdgeInsets.only(right: 45.5.w, left: 46.5.w),
                child: Row(children: [
                  CustomCardQuiz4(
                    color:  Color(0xFF4BA651),
                    onTap: () {
                      _handleCardTap('L');
                    },
                    title: 'L',
                  ),
                  SizedBox(
                    width: 20.w,
                  ),
                  CustomCardQuiz4(
                    color: Color(0xFF4BA651),
                    onTap: () {
                      _handleCardTap('C');
                    },
                    title: 'C',
                  ),
                  SizedBox(
                    width: 20.w,
                  ),
                  CustomCardQuiz4(
                    color: Color(0xFF7B5FED),
                    onTap: () {
                      _handleCardTap('P');
                    },
                    title: 'P',
                  ),
                  SizedBox(
                    width: 20.w,
                  ),
                  CustomCardQuiz4(
                    color:  Color(0xFF4BA651),
                    onTap: () {
                      _handleCardTap('C');
                    },
                    title: 'C',
                  )
                ]),
              ),
              Padding(
                padding:
                    EdgeInsets.only(right: 45.5.w, left: 46.5.w, top: 44.h),
                child: Row(children: [
                  CustomCardQuiz4(
                    color: Color(0xFF4BA651),
                    onTap: () {
                      _handleCardTap('I');
                    },
                    title: 'I',
                  ),
                  SizedBox(
                    width: 20.w,
                  ),
                  CustomCardQuiz4(
                    color: Color(0xFF4BA651),
                    onTap: () {
                      _handleCardTap('P');
                    },
                    title: 'P',
                  ),
                  SizedBox(
                    width: 20.w,
                  ),
                  CustomCardQuiz4(
                    color:  Color(0xFF4BA651),
                    onTap: () {
                      _handleCardTap('R');
                    },
                    title: 'R',
                  ),
                    SizedBox(
                    width: 20.w,
                  ),
                  CustomCardQuiz4(
                    color:  Color(0xFF4BA651),
                    onTap: () {
                      _handleCardTap('E');
                    },
                    title: 'E',
                  ),
                ]),
              )
            ],
          )
        ]),
      ),
    );
  }
}

class CustomCardQuiz4 extends StatefulWidget {
  const CustomCardQuiz4({
    super.key,
    required this.title,
    required this.onTap,
    required this.color,
  });
  final String title;
  final VoidCallback onTap;
  final Color color;

  @override
  State<CustomCardQuiz4> createState() => _CustomCardQuiz4State();
}

class _CustomCardQuiz4State extends State<CustomCardQuiz4> {
  bool _isTapped = false;

  void _handleTap() {
    widget.onTap();
    setState(() {
      _isTapped = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: _handleTap,
      child: Container(
        width: 64.w,
        height: 64.h,
        padding: EdgeInsets.all(10.sp),
        decoration: ShapeDecoration(
          color: _isTapped ? widget.color : Color(0xFFF5F5F5),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.sp),
          ),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              widget.title,
              style: TextStyle(
                color: Colors.black,
                fontSize: 20.sp,
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w600,
                height: 0,
                letterSpacing: 1.sp,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
