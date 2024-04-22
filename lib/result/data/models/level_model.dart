class LevelModel {
  int? id;
  String? title;
  int? order;
  int? successValue;
  bool? passed;
  DateTime? createdAt;
  DateTime? updatedAt;

  LevelModel({
    this.id,
    this.title,
    this.order,
    this.successValue,
    this.passed,
    this.createdAt,
    this.updatedAt,
  });

  factory LevelModel.fromJson(Map<String, dynamic> json) => LevelModel(
        id: json['id'] as int?,
        title: json['title'] as String?,
        order: json['order'] as int?,
        successValue: json['successValue'] as int?,
        passed: json['passed'] as bool?,
        createdAt: json['createdAt'] == null
            ? null
            : DateTime.parse(json['createdAt'] as String),
        updatedAt: json['updatedAt'] == null
            ? null
            : DateTime.parse(json['updatedAt'] as String),
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'title': title,
        'order': order,
        'successValue': successValue,
        'passed': passed,
        'createdAt': createdAt?.toIso8601String(),
        'updatedAt': updatedAt?.toIso8601String(),
      };
}
