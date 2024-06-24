import 'package:doc_talk/features/home_feature/presentation/screens/alert.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

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
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _controller1 = TextEditingController();
  final TextEditingController _controller2 = TextEditingController();
  final TextEditingController _controller3 = TextEditingController();
  int _score = 0;
  final String _correctName = 'MOM';

  List<String> questions = [];

  void _handleCardTap(String title) {
    setState(() {
      if (_controller1.text.isEmpty) {
        _controller1.text = title;
      } else if (_controller2.text.isEmpty) {
        _controller2.text = title;
      } else if (_controller3.text.isEmpty) {
        _controller3.text = title;
      }

      if (_controller1.text.isNotEmpty &&
          _controller2.text.isNotEmpty &&
          _controller3.text.isNotEmpty &&
          (_controller1.text + _controller2.text + _controller3.text ==
              _correctName)) {
        _showGlobalAlertDialog();
        _score = 25;
        print(_score);
      } else if (_controller1.text.isNotEmpty &&
          _controller2.text.isNotEmpty &&
          _controller3.text.isNotEmpty &&
          (_controller1.text + _controller2.text + _controller3.text !=
              _correctName)) {
        _showGlobalAlertDialog2();
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
      Navigator.pop(context);
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => QuizFourView()),
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
                        MaterialPageRoute(builder: (context) => QuizFourView()),
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
                color: Color(0xFFFDF4EA),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.sp),
                ),
              ),
              child: Column(
                children: [
                  SizedBox(height: 20.h),
                  Text(
                    'Who is this.?',
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 20.sp),
                  ),
                  Container(
                    width: 258.w,
                    height: 304.h,
                    child: Image.asset('assets/images/mom quiz.png'),
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
                    color: Color(0xFFFED426),
                    onTap: () {
                      _handleCardTap('A');
                    },
                    title: 'A',
                  ),
                  SizedBox(
                    width: 20.w,
                  ),
                  CustomCardQuiz4(
                    color: Color(0xFF4BA651),
                    onTap: () {
                      _handleCardTap('M');
                    },
                    title: 'M',
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
                    color: Color(0xFFFED426),
                    onTap: () {
                      _handleCardTap('F');
                    },
                    title: 'F',
                  )
                ]),
              ),
              Padding(
                padding:
                    EdgeInsets.only(right: 77.5.w, left: 88.5.w, top: 44.h),
                child: Row(children: [
                  CustomCardQuiz4(
                    color: Color(0xFF4BA651),
                    onTap: () {
                      _handleCardTap('M');
                    },
                    title: 'M',
                  ),
                  SizedBox(
                    width: 20.w,
                  ),
                  CustomCardQuiz4(
                    color: Color(0xFF4BA651),
                    onTap: () {
                      _handleCardTap('O');
                    },
                    title: 'O',
                  ),
                  SizedBox(
                    width: 20.w,
                  ),
                  CustomCardQuiz4(
                    color: Color(0xFFFED426),
                    onTap: () {
                      _handleCardTap('T');
                    },
                    title: 'T',
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
