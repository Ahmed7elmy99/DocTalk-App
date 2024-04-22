class CategoriesModel {
  int? id;
  String? title;
  int? order;
  String? image;
  int? successValue;
  int? levelId;
  bool? passed;
  DateTime? createdAt;
  DateTime? updatedAt;

  CategoriesModel({
    this.id,
    this.title,
    this.order,
    this.image,
    this.successValue,
    this.levelId,
    this.passed,
    this.createdAt,
    this.updatedAt,
  });

  factory CategoriesModel.fromJson(Map<String, dynamic> json) {
    return CategoriesModel(
      id: json['id'] as int?,
      title: json['title'] as String?,
      order: json['order'] as int?,
      image: json['image'] as String?,
      successValue: json['successValue'] as int?,
      levelId: json['levelId'] as int?,
      passed: json['passed'] as bool?,
      createdAt: json['createdAt'] == null
          ? null
          : DateTime.parse(json['createdAt'] as String),
      updatedAt: json['updatedAt'] == null
          ? null
          : DateTime.parse(json['updatedAt'] as String),
    );
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'title': title,
        'order': order,
        'image': image,
        'successValue': successValue,
        'levelId': levelId,
        'passed': passed,
        'createdAt': createdAt?.toIso8601String(),
        'updatedAt': updatedAt?.toIso8601String(),
      };
}
