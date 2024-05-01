class UserModel {
  UserModel({
    this.patient,
    this.token,
  });

  UserModel.fromJson(dynamic json) {
    patient =
        json['patient'] != null ? Patient.fromJson(json['patient']) : null;
    token = json['token'];
  }
  Patient? patient;
  String? token;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (patient != null) {
      map['patient'] = patient?.toJson();
    }
    map['token'] = token;
    return map;
  }
}

class Patient {
  Patient({
    this.id,
    this.name,
    this.age,
    this.phone,
    this.image,
    this.surveyResult,
    this.diagnoses,
    this.userId,
    this.doctorId,
  });

  Patient.fromJson(dynamic json) {
    id = json['id'];
    name = json['name'];
    age = json['age'];
    phone = json['phone'];
    image = json['image'];
    surveyResult = json['surveyResult'];
    diagnoses = json['diagnoses'];
    userId = json['userId'];
    doctorId = json['doctorId'];
  }
  num? id;
  String? name;
  num? age;
  String? phone;
  String? image;
  dynamic surveyResult;
  dynamic diagnoses;
  num? userId;
  dynamic doctorId;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['name'] = name;
    map['age'] = age;
    map['phone'] = phone;
    map['image'] = image;
    map['surveyResult'] = surveyResult;
    map['diagnoses'] = diagnoses;
    map['userId'] = userId;
    map['doctorId'] = doctorId;
    return map;
  }
}
