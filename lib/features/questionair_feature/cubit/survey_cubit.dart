import 'package:dio/dio.dart';
import 'package:doc_talk/app/utils/consts.dart';

import 'package:doc_talk/app/utils/dio_helper.dart';
import 'package:doc_talk/features/questionair_feature/cubit/states_survey.dart';
import 'package:doc_talk/features/questionair_feature/data/model/survey_model.dart';
import 'package:doc_talk/features/questionair_feature/data/model/survey_result_model.dart';
import 'package:doc_talk/result/views/result_view.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SurveyCubit extends Cubit<SurveyStates> {
  SurveyCubit() : super(SurveyInitialState());
  static SurveyCubit get(context) => BlocProvider.of(context);

  late SurveyModel surveyModel;
  int? answerId;
  List<int> answerIds = [];
  late PatientSurveyResults patientSurveyResults;

  chooseAnswerSurvey(int val) {
    answerId = val;
    print(val);
    answerIds.add(val);
    print(answerIds);
    emit(AnswerIdStates());
  }

  getSurveyData({
    required BuildContext context,
    required int id,
  }) async {
    emit((SurveyLoadingStates()));
    await DioHelper.getData(
        url: "http://doctalkapi.runasp.net/api/Survey/GetAllSurvey",
        queryParameters: {
          "id": id,
        }).then((value) {
      surveyModel = SurveyModel.fromJson(value.data);

      print(value.data);
      print("sucesssssssss");

      emit((SurveySuccessStates()));
    }).catchError((e) {
      if (e is DioError) {
        // Handle DioError
        if (e.response != null) {
          // The request was made and the server responded with a status code
          print(
              "DioError [${e.response?.statusCode}] ${e.response?.statusMessage}");
        } else {
          // Something went wrong during the request
          print("DioError: ${e.message}");
        }
      } else {
        // Handle other types of errors
        print("Error: $e");
      }

      print(e);
      emit((SurveyErrorStates()));
    });
  }

  getPatientSurveyResults({
    required BuildContext context,
  }) async {
    emit((SurveyResultLoadingStates()));
    await DioHelper.getData(
      url: "http://130.61.130.252/api/patient/survey",
    ).then((value) {
      print(value.data);
      print("sucesssssssss");
      patientSurveyResults = PatientSurveyResults.fromJson(value.data);

      emit((SurveyResultSuccessStates()));
    }).catchError((e) {
      if (e is DioError) {
        // Handle DioError
        if (e.response != null) {
          // The request was made and the server responded with a status code
          print(
              "DioError [${e.response?.statusCode}] ${e.response?.statusMessage}");
        } else {
          // Something went wrong during the request
          print("DioError: ${e.message}");
        }
      } else {
        // Handle other types of errors
        print("Error: $e");
      }

      print(e);
      emit((SurveyResultErrorStates()));
    });
  }

  createPatientSurvey({
    required BuildContext context,
  }) async {
    emit((CreatePatientSurveyLoadingStates()));
    await DioHelper.postData(
      url: "http://130.61.130.252/api/patient/survey",
      data: {
        "patientSurveyAnswersIds": SurveyCubit.get(context).answerIds,
      },
    ).then((value) {
      print(value.data);
      print("sucesssssssss");
      // getPatientSurveyResults(context: context);
      navigateTo(
          context: context,
          widget: ResultView(
            patientSurveyResults: patientSurveyResults,
          ));
      emit((CreatePatientSurveySuccessStates()));
    }).catchError((e) {
      if (e is DioError) {
        // Handle DioError
        if (e.response != null) {
          // The request was made and the server responded with a status code
          print(
              "DioError [${e.response?.statusCode}] ${e.response?.statusMessage}");
        } else {
          // Something went wrong during the request
          print("DioError: ${e.message}");
        }
      } else {
        // Handle other types of errors
        print("Error: $e");
      }

      print(e);
      emit((CreatePatientSurveyErrorStates()));
    });
  }
}
