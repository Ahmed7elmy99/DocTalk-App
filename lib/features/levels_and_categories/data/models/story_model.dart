class StoryModel {
  int? id;
  String? title;
  int? order;
  int? successValue;
  String? video;
  int? categoryId;
  bool? passed;
  DateTime? createdAt;
  DateTime? updatedAt;

  StoryModel({
    this.id,
    this.title,
    this.order,
    this.successValue,
    this.video,
    this.categoryId,
    this.passed,
    this.createdAt,
    this.updatedAt,
  });

  factory StoryModel.fromJson(Map<String, dynamic> json) => StoryModel(
        id: json['id'] as int?,
        title: json['title'] as String?,
        order: json['order'] as int?,
        successValue: json['successValue'] as int?,
        video: json['video'] as String?,
        categoryId: json['categoryId'] as int?,
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
        'video': video,
        'categoryId': categoryId,
        'passed': passed,
        'createdAt': createdAt?.toIso8601String(),
        'updatedAt': updatedAt?.toIso8601String(),
      };
}
