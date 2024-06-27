import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:doc_talk/app/utils/dio_helper.dart';
import 'package:flutter/material.dart';

import '../../../app/utils/cach_helper.dart';

part 'quiz_state.dart';

class QuizCubit extends Cubit<QuizState> {
  QuizCubit() : super(QuizInitial());

  bool isPassed = false;
  postQuiz({required String record, storyId,sentence}) async {
    emit(QuizLoading());
    try {
      final Response response = await DioHelper.postData(
        url: 'http://130.61.130.252/api/story/quiz',
        data: {
          "sentence": sentence,
          "record": record,
          "storyId": storyId,
          "patientId":1
          //CashHelper.getInt(key: "id")
        },
        headers: {
          "Authorization": "Bearer ${CashHelper.getString(key: "token")}",
        },
      );
      print(response.data);
      isPassed = response.data['result']['passed'];
      print(isPassed);
      emit(QuizPosted());
    } catch (e) {
      debugPrint(' The Error is  ${e.toString()}');
      emit(QuizFailure());
    }
  }
}
