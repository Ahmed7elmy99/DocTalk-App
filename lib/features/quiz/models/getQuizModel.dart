class GetQuizModel {
  GetQuizModel({
      this.id, 
      this.quizType, 
      this.categoryId, 
      this.levelId,});

  GetQuizModel.fromJson(dynamic json) {
    id = json['id'];
    quizType = json['quizType'];
    categoryId = json['categoryId'];
    levelId = json['levelId'];
  }
  num? id;
  String? quizType;
  num? categoryId;
  num? levelId;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['quizType'] = quizType;
    map['categoryId'] = categoryId;
    map['levelId'] = levelId;
    return map;
  }

}