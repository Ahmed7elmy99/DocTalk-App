class LevelsModel {
  int? id;
  String? title;
  int? order;
  int? successValue;
  bool? passed;

  LevelsModel({
    this.id,
    this.title,
    this.order,
    this.successValue,
    this.passed,
  });

  LevelsModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    order = json['order'];
    successValue = json['successValue'];
    passed = json['passed'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['order'] = this.order;
    data['successValue'] = this.successValue;
    data['passed'] = this.passed;
    return data;
  }
}