import 'package:bloc/bloc.dart';
import 'package:doc_talk/features/levels_and_categories/data/models/story_model.dart';
import 'package:flutter/cupertino.dart';

import '../../../../app/utils/cach_helper.dart';
import '../../../../app/utils/dio_helper.dart';

part 'story_state.dart';

class StoryCubit extends Cubit<StoryState> {
  StoryCubit() : super(StoryInitial());
  List<StoryModel> storiesModel = [];
  late int categoryId;

  getStoryByCategoryId(int categoryId) async {
    emit(StoryLoading());
    try {
      final response = await DioHelper.getData(
        url: "http://doctalkapi.runasp.net/api/Story/GetStoryByCategoryId",
        queryParameters: {"categoryId": categoryId},
        headers: {
          "Authorization": "${CacheHelper.getString(key: "token")}",
        },
      );
      this.categoryId = categoryId;

      storiesModel = (response.data as List)
          .map((item) => StoryModel.fromJson(item))
          .toList();

      debugPrint(response.statusCode.toString());
      debugPrint(response.data.toString());
      emit(StoryLoaded());
    } catch (e) {
      debugPrint(e.toString());
      emit(StoryFailure(errMessage: e.toString()));
    }
  }
}
