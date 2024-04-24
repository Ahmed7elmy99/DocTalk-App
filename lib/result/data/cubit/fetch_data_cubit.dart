import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:doc_talk/app/utils/dio_helper.dart';
import 'package:doc_talk/result/data/models/level_model.dart';
import 'package:flutter/cupertino.dart';

import '../models/categories_model.dart';

part 'fetch_data_state.dart';

class FetchDataCubit extends Cubit<FetchDataState> {
  FetchDataCubit() : super(FetchDataInitial());
  late CategoriesModel categoriesModel;

  void fetchCategoriesData() async {
    emit(FetchCategoriesDataLoading());

    try {
      final Response response = await DioHelper.getData(
          url: 'http://doctalkapi.runasp.net/api/Category/GetCategory');
      if (response.statusCode == 200) {
        final categories = response.data.map<CategoriesModel>((item) {
          return CategoriesModel.fromJson(item);
        }).toList();
        debugPrint('Success');
        emit(FetchCategoriesDataLoaded(categories));
      }
    } catch (e) {
      debugPrint(e.toString());
      emit(FetchCategoriesDataFailure(errMessage: e.toString()));
    }
  }

  fetchLevelsData() async {
    emit(FetchLevelsDataLoading());
    try {
      final response = await DioHelper.getData(
          url: 'http://doctalkapi.runasp.net/api/Level/GetLevel');
      if (response.statusCode == 200) {
        final levels = response.data.map<LevelModel>((item) {
          return LevelModel.fromJson(item);
        }).toList();

        emit(FetchLevelsDataLoaded(levels));
      }
    } catch (e) {
      debugPrint(e.toString());
      emit(FetchLevelsDataFailure(errMessage: e.toString()));
    }
  }
}
