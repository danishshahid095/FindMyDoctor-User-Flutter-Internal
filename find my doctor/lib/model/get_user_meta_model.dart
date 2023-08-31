class UserDetailsModel {
  int? success;
  List<Data>? data;

  UserDetailsModel({this.success, this.data});

  UserDetailsModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(new Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  String? metaKey;
  String? metaValue;

  Data({this.metaKey, this.metaValue});

  Data.fromJson(Map<String, dynamic> json) {
    metaKey = json['meta_key'];
    metaValue = json['meta_value'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['meta_key'] = this.metaKey;
    data['meta_value'] = this.metaValue;
    return data;
  }
}