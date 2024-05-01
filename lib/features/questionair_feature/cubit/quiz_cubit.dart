import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:doc_talk/app/utils/dio_helper.dart';

import '../../../app/utils/cach_helper.dart';

part 'quiz_state.dart';

class QuizCubit extends Cubit<QuizState> {
  QuizCubit() : super(QuizInitial());

  postQuiz() async {
    emit(QuizLoading());
    try {
      final Response response = await DioHelper.postData(
        url: 'http://130.61.130.252/api/story/quiz',
        data: {
          "sentence": "dad",
          "record": "base64 string",
          "storyId": 1,
          "patientId": 1
        },
        headers: {
          "Authorization": "Bearer ${CacheHelper.getString(key: "token")}",
        },
      );
      emit(QuizPosted());
    } catch (e) {
      emit(QuizFailure());
    }
  }
}
