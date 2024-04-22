part of 'fetch_data_cubit.dart';

@immutable
sealed class FetchDataState {}

final class FetchDataInitial extends FetchDataState {}

final class FetchCategoriesDataLoading extends FetchDataState {}

final class FetchCategoriesDataLoaded extends FetchDataState {
  final List<CategoriesModel> categoriesList;
  FetchCategoriesDataLoaded(this.categoriesList);
}

final class FetchCategoriesDataFailure extends FetchDataState {
  final String errMessage;

  FetchCategoriesDataFailure({required this.errMessage});
}

final class FetchLevelsDataLoading extends FetchDataState {}

final class FetchLevelsDataLoaded extends FetchDataState {
  final List<LevelModel> levelsList;

  FetchLevelsDataLoaded( this.levelsList);
}

final class FetchLevelsDataFailure extends FetchDataState {
  final String errMessage;

  FetchLevelsDataFailure({required this.errMessage});
}
