class QuizResponse {
  bool? passed;
  int? result;
  int? storyId;
  int? patientId;
  DateTime? createdAt;
  DateTime? updatedAt;

  QuizResponse({
    this.passed,
    this.result,
    this.storyId,
    this.patientId,
    this.createdAt,
    this.updatedAt,
  });

  factory QuizResponse.fromJson(Map<String, dynamic> json) => QuizResponse(
        passed: json['passed'] as bool?,
        result: json['result'] as int?,
        storyId: json['storyId'] as int?,
        patientId: json['patientId'] as int?,
        createdAt: json['createdAt'] == null
            ? null
            : DateTime.parse(json['createdAt'] as String),
        updatedAt: json['updatedAt'] == null
            ? null
            : DateTime.parse(json['updatedAt'] as String),
      );

  Map<String, dynamic> toJson() => {
        'passed': passed,
        'result': result,
        'storyId': storyId,
        'patientId': patientId,
        'createdAt': createdAt?.toIso8601String(),
        'updatedAt': updatedAt?.toIso8601String(),
      };
}
