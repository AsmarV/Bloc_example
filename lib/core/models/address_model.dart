import 'coordinates_model.dart';

class AddressModel {
  String? address;
  String? city;
  CoordinatesModel? coordinates;
  String? postalCode;
  String? state;

  AddressModel(
      {this.address, this.city, this.coordinates, this.postalCode, this.state});

  AddressModel.fromJson(Map<String, dynamic> json) {
    address = json['address'];
    city = json['city'];
    coordinates = json['coordinates'] != null
        ?  CoordinatesModel.fromJson(json['coordinates'])
        : null;
    postalCode = json['postalCode'];
    state = json['state'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['address'] = address;
    data['city'] = city;
    if (coordinates != null) {
      data['coordinates'] = coordinates!.toJson();
    }
    data['postalCode'] = postalCode;
    data['state'] = state;
    return data;
  }
}


