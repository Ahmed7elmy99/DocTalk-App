class CustomerTypeModel {
  CustomerTypeModel({
    this.id,
    this.name,
    this.image,
  });

  CustomerTypeModel.fromJson(dynamic json) {
    id = json['id'];
    name = json['name'];
    image = json['image'];
  }
  num? id;
  String? name;
  String? image;
}
