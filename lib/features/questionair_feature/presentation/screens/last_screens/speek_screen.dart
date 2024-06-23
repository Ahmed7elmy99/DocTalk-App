import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_sound_record/flutter_sound_record.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';

import '../../../../../app/widgets/button_widget.dart';
import '../../../../../app/widgets/image_widget.dart';
import '../../../../../app/widgets/text_widget.dart';
import '../../../../levels_and_categories/presentation/cubit/story_cubit.dart';
import '../../../cubit/quiz_cubit.dart';

class SpeakScreen extends StatefulWidget {
  const SpeakScreen({super.key});

  @override
  State<SpeakScreen> createState() => _SpeakScreenState();
}

class _SpeakScreenState extends State<SpeakScreen> {
  final FlutterSoundRecord _recorder = FlutterSoundRecord();
  bool _isRecording = false;
  String? _filePath;
  String? _audioBase64;

  @override
  void initState() {
    super.initState();
    _initializeRecorder();
  }

  @override
  void dispose() {
    _recorder.stop();
    super.dispose();
  }

  Future<void> _initializeRecorder() async {
    await Permission.microphone.request();
    if (await Permission.microphone.isGranted) {
      // Initialize the recorder if any initialization is needed
    } else {
      // Handle the case when the user denies the permission
      print('Microphone permission denied');
    }
  }

  Future<String> _convertAudioToBase64(String filePath) async {
    List<int> bytes = await File(filePath).readAsBytes();
    return base64Encode(bytes);
  }

  Future<void> _startRecording() async {
    try {
      Directory tempDir = await getTemporaryDirectory();
      String path = '${tempDir.path}/audio.mp3';

      await _recorder.start(
        path: path,
        encoder: AudioEncoder.AAC, // MP3 encoding
        bitRate: 128000, // You can adjust the bitrate if necessary
      );

      setState(() {
        _isRecording = true;
        _filePath = path;
      });
    } catch (e) {
      print('Error starting recorder: $e');
    }
  }

  Future<void> _stopRecording() async {
    try {
      await _recorder.stop();
      if (_filePath != null) {
        String base64 = await _convertAudioToBase64(_filePath!);
        setState(() {
          _isRecording = false;
          _audioBase64 = base64;
        });
        print('Recorded file path: $_filePath');
        print('Base64: $_audioBase64');
      }
    } catch (e) {
      print('Error stopping recorder: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => QuizCubit(),
      child: Scaffold(
        backgroundColor: const Color(0xffFFD1BE),
        body: Column(
          children: [
            const SizedBox(height: 100),
            Container(
              padding: const EdgeInsets.all(40),
              decoration: BoxDecoration(
                border: Border.all(color: const Color(0xffBF4B00)),
                borderRadius: BorderRadius.circular(24),
              ),
              child: BlocBuilder<QuizCubit, QuizState>(
                builder: (context, state) {
                  return Column(
                    children: [
                      ElevatedButton(
                        onPressed: () async {
                          if (_isRecording) {
                            _stopRecording();
                            context.read<QuizCubit>().postQuiz(
                                record: _audioBase64!,
                                storyId: context
                                    .read<StoryCubit>()
                                    .storyId
                                    .toString());
                          } else {
                            await _startRecording();
                          }
                        },
                        child: Text(_isRecording
                            ? 'Stop Recording'
                            : 'Start Recording'),
                      ),
                      ButtonWidget(
                        onPressed: () async {
                          // You can handle any additional button logic here if needed
                        },
                        outlined: false,
                        width: 226,
                        color: Colors.transparent,
                        mainAxisAlignment: MainAxisAlignment.center,
                        text: "Speak this word",
                        textColor: const Color(0xff707070),
                        border: Border.all(color: const Color(0xff707070)),
                      ),
                      const SizedBox(height: 24),
                      const TextWidget(
                        title: "“MOM”",
                        titleSize: 32,
                        titleColor: Colors.black,
                      ),
                    ],
                  );
                },
              ),
            ),
            const SizedBox(height: 32),
            GestureDetector(
              onTap: () async {
                try {
                  context.read<QuizCubit>().postQuiz(
                      record: _audioBase64!,
                      storyId: context.read<StoryCubit>().storyId.toString());
                } catch (e) {
                  print('Error posting quiz: $e');
                }
              },
              child: const ImageWidget(
                width: 363,
                height: 80,
                imageUrl: "assets/images/Player.png",
              ),
            ),
            const Spacer(),
            const Align(
              alignment: AlignmentDirectional.bottomStart,
              child: ImageWidget(
                width: 200,
                height: 400,
                imageUrl: "assets/images/image.png",
              ),
            ),
          ],
        ),
      ),
    );
  }
}
