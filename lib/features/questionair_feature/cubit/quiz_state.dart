part of 'quiz_cubit.dart';

abstract class QuizState {}

final class QuizInitial extends QuizState {}

final class QuizLoading extends QuizState {}

final class QuizPosted extends QuizState {}

final class QuizFailure extends QuizState {}
