import 'package:doc_talk/app/utils/consts.dart';
import 'package:doc_talk/app/widgets/button_widget.dart';
import 'package:doc_talk/app/widgets/image_widget.dart';
import 'package:doc_talk/app/widgets/text_widget.dart';
import 'package:doc_talk/features/levels_and_categories/data/models/categories_Model.dart';
import 'package:doc_talk/features/levels_and_categories/data/models/stories_Model.dart';
import 'package:doc_talk/features/levels_and_categories/presentation/screens/stories.dart';

import 'package:doc_talk/features/questionair_feature/presentation/screens/last_screens/go_to_quiz_screen.dart';
import 'package:doc_talk/features/quiz/views/quiz_three_shapes_story.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../home_feature/presentation/screens/alert.dart';

class SpeecScreen extends StatelessWidget {
  const SpeecScreen({super.key, required this.storiesModel, required this.index, required this.categoriesModel, required this.index2});
  final List<StoriesModel> storiesModel;
  final List<CategoryiesModel> categoriesModel;
  final int index ;
   final int index2 ;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffFFD1BE),
      body: Column(
        children: [
          100.verticalSpace,
          Container(
            padding: const EdgeInsets.all(40),
            decoration: BoxDecoration(
                border: Border.all(color: const Color(0xffBF4B00)),
                borderRadius: BorderRadius.circular(24)),
            child: Column(
              children: [
                ButtonWidget(
                  onPressed: () {
                    globalAlertDialogue("",
                        canGif: true,
                        bColor: const Color(0xffF19336),
                        context: context,
                        okButtonText: "Next", onOk: () {
if(categoriesModel[index2].id == 1 &&storiesModel[index].title == "Review"){
    Navigator.pop(context);
                      navigateTo(context: context, widget: GoToQuizScreen());
}else if(categoriesModel[index2].id == 2 &&storiesModel[index].title == "Review"){
     Navigator.pop(context);
                      navigateTo(context: context, widget:QuizThreeShapesStory ());
}
else{
    navigateTo(context: context, widget: StoriesScreen(storiesModel: storiesModel,categoryiesModel: categoriesModel,index2: index2,));
}
                  
                    }, canCancel: false);
                  },
                  outlined: false,
                  width: 226.w,
                  color: Colors.transparent,
                  mainAxisAlignment: MainAxisAlignment.center,
                  text: "Speak this word",
                  textColor: const Color(0xff707070),
                  border: Border.all(color: Color(0xff707070)),
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
            height: 80.h,
            imageUrl: "assets/images/Player.png",
          ),
          const Spacer(),
          Align(
            alignment: AlignmentDirectional.bottomStart,
            child: ImageWidget(
              width: 200.w,
              height: 400.h,
              imageUrl: "assets/images/image.png",
            ),
          ),
        ],
      ),
    );
  }
}
