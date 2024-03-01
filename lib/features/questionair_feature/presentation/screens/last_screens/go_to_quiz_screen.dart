import 'package:doc_talk/app/widgets/text_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class GoToQuizScreen extends StatelessWidget {
  const GoToQuizScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurple,
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.cover,
            image: AssetImage("assets/images/Frame.png")
          )
        ),
        child: Column(
          children: [
            50.verticalSpace,
            Align(
              alignment: Alignment.centerLeft,
              child: BackButton(
                color: Colors.white,
              ),
            ),
            Spacer(),
            Align(
              alignment: Alignment.bottomCenter,
              child: Stack(
                alignment: AlignmentDirectional.center,
                children: [
                  Image(
                    image: AssetImage("assets/images/quiz.gif"),color: Color(0xFFfc8168)  ,
                  ),
                  TextWidget(
                    title: "Go To \nQuiz",
                    titleColor: Colors.white,
                    titleSize: 20.sp,
                  )
                ],
              ),
            ),
            50.verticalSpace,
          ],
        ),
      )
    );
  }
}


