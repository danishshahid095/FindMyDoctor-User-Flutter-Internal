//import 'package:json_annotation/json_annotation.dart';

//part 'userLoginModel.g.dart';
//
// @JsonSerializable()
// class UserLoginModel {
//   int success;
//   String message;
//   String token;
//   UserData data;
//
//   UserLoginModel({
//     required this.success,
//     required this.message,
//     required this.token,
//     required this.data,
//   });
//
//   factory UserLoginModel.fromJson(Map<String, dynamic> json) =>
//       _$UserLoginModelFromJson(json);
//
//   Map<String, dynamic> toJson() => _$UserLoginModelToJson(this);
// }
//
// @JsonSerializable()
// class UserData {
//   int id;
//   String fullName;
//   String email;
//   String phone;
//   int type;
//   int status;
//   int isVerified;
//   int isDeleted;
//   String addedAt;
//   String updatedAt;
//
//   UserData({
//     required this.id,
//     required this.fullName,
//     required this.email,
//     required this.phone,
//     required this.type,
//     required this.status,
//     required this.isVerified,
//     required this.isDeleted,
//     required this.addedAt,
//     required this.updatedAt,
//   });
//
//   factory UserData.fromJson(Map<String, dynamic> json) =>
//       _$UserDataFromJson(json);
//
//   Map<String, dynamic> toJson() => _$UserDataToJson(this);
// }


class UserLoginModel {
  int? success;
  String? message;
  String? token;
  Data? data;

  UserLoginModel({this.success, this.message, this.token, this.data});

  UserLoginModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    message = json['message'];
    token = json['token'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    data['message'] = this.message;
    data['token'] = this.token;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  int? id;
  String? fullname;
  String? email;
  String? phone;
  int? type;
  int? status;
  int? isverified;
  int? isdeleted;
  String? addedat;
  String? updatedat;

  Data(
      {this.id,
        this.fullname,
        this.email,
        this.phone,
        this.type,
        this.status,
        this.isverified,
        this.isdeleted,
        this.addedat,
        this.updatedat});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    fullname = json['fullname'];
    email = json['email'];
    phone = json['phone'];
    type = json['type'];
    status = json['status'];
    isverified = json['isverified'];
    isdeleted = json['isdeleted'];
    addedat = json['addedat'];
    updatedat = json['updatedat'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['fullname'] = this.fullname;
    data['email'] = this.email;
    data['phone'] = this.phone;
    data['type'] = this.type;
    data['status'] = this.status;
    data['isverified'] = this.isverified;
    data['isdeleted'] = this.isdeleted;
    data['addedat'] = this.addedat;
    data['updatedat'] = this.updatedat;
    return data;
  }
}