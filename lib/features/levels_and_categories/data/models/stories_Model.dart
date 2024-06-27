class StoriesModel {
  int? id;
  String? title;
  int? order;
  int? successValue;
  String? video;
  int? categoryId;
  Null? category;
  String? createdAt;
  String? updatedAt;

  StoriesModel(
      {this.id,
      this.title,
      this.order,
      this.successValue,
      this.video,
      this.categoryId,
      this.category,
      this.createdAt,
      this.updatedAt});

  StoriesModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    order = json['order'];
    successValue = json['successValue'];
    video = json['video'];
    categoryId = json['categoryId'];
    category = json['category'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['order'] = this.order;
    data['successValue'] = this.successValue;
    data['video'] = this.video;
    data['categoryId'] = this.categoryId;
    data['category'] = this.category;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    return data;
  }
}

