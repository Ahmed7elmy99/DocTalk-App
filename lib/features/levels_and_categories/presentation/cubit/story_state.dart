part of 'story_cubit.dart';

@immutable
sealed class StoryState {}

final class StoryInitial extends StoryState {}

final class StoryLoading extends StoryState {}

final class StoryLoaded extends StoryState {}

final class StoryFailure extends StoryState {
  final String errMessage;

  StoryFailure({required this.errMessage});
}
