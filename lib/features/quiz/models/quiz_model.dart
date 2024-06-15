class QuizModel {
  QuizModel({
      this.id, 
      this.name, 
      this.image, 
      this.audio, 
      this.quizId, 
      this.quiz, 
      this.createdAt, 
      this.updatedAt,});

  QuizModel.fromJson(dynamic json) {
    id = json['id'];
    name = json['name'];
    image = json['image'];
    audio = json['audio'];
    quizId = json['quizId'];
    quiz = json['quiz'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
  }
  num? id;
  String? name;
  String? image;
  String? audio;
  num? quizId;
  dynamic quiz;
  String? createdAt;
  String? updatedAt;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['name'] = name;
    map['image'] = image;
    map['audio'] = audio;
    map['quizId'] = quizId;
    map['quiz'] = quiz;
    map['createdAt'] = createdAt;
    map['updatedAt'] = updatedAt;
    return map;
  }

}