class UserModel {
  UserModel({
      this.token, 
      this.customer,});

  UserModel.fromJson(dynamic json) {
    token = json['token'];
    customer = json['customer'] != null ? Customer.fromJson(json['customer']) : null;
  }
  String? token;
  Customer? customer;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['token'] = token;
    if (customer != null) {
      map['customer'] = customer?.toJson();
    }
    return map;
  }

}

class Customer {
  Customer({
      this.customerType, 
      this.name, 
      this.email, 
      this.phone, 
      this.phoneCountryCode, 
      this.nationalId, 
      this.licenseId,});

  Customer.fromJson(dynamic json) {
    customerType = json['customer_type'] != null ? CustomerType.fromJson(json['customer_type']) : null;
    name = json['name'];
    email = json['email'];
    phone = json['phone'];
    phoneCountryCode = json['phone_country_code'];
    nationalId = json['national_id'];
    licenseId = json['license_id'];
  }
  CustomerType? customerType;
  String? name;
  String? email;
  String? phone;
  String? phoneCountryCode;
  String? nationalId;
  dynamic licenseId;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (customerType != null) {
      map['customer_type'] = customerType?.toJson();
    }
    map['name'] = name;
    map['email'] = email;
    map['phone'] = phone;
    map['phone_country_code'] = phoneCountryCode;
    map['national_id'] = nationalId;
    map['license_id'] = licenseId;
    return map;
  }

}

class CustomerType {
  CustomerType({
      this.id, 
      this.name, 
      this.image,});

  CustomerType.fromJson(dynamic json) {
    id = json['id'];
    name = json['name'];
    image = json['image'];
  }
  num? id;
  String? name;
  String? image;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['name'] = name;
    map['image'] = image;
    return map;
  }

}