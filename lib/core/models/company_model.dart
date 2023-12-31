import 'address_model.dart';

class CompanyModel {
  AddressModel? address;
  String? department;
  String? name;
  String? title;

  CompanyModel({this.address, this.department, this.name, this.title});

  CompanyModel.fromJson(Map<String, dynamic> json) {
    address =
    json['address'] != null ?  AddressModel.fromJson(json['address']) : null;
    department = json['department'];
    name = json['name'];
    title = json['title'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    if (address != null) {
      data['address'] = address!.toJson();
    }
    data['department'] = department;
    data['name'] = name;
    data['title'] = title;
    return data;
  }
}