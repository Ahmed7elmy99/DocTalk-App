import 'package:bloc/bloc.dart';
import 'package:doc_talk/app/utils/dio_helper.dart';
import 'package:flutter/animation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

import '../../../app/utils/cach_helper.dart';
import '../models/quiz_model.dart';

part 'quiz_state.dart';

class QuizCubit extends Cubit<QuizState> {
  QuizCubit() : super(QuizInitial());
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
    });
  }
}
