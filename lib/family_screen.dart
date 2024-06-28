import 'package:doc_talk/app/utils/consts.dart';
import 'package:doc_talk/features/levels_and_categories/data/models/categories_Model.dart';
import 'package:doc_talk/features/levels_and_categories/data/models/stories_Model.dart';
import 'package:doc_talk/features/questionair_feature/presentation/screens/last_screens/speek_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:video_player/video_player.dart';

class FamilyScreen extends StatefulWidget {
  const FamilyScreen({Key? key, required this.storiesModel, required this.index, required this.categoryiesModel, required this.index2}) : super(key: key);
  final List<StoriesModel> storiesModel;
   final List<CategoryiesModel> categoryiesModel;
  final int index;
  final int index2;
  @override
  _FamilyScreenState createState() => _FamilyScreenState();
}

class _FamilyScreenState extends State<FamilyScreen> {
  late VideoPlayerController controller;
  bool isVideoFinished = false;
  bool isBottomSheetOpen = false;

  @override
  void initState() {
    super.initState();
    controller =
        VideoPlayerController.network("${widget.storiesModel[widget.index].video}");

    controller.addListener(() {
      if (controller.value.position >= controller.value.duration) {
        if (!isBottomSheetOpen) {
          _openBottomSheet(); // Open bottom sheet when video finishes
          setState(() {
            isVideoFinished = true;
            isBottomSheetOpen = true;
          });
        }
      }
    });

    controller.initialize().then((_) {
      setState(() {});
      controller.play();
    });
  }

  void _openBottomSheet() {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(30.w),
              topRight: Radius.circular(30.w),
            ),
            image: const DecorationImage(
              image: AssetImage('assets/images/family_bottom_sheet.png'),
              fit: BoxFit.cover,
            ),
          ),
          height: MediaQuery.of(context).size.height * 0.5,
          width: MediaQuery.of(context).size.width,
          child: Padding(
            padding: EdgeInsets.only(top: 48.h),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                MaterialButton(
                  onPressed: () {
                    if (isVideoFinished) {
                      setState(() {
                        isVideoFinished = false;
                        isBottomSheetOpen = false;
                      });
                      Navigator.pop(context);
                      controller.seekTo(Duration.zero);
                      controller.play();
                    }
                  },
                  child: Row(
                    children: [
                      Image.asset(
                        "assets/images/replay.png",
                        height: 40.h,
                        width: 40.w,
                      ),
                      Text(
                        'Repeat',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 20.sp,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  ),
                ),
                MaterialButton(
                  onPressed: () {
                  
                  //  navigateTo(context: context, widget:  SpeakScreen(storiesModel: widget.storiesModel, index: widget.index,categoriesModel: widget.categoryiesModel,index2: widget.index2,));
                  Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => SpeakScreen(storiesModel: widget.storiesModel, index: widget.index,categoriesModel: widget.categoryiesModel,index2: widget.index2,)),
              );
 //  navigateTo(context: context, widget:  SpeakScreen());


                  },
                  child: Row(
                    children: [
                      Image.asset(
                        "assets/images/microphone.png",
                        height: 40.h,
                        width: 40.w,
                      ),
                      Text(
                        'Speak',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 20.sp,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  ),
                ),
                MaterialButton(
                  onPressed: () {
                    // Handle save button click
                  },
                  child: Row(
                    children: [
                      Image.asset(
                        "assets/images/save_icon.png",
                        height: 40.h,
                        width: 40.w,
                      ),
                      Text(
                        'Save',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 20.sp,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          Center(
            child: SizedBox(
              width: MediaQuery.of(context).size.width,
              height: 337.h,
              child: VideoPlayer(controller),
            ),
          ),
          if (isVideoFinished && !isBottomSheetOpen)
            GestureDetector(
              onTap: () {
                setState(() {
                  isBottomSheetOpen = true;
                });
                _openBottomSheet();
              },
              child: Container(
                color: Colors.transparent,
              ),
            ),
        ],
      ),
    );
  }
}
