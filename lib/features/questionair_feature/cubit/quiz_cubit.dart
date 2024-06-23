import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:doc_talk/app/utils/dio_helper.dart';
import 'package:doc_talk/features/questionair_feature/data/model/quiz_response.dart';
import 'package:flutter/material.dart';

import '../../../app/utils/cach_helper.dart';

part 'quiz_state.dart';

class QuizCubit extends Cubit<QuizState> {
  QuizCubit() : super(QuizInitial());
  bool isPassed = false;

  Future<void> postQuiz(
      {required String record, required String storyId}) async {
    if (record.isEmpty || storyId.isEmpty) {
      print('Record or storyId is empty');
      emit(QuizFailure());
      return;
    }

    emit(QuizLoading());
    try {
      final Response response = await DioHelper.postData(
        url: 'http://130.61.130.252/api/story/quiz',
        data: {
          "sentence": "dad",
          "record": record,
          "storyId": storyId,
          "patientId": CacheHelper.getInt(key: 'id')
        },
        headers: {
          "Authorization": "Bearer ${CacheHelper.getString(key: "token")}",
        },
      );
      final quizPassed = QuizResponse.fromJson(response.data);
      isPassed = quizPassed.passed!;

      emit(QuizPosted());
    } on DioException catch (e) {
      if (e.response != null) {
        // Log detailed error information
        print('Request data: ${e.response!.requestOptions.data}');
        print('Response data: ${e.response!.data}');
        print('Status code: ${e.response!.statusCode}');
        print('Headers: ${e.response!.headers}');
      } else {
        print('Error: $e');
      }
      emit(QuizFailure());
    } catch (e) {
      debugPrint('Unexpected error: ${e.toString()}');
      emit(QuizFailure());
    }
  }
}
