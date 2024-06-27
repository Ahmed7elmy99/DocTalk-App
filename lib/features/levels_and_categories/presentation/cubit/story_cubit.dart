import 'package:bloc/bloc.dart';
import 'package:doc_talk/app/utils/cach_helper.dart';
import 'package:doc_talk/features/levels_and_categories/data/models/story_model.dart';
import 'package:flutter/cupertino.dart';


import '../../../../app/utils/dio_helper.dart';

part 'story_state.dart';

class StoryCubit extends Cubit<StoryState> {
  StoryCubit() : super(StoryInitial());
  List<StoryModel> storiesModel = [];
  int storyId = 1;
  getStoryByCategoryId(int categoryId) async {
    emit(StoryLoading());
    try {
      final response = await DioHelper.getData(
        url: "http://doctalkapi.runasp.net/api/Story/GetStoryByCategoryId",
        queryParameters: {"categoryId": categoryId},
        headers: {
          "Authorization": "${CashHelper.getString(key: "token")}",
        },
      );

      if (response.data is List) {
        storiesModel = (response.data as List)
            .map((item) => StoryModel.fromJson(item))
            .toList();
        debugPrint(response.statusCode.toString());
        debugPrint(response.data.toString());
        emit(StoryLoaded());
      } else {
        throw Exception("Expected a list but got something else");
      }
    } catch (e) {
      debugPrint(' The Error is  ${e.toString()}');
      emit(StoryFailure(errMessage: e.toString()));
    }
  }
}
