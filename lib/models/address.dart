/// Here is an example of [Address] model, you can add or remove variables that you want
/// this model has fromJson that converts a json item of address to address object
/// and if you want to export the object the a Json you can use toJson
class Address {
  int? id;
  String? title;
  double? geoLat;
  double? geoLong;
  String? fullAddress;

  Address.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'] ?? '';
    geoLat = json['geoLat'] ?? 0.0;
    geoLong = json['geoLong'] ?? 0.0;
    fullAddress = json['fullAddress'] ?? '';
  }

  Map<String, dynamic> toJson() {
    var data = <String, dynamic>{};
    data['id'] = id;
    data['title'] = title;
    data['geoLat'] = geoLat;
    data['geoLong'] = geoLong;
    data['fullAddress'] = fullAddress;
    return data;
  }

  @override
  bool operator ==(other) {
    return (other is Address) &&
        other.id == id &&
        other.title == title &&
        other.geoLat == geoLat &&
        other.geoLong == geoLong &&
        other.fullAddress == fullAddress;
  }

  @override
  int get hashCode =>
      id.hashCode ^
      title.hashCode ^
      geoLat.hashCode ^
      geoLong.hashCode ^
      fullAddress.hashCode;
}
