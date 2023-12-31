class CoordinatesModel {
  double? lat;
  double? lng;

  CoordinatesModel({this.lat, this.lng});

  CoordinatesModel.fromJson(Map<String, dynamic> json) {
    lat = json['lat'];
    lng = json['lng'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['lat'] = lat;
    data['lng'] = lng;
    return data;
  }
}