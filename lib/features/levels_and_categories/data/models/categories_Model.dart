class CategoryiesModel {
  int? id;
  String? title;
  int? order;
  String? image;
  int? successValue;
  int? levelId;
  Null? level;

  CategoryiesModel(
      {this.id,
      this.title,
      this.order,
      this.image,
      this.successValue,
      this.levelId,
      this.level});

  CategoryiesModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    order = json['order'];
    image = json['image'];
    successValue = json['successValue'];
    levelId = json['levelId'];
    level = json['level'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['order'] = this.order;
    data['image'] = this.image;
    data['successValue'] = this.successValue;
    data['levelId'] = this.levelId;
    data['level'] = this.level;
    return data;
  }
}
