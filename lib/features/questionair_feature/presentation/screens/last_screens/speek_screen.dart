import 'dart:convert';
import 'dart:io';

import 'package:doc_talk/app/widgets/button_widget.dart';
import 'package:doc_talk/app/widgets/image_widget.dart';
import 'package:doc_talk/app/widgets/text_widget.dart';
import 'package:doc_talk/features/levels_and_categories/presentation/cubit/story_cubit.dart';
import 'package:doc_talk/features/questionair_feature/cubit/quiz_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_sound_record/flutter_sound_record.dart';
import 'package:path_provider/path_provider.dart';

class SpeakScreen extends StatefulWidget {
  const SpeakScreen({super.key});

  @override
  State<SpeakScreen> createState() => _SpeakScreenState();
}

class _SpeakScreenState extends State<SpeakScreen> {
  FlutterSoundRecord flutterSoundRecord = FlutterSoundRecord();
  Directory? dcimDir;

  @override
  void initState() {
    super.initState();
    initDirectory();
  }

  Future<void> initDirectory() async {
    // Get the DCIM directory
    dcimDir = await getExternalStorageDirectories(type: StorageDirectory.dcim)
        .then((value) => value!.first);
    setState(() {}); // Refresh the UI with the new directory
  }

  Future<String> convertAudioToBase64(String filePath) async {
    // Read the audio file as bytes
    List<int> bytes = await File(filePath).readAsBytes();

    // Convert the bytes to base64
    String base64String = base64Encode(bytes);

    return base64String;
  }

  String? audioBase64;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => QuizCubit(),
      child: Scaffold(
        backgroundColor: const Color(0xffFFD1BE),
        body: Column(
          children: [
            100.verticalSpace,
            Container(
              padding: const EdgeInsets.all(40),
              decoration: BoxDecoration(
                  border: Border.all(color: const Color(0xffBF4B00)),
                  borderRadius: BorderRadius.circular(24)),
              child: BlocBuilder<QuizCubit, QuizState>(
                builder: (context, state) {
                  return Column(
                    children: [
                      ButtonWidget(
                        onPressed: () async {
                          await flutterSoundRecord.hasPermission();
                          try {
                            flutterSoundRecord.start(
                              path: '${dcimDir!.path}/audio.mp4',
                              encoder: AudioEncoder.AAC,
                              bitRate: 128000,
                              samplingRate: 44100,
                            );
                            String audioFilePath = '${dcimDir!.path}/audio.mp4';

                            // Convert the audio file to base64
                            String audioBase64 =
                                await convertAudioToBase64(audioFilePath);
                          } catch (e) {
                            print(e);
                          }
                          // globalAlertDialogue("",
                          //     canGif: true,
                          //     bColor: const Color(0xffF19336),
                          //     context: context,
                          //     okButtonText: "Next", onOk: () {
                          //   Navigator.pop(context);
                          //   navigateTo(
                          //       context: context,
                          //       widget: const GoToQuizScreen());
                          // }, canCancel: false);
                        },
                        outlined: false,
                        width: 226.w,
                        color: Colors.transparent,
                        mainAxisAlignment: MainAxisAlignment.center,
                        text: "Speak this word",
                        textColor: const Color(0xff707070),
                        border: Border.all(color: const Color(0xff707070)),
                      ),
                      24.verticalSpace,
                      TextWidget(
                        title: "“MOM”",
                        titleSize: 32.sp,
                        titleColor: Colors.black,
                      )
                    ],
                  );
                },
              ),
            ),
            32.verticalSpace,
            GestureDetector(
              onTap: () {
                flutterSoundRecord.stop();
                context.read<QuizCubit>().postQuiz(
                    record: audioBase64!,
                    storyId: context.read<StoryCubit>().storyId);
              },
              child: ImageWidget(
                width: 363.w,
                height: 80.h,
                imageUrl: "assets/images/Player.png",
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
