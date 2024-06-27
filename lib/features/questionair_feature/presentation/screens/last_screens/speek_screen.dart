import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:audio_waveforms/audio_waveforms.dart';
import 'package:doc_talk/app/utils/consts.dart';
import 'package:doc_talk/features/levels_and_categories/data/models/categories_Model.dart';
import 'package:doc_talk/features/levels_and_categories/data/models/stories_Model.dart';
import 'package:doc_talk/features/levels_and_categories/presentation/screens/stories.dart';


import 'package:doc_talk/features/questionair_feature/cubit/quiz_cubit.dart';
import 'package:doc_talk/features/questionair_feature/presentation/screens/last_screens/go_to_quiz_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:record_mp3/record_mp3.dart';

import '../../../../../app/widgets/button_widget.dart';
import '../../../../../app/widgets/image_widget.dart';
import '../../../../../app/widgets/text_widget.dart';
import '../../../../levels_and_categories/presentation/cubit/story_cubit.dart';
import '../../../../quiz/widgets/custom_button.dart';







class SpeakScreen extends StatefulWidget {
  const SpeakScreen({super.key, required this.storiesModel, required this.categoriesModel, required this.index, required this.index2});
 final List<StoriesModel> storiesModel;
  final List<CategoryiesModel> categoriesModel;
  final int index ;
   final int index2 ;
  @override
  State<SpeakScreen> createState() => _SpeakScreenState();
}

class _SpeakScreenState extends State<SpeakScreen> {
  bool _isRecording = false;
  String? _filePath;
  String? _audioBase64;
  late RecorderController _recorderController;

  @override
  void initState() {
    super.initState();
    _initializeRecorder();
    _recorderController = RecorderController();
  }

  Future<void> _initializeRecorder() async {
    await Permission.microphone.request();
    if (await Permission.microphone.isGranted) {
      // Microphone permission granted
    } else {
      // Handle the case when the user denies the permission
      print('Microphone permission denied');
    }
  }

  Future<String> _convertAudioToBase64(String filePath) async {
    List<int> bytes = await File(filePath).readAsBytes();
    String base64String = base64Encode(bytes);

    // Ensure base64 string length is a multiple of 4
    int remainder = base64String.length % 4;
    if (remainder != 0) {
      base64String += '=' * (4 - remainder);
    }

    return base64String;
  }

  Future<void> _startRecording() async {
    try {
      await _initializeRecorder(); // Ensure permissions are requested
      Directory tempDir = await getTemporaryDirectory();
      String path = '${tempDir.path}/audio.mp3';
      bool hasPermission = await Permission.microphone.isGranted;

      if (hasPermission) {
        RecordMp3.instance.start(path, (type) {
          print("Record error--->$type");
        });

        _recorderController.record(); // Start the waveform recording

        setState(() {
          _isRecording = true;
          _filePath = path;
        });
      } else {
        print('Microphone permission denied');
      }
    } catch (e) {
      print('Error starting recorder: $e');
    }
  }

  Future<void> _stopRecording() async {
    try {
      bool stopResult = RecordMp3.instance.stop();
      if (stopResult && _filePath != null) {
        String base64 = await _convertAudioToBase64(_filePath!);
        _recorderController.stop(); // Stop the waveform recording

        setState(() {
          _isRecording = false;
          _audioBase64 = base64;
        });
        print('Recorded file path: $_filePath');
        log('Base64: $_audioBase64');

        if (_audioBase64 != null) {
          await context.read<QuizCubit>().postQuiz(
                record: _audioBase64!,
                sentence: "${widget.storiesModel[widget.index].title}",
                storyId: context.read<StoryCubit>().storyId,
              );
          bool? isPassed = context.read<QuizCubit>().isPassed;
          _showQuizPassedDialog(isPassed!);
        }
      }
    } catch (e) {
      print('Error stopping recorder: $e');
    }
  }

  void _showQuizPassedDialog(bool isPassed) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return QuizPassedDialog(isPassed: isPassed,storiesModel: widget.storiesModel, categoriesModel: widget.categoriesModel, index: widget.index, index2: widget.index2);
      },
    );
  }

  @override
  void dispose() {
    _recorderController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => QuizCubit(),
      child: Scaffold(
        backgroundColor: const Color(0xffFFD1BE),
        body: Column(
          children: [
             SizedBox(height: 100.h),
            Container(
              padding:  EdgeInsets.all(40.sp),
              decoration: BoxDecoration(
                border: Border.all(color: const Color(0xffBF4B00)),
                borderRadius: BorderRadius.circular(24),
              ),
              child: BlocBuilder<QuizCubit, QuizState>(
                builder: (context, state) {
                  return Column(
                    children: [
                      ButtonWidget(
                        onPressed: () async {
                          if (_isRecording) {
                            await _stopRecording();
                          } else {
                            await _startRecording();
                          }
                        },
                        outlined: false,
                        width: 226,
                        color: Colors.transparent,
                        mainAxisAlignment: MainAxisAlignment.center,
                        text:
                            _isRecording ? 'Stop Recording' : 'Speak this word',
                        textColor: const Color(0xff707070),
                        border: Border.all(color: const Color(0xff707070)),
                      ),
                       SizedBox(height: 24.h),
                       TextWidget(
                        title: "“${widget.storiesModel[widget.index].title}”",
                        titleSize: 32.sp,
                        titleColor: Colors.black,
                      ),
                    ],
                  );
                },
              ),
            ),
             SizedBox(height: 32.h),
            if (_isRecording)
              AudioWaveforms(
                recorderController: _recorderController,
                size: const Size(363, 80),
                waveStyle: const WaveStyle(
                  waveColor: Color(0xFFF19336),
                  extendWaveform: true,
                  showMiddleLine: false,
                ),
              )
            else
              Container(
                alignment: Alignment.center,
                child: Text(
                  "No Recording",
                  style: TextStyle(fontSize: 25.sp, color: Colors.white),
                ),
                width: 363.w,
                height: 80.h,
                decoration: BoxDecoration(
                  color: const Color(0xFFF19336),
                  borderRadius: BorderRadius.circular(10),
                ),
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
      ),
    );
  }
}

class QuizPassedDialog extends StatelessWidget {
  const QuizPassedDialog({super.key, required this.isPassed, required this.storiesModel, required this.categoriesModel, required this.index, required this.index2});
  final bool isPassed;
  final List<StoriesModel> storiesModel;
  final List<CategoryiesModel> categoriesModel;
  final int index ;
   final int index2 ;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: isPassed
          ? Image.asset('assets/images/thank.gif')
          : Image.asset('assets/images/oops.gif'),
      actions: <Widget>[
        TextButton(
          onPressed: () {
            if(isPassed && categoriesModel[index2].id == 1 &&storiesModel[index].title == "Review"){
    Navigator.pop(context);
                      navigateTo(context: context, widget: GoToQuizScreen1());
}else if(isPassed && categoriesModel[index2].id == 2 &&storiesModel[index].title == "Review"){
     Navigator.pop(context);
                      navigateTo(context: context, widget:GoToQuizScreen2 ());
}
else{
    navigateTo(context: context, widget: StoriesScreen(storiesModel: storiesModel,categoryiesModel: categoriesModel,index2: index2,));
}
           /* isPassed
                ? Navigator.of(context).pop()
                : Navigator.of(context).pop();*/
          },
          child: CustomButton(
            label: isPassed ? "Next" : "Again",
            color: const Color(0xFFF19336),
          ),
        ),
      ],
    );
  }
}