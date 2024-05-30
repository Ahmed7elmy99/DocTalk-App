import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:doc_talk/app/utils/dio_helper.dart';
import 'package:doc_talk/features/questionair_feature/data/model/quiz_response.dart';

import '../../../app/utils/cach_helper.dart';

part 'quiz_state.dart';

class QuizCubit extends Cubit<QuizState> {
  QuizCubit() : super(QuizInitial());

  bool isPassed = false;
  postQuiz({required String record, storyId}) async {
    emit(QuizLoading());
    try {
      final Response response = await DioHelper.postData(
        url: 'http://130.61.130.252/api/story/quiz',
        data: {
          "sentence": "dad",
          "record": "base64 string",
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
    } catch (e) {
      emit(QuizFailure());
    }
  }
}
