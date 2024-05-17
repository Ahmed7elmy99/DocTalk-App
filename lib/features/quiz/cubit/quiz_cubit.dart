import 'package:bloc/bloc.dart';
import 'package:doc_talk/app/utils/dio_helper.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

import '../models/getQuizModel.dart';

part 'quiz_state.dart';

class QuizCubit extends Cubit<QuizState> {
  QuizCubit() : super(QuizInitial());
  static QuizCubit get(context) => BlocProvider.of(context);

List<GetQuizModel> quizModel = [];
  void getQuiz(){
    emit(QuizLoading());
    DioHelper.getData(
        url: "http://doctalkapi.runasp.net/api/Quiz/GetQuiz",
    ).then((value) {
      value.data.forEach((e){
        quizModel.add(GetQuizModel.fromJson(e));
      });
      print(value.data);
      print(quizModel[0].categoryId.toString());
    }).catchError((onError){
      print(onError.toString());
    });
  }

  void getQuizById({required int id}){
    emit(QuizLoading());
    DioHelper.getData(
        url: "http://doctalkapi.runasp.net/api/Quiz/GetQuizById",
      queryParameters: {
          "id":id
      }
    ).then((value) {
      print("Sucess");
      print(value);
    }).catchError((onError){
      print(onError.toString());
    });
  }
  void createQuiz(){
    emit(QuizLoading());
    DioHelper.postData(
        url: "http://doctalkapi.runasp.net/api/Quiz/CreateQuiz",
      data: {
        "quizType":2 ,
        "categoryId": 2,
        "levelId": 1
      }
    ).then((value) {
      print("Sucess");
      print(value);
    }).catchError((onError){
      print(onError.toString());
    });
  }
}
