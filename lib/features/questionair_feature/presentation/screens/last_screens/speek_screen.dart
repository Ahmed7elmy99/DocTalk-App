import 'package:doc_talk/app/utils/consts.dart';
import 'package:doc_talk/app/widgets/button_widget.dart';
import 'package:doc_talk/app/widgets/image_widget.dart';
import 'package:doc_talk/app/widgets/text_widget.dart';

import 'package:doc_talk/features/questionair_feature/presentation/screens/last_screens/go_to_quiz_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../home_feature/presentation/screens/alert.dart';
import '../../app/widgets/alert.dart';


class SpeecScreen extends StatelessWidget {
  const SpeecScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffFFD1BE),
      body: Column(
        children: [
          100.verticalSpace,
          Container(
            padding: EdgeInsets.all(40),
            decoration: BoxDecoration(
              border: Border.all(color: Color(0xffBF4B00)),
              borderRadius: BorderRadius.circular(24)
            ),
            child: Column(
              children: [
                ButtonWidget(
                  onPressed: () {
                    globalAlertDialogue(
                        "",
                        canGif: true,
                        bColor: Color(0xffF19336),
                        context: context,
                        okButtonText: "Next",
                        onOk: () {
                         Navigator.pop(context);
                         navigateTo(context: context, widget: GoToQuizScreen());
                        },
                        canCancel: false
                    );

                  },
                  outlined: false,
                  width: 226.w,
                  color: Colors.transparent,
                  mainAxisAlignment: MainAxisAlignment.center,
                  text: "Speak this word",
                  textColor:Color(0xff707070) ,
                  border: Border.all(
                    color: Color(0xff707070)
                  ),
                ),
                24.verticalSpace,
                TextWidget(
                    title: "“MOM”",
                  titleSize: 32.sp,
                  titleColor: Colors.black,
                )
              ],
            ),
          ),
          32.verticalSpace,
          ImageWidget(
            width: 363.w,
              height:80.h,
              imageUrl: "assets/images/Player.png",
          ),
          Spacer(),
          Align(
            alignment: AlignmentDirectional.bottomStart,
            child: ImageWidget(
              width: 200.w,
              height:400.h,

                imageUrl: "assets/images/image.png",
            ),
          ),
        ],
      ),
    );
  }
}
