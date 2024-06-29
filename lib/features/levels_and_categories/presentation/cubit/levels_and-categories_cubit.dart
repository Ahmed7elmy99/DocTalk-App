import 'package:dio/dio.dart';

import 'package:doc_talk/app/utils/cach_helper.dart';
import 'package:doc_talk/app/utils/dio_helper.dart';
import 'package:doc_talk/features/levels_and_categories/data/models/categories_Model.dart';
import 'package:doc_talk/features/levels_and_categories/data/models/levels_model.dart';
import 'package:doc_talk/features/levels_and_categories/data/models/stories_Model.dart';
import 'package:doc_talk/features/levels_and_categories/presentation/cubit/levels_and-categories_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LevelsCubit extends Cubit<LevelState> {
  LevelsCubit() : super(LevelInitial());

  static LevelsCubit get(context) => BlocProvider.of<LevelsCubit>(context);

  List<LevelsModel> levelModel = [];
   int selectedIndex=0;

  // Other methods and properties

  void setSelectedIndex(int index) {
    selectedIndex = index;
  }

  Future<void> getLevelsData({
    required BuildContext context,
  }) async {
    emit(LevelLoading());

    try {
      final response = await DioHelper.getData(
        url: "http://doctalkapi.runasp.net/api/Level/GetLevel",
        headers: {
          "Authorization": "${CashHelper.getString(key: "token")}",
        },
      );

      if (response.data is List) {
        levelModel = List<LevelsModel>.from(
          response.data.map((item) => LevelsModel.fromJson(item)),
        );
      } else {
        throw Exception("Invalid response format");
      }

      print(response.data);
      print("Success");

      emit(LevelSuccess());
    } catch (e) {
      if (e is DioError) {
        if (e.response != null) {
          print(
              "DioError [${e.response?.statusCode}] ${e.response?.statusMessage}");
        } else {
          print("DioError: ${e.message}");
        }
      } else {
        print("Error: $e");
      }

      emit(LevelError());
    }
  }

  List<CategoryiesModel> categoryiesModel = [];

  Future<void> getCategoriesData({
    required BuildContext context,
    required int levelId,
  }) async {
    emit(CategoryLoading());

    try {
      final response = await DioHelper.getData(
        url: "http://doctalkapi.runasp.net/api/Category/GetCategoryByLevelId",
        headers: {
          "Authorization": "${CashHelper.getString(key: "token")}",
        },
        queryParameters: {"levelId": levelId},
      );

      if (response.data is List) {
        categoryiesModel = List<CategoryiesModel>.from(
          response.data.map((item) => CategoryiesModel.fromJson(item)),
        );
      } else {
        throw Exception("Invalid response format");
      }

      print(response.data);
      print("Success");

      emit(CategorySuccess());
    } catch (e) {
      if (e is DioError) {
        if (e.response != null) {
          print(
              "DioError [${e.response?.statusCode}] ${e.response?.statusMessage}");
        } else {
          print("DioError: ${e.message}");
        }
      } else {
        print("Error: $e");
      }

      emit(CategoryError());
    }
  }
    List<CategoryiesModel> categoryiesModel2 = [];

  Future<void> getCategoriesHomeData({
    required BuildContext context,
    required int levelId,
  }) async {
    emit(CategoryHomeLoading());

    try {
      final response = await DioHelper.getData(
        url: "http://doctalkapi.runasp.net/api/Category/GetCategoryByLevelId",
        headers: {
          "Authorization": "${CashHelper.getString(key: "token")}",
        },
        queryParameters: {"levelId": levelId},
      );

      if (response.data is List) {
        categoryiesModel2 = List<CategoryiesModel>.from(
          response.data.map((item) => CategoryiesModel.fromJson(item)),
        );
      } else {
        throw Exception("Invalid response format");
      }

      print(response.data);
      print("Success");

      emit(CategoryHomeSuccess());
    } catch (e) {
      if (e is DioError) {
        if (e.response != null) {
          print(
              "DioError [${e.response?.statusCode}] ${e.response?.statusMessage}");
        } else {
          print("DioError: ${e.message}");
        }
      } else {
        print("Error: $e");
      }

      emit(CategoryHomeError());
    }
  }
  List<StoriesModel> storiesModel = [];

  Future<void> getStoriesByCategoryId({
    required BuildContext context,
    required int CategoryId,
  }) async {
    emit(StoriesLoading());

    try {
      final response = await DioHelper.getData(
        url: "http://doctalkapi.runasp.net/api/Story/GetStoryByCategoryId",
        headers: {
          "Authorization": "${CashHelper.getString(key: "token")}",
        },
        queryParameters: {"categoryId": CategoryId},
      );

      if (response.data is List) {
        storiesModel = List<StoriesModel>.from(
          response.data.map((item) => StoriesModel.fromJson(item)),
        );
      } else {
        throw Exception("Invalid response format");
      }

      print(response.data);
      print("Success");

      emit(StoriesSuccess());
    } catch (e) {
      if (e is DioError) {
        if (e.response != null) {
          print(
              "DioError [${e.response?.statusCode}] ${e.response?.statusMessage}");
        } else {
          print("DioError: ${e.message}");
        }
      } else {
        print("Error: $e");
      }

      emit(StoriesError());
    }
  }
List<StoriesModel> storiesModel1 = [];
  Future<void> getFavoritesStories({
    required BuildContext context,
    
  }) async {
    emit(FavoritesLoading());

    try {
      final response = await DioHelper.getData(
        url: "http://130.61.130.252/api/story/favorite",
        headers: {
        //  "Authorization": "${CashHelper.getString(key: "token")}",
        "Authorization":"Bearer ${ CashHelper.getString(key: "token")}"
        },
       // queryParameters: {"categoryId": CategoryId},
      );

      if (response.data is List) {
        storiesModel1 = List<StoriesModel>.from(
          response.data.map((item) => StoriesModel.fromJson(item)),
        );
      } else {
        throw Exception("Invalid response format");
      }

      print(response.data);
      print("Success");

      emit(FavoritesSuccess());
    } catch (e) {
      if (e is DioError) {
        if (e.response != null) {
          print(
              "DioError [${e.response?.statusCode}] ${e.response?.statusMessage}");
        } else {
          print("DioError: ${e.message}");
        }
      } else {
        print("Error: $e");
      }

      emit(FavoritesError());
    }
  }

  List<StoriesModel> storiesModel2 = [];
    Future<void> addToFavoritesStories({
  
    required BuildContext context,
    required int storyId,
  }) async {
    emit(FavoritesLoading());

    try {
      final response = await DioHelper.postData(
        url:"http://130.61.130.252/api/story/favorite/$storyId",
        headers: {
        //  "Authorization": "${CashHelper.getString(key: "token")}",
        "Authorization":"Bearer ${ CashHelper.getString(key: "token")}"
        },
       // queryParameters: {"storyId": storyId},
      );

   /*   if (response.data is List) {
        storiesModel2 = List<StoriesModel>.from(
          response.data.map((item) => StoriesModel.fromJson(item)),
        );
      } else {
        throw Exception("Invalid response format");
      }*/

      print(response.data);
      print("added to favorites successfully");

      emit(FavoritesSuccess());
    } catch (e) {
      if (e is DioError) {
        if (e.response != null) {
          print(
              "DioError [${e.response?.statusCode}] ${e.response?.statusMessage}");
        } else {
          print("DioError: ${e.message}");
        }
      } else {
        print("Error: $e");
      }

      emit(FavoritesError());
    }
  }
  
}
