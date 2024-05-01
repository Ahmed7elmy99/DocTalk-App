class QuizModel {
  String? sentence;
  String? record;
  int? storyId;
  int? patientId;

  QuizModel({this.sentence, this.record, this.storyId, this.patientId});

  factory QuizModel.fromJson(Map<String, dynamic> json) => QuizModel(
        sentence: json['sentence'] as String?,
        record: json['record'] as String?,
        storyId: json['storyId'] as int?,
        patientId: json['patientId'] as int?,
      );

  Map<String, dynamic> toJson() => {
        'sentence': sentence,
        'record': record,
        'storyId': storyId,
        'patientId': patientId,
      };
}
