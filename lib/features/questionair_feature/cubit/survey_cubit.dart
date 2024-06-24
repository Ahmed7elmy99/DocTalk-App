

import 'package:dio/dio.dart';
import 'package:doc_talk/app/utils/cach_helper.dart';

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
 // late PatientSurveyResults patientSurveyResults;

  chooseAnswerSurvey(int val) {
    answerId = val;
    // answerIds.clear();
   /* if (!answerIds.contains(val)) {
      answerIds.add(val);
    }*/
    emit(AnswerIdStates());
    print(val);
   // print(answerIds);

   /* answerId = val;
    emit(AnswerIdStates());
    print(val);
    answerIds.add(val);
    print(answerIds);*/
  }

  saveAnswerSurvey() {
    answerIds.add(answerId!);
    
    print(answerIds);
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
    //  patientSurveyResults = PatientSurveyResults.fromJson(value.data);

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

  late SurveyResultModel surveyResultModel;
  createPatientSurvey({
    required BuildContext context,
  }) async {
    emit((CreatePatientSurveyLoadingStates()));
       print(CashHelper.getString(key: "token"));
     DioHelper.postData(
      url: "http://130.61.130.252/api/patient/survey",
      data: {
        "patientSurveyAnswersIds": answerIds,
      },
      
       headers:{
       // "Accept": "application/json",
       // "Content-Type": "application/json",
       "Authorization":"Bearer ${ CashHelper.getString(key: "token")}" ,
       
     // "Authorization": "Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6NywiaWF0IjoxNzEzNjUxNzgwLCJleHAiOjE3MTM2ODc3ODB9.qul-xatlJKXwAOVyzgwd3If7iIrrxgaeXBRTKXXFL4o"
       }
       
    ).then((value) {
   
      surveyResultModel= SurveyResultModel.fromJson(value.data);
      print(value.data);
      print("sucesssssssss");
      // await getPatientSurveyResults(context: context);
        Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => ResultView(
            surveyResultModel: surveyResultModel,
          ) ),
            );
     /* navigateTo(
          context: context,
          widget: ResultView(
            surveyResultModel: surveyResultModel,
          ));*/
         //     CashHelper.setString(key: "lpdRate", value: surveyResultModel.lpdRate.toString());
          //      CashHelper.setString(key: "diagnoses", value: surveyResultModel.diagnoses.toString());
      emit((CreatePatientSurveySuccessStates()));
    }).catchError((e) {
      //print(e)
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
