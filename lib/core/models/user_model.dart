import 'address_model.dart';
import 'bank_model.dart';
import 'company_model.dart';

class UserModel {
  int? id;
  String? firstName;
  String? lastName;
  String? maidenName;
  int? age;
  String? gender;
  String? email;
  String? phone;
  String? username;
  String? password;
  String? birthDate;
  String? image;
  String? bloodGroup;
  int? height;
  double? weight;
  String? eyeColor;
  HairModel? hair;
  String? domain;
  String? ip;
  AddressModel? address;
  String? macAddress;
  String? university;
  BankModel? bank;
  CompanyModel? company;
  String? ein;
  String? ssn;
  String? userAgent;

  UserModel(
      {this.id,
        this.firstName,
        this.lastName,
        this.maidenName,
        this.age,
        this.gender,
        this.email,
        this.phone,
        this.username,
        this.password,
        this.birthDate,
        this.image,
        this.bloodGroup,
        this.height,
        this.weight,
        this.eyeColor,
        this.hair,
        this.domain,
        this.ip,
        this.address,
        this.macAddress,
        this.university,
        this.bank,
        this.company,
        this.ein,
        this.ssn,
        this.userAgent});

  UserModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    firstName = json['firstName'];
    lastName = json['lastName'];
    maidenName = json['maidenName'];
    age = json['age'];
    gender = json['gender'];
    email = json['email'];
    phone = json['phone'];
    username = json['username'];
    password = json['password'];
    birthDate = json['birthDate'];
    image = json['image'];
    bloodGroup = json['bloodGroup'];
    height = json['height'];
    weight = json['weight'];
    eyeColor = json['eyeColor'];
    hair = json['hair'] != null ?   HairModel.fromJson(json['hair']) : null;
    domain = json['domain'];
    ip = json['ip'];
    address =
    json['address'] != null ?   AddressModel.fromJson(json['address']) : null;
    macAddress = json['macAddress'];
    university = json['university'];
    bank = json['bank'] != null ?   BankModel.fromJson(json['bank']) : null;
    company =
    json['company'] != null ?   CompanyModel.fromJson(json['company']) : null;
    ein = json['ein'];
    ssn = json['ssn'];
    userAgent = json['userAgent'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['id'] = id;
    data['firstName'] = firstName;
    data['lastName'] = lastName;
    data['maidenName'] = maidenName;
    data['age'] = age;
    data['gender'] = gender;
    data['email'] = email;
    data['phone'] = phone;
    data['username'] = username;
    data['password'] = password;
    data['birthDate'] = birthDate;
    data['image'] = image;
    data['bloodGroup'] = bloodGroup;
    data['height'] = height;
    data['weight'] = weight;
    data['eyeColor'] = eyeColor;
    if (hair != null) {
      data['hair'] = hair!.toJson();
    }
    data['domain'] = domain;
    data['ip'] = ip;
    if (address != null) {
      data['address'] = address!.toJson();
    }
    data['macAddress'] = macAddress;
    data['university'] = university;
    if (bank != null) {
      data['bank'] = bank!.toJson();
    }
    if (company != null) {
      data['company'] = company!.toJson();
    }
    data['ein'] = ein;
    data['ssn'] = ssn;
    data['userAgent'] = userAgent;
    return data;
  }

  String getFullName(){
    return "$firstName $lastName";
  }
}

class HairModel {
  String? color;
  String? type;

  HairModel({this.color, this.type});

  HairModel.fromJson(Map<String, dynamic> json) {
    color = json['color'];
    type = json['type'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['color'] = color;
    data['type'] = type;
    return data;
  }
}