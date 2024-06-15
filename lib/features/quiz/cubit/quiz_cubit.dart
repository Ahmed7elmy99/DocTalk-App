import 'package:bloc/bloc.dart';
import 'package:doc_talk/app/utils/dio_helper.dart';
<<<<<<< HEAD
import 'package:flutter/animation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

import '../../../app/utils/cach_helper.dart';
import '../models/quiz_model.dart';
=======
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

import '../models/getQuizModel.dart';
>>>>>>> c4827c53ae93b65a9a1f680dbac2dfac087b5090

part 'quiz_state.dart';

class QuizCubit extends Cubit<QuizState> {
  QuizCubit() : super(QuizInitial());
<<<<<<< HEAD
  static QuizCubit getObject(context ) => BlocProvider.of(context);

  int correct = 0;

  List<QuizModel> ?quiz ;


  void getQuiz(){
    emit(QuizLoad());
    print("1");
    DioHelper.getData(
        url: "http://doctalkapi.runasp.net/api/QuizAnswer/GetQuizAnswerByQuizId?quizId=1",
      headers: {
          "Authorization":"Bearer ${ CashHelper.getString(key: "token")}",
      }
    ).then((value) {
      for(var e in value.data){
        quiz?.add(QuizModel.fromJson(e));
      }
      print("Doneeeeeeeeeeee");
      emit(QuizInitial());
    }).catchError((e){
      print(e.toString());
      emit(QuizInitial());
=======
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
>>>>>>> c4827c53ae93b65a9a1f680dbac2dfac087b5090
    });
  }
}
