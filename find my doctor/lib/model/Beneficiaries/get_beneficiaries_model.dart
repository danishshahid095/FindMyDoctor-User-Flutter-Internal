import 'package:json_annotation/json_annotation.dart';

part 'get_beneficiaries_model.g.dart';

@JsonSerializable()
class GetBencfyModel {
  GetBencfyModel();

  int? id;
  String? fullname;
  String? relation;
  String? nick;
  String? gender;
  String? dob;
  String? phone;
  String? city;
  double? address;
  String? policyno;
  String? cnic;

  factory GetBencfyModel.fromJson(Map<String, dynamic> json) =>
      _$GetBencfyModelFromJson(json);

  Map<String, dynamic> toJson() => _$GetBencfyModelToJson(this);

  @override
  String toString() {
    return 'GetBencfyModel{id: $id, fullname: $fullname, relation: $relation, nick: $nick, gender:$gender, dob: $dob, phone: $phone, city: $city,address:$address,policyno:$policyno,cnic:$cnic}';
  }
}

@JsonSerializable()
class GetBencfyCompleteModel {
  int? success;
  List<GetBencfyModel>? data;

  GetBencfyCompleteModel({
    this.success,
    this.data,
  });

  factory GetBencfyCompleteModel.fromJson(Map<String, dynamic> json) =>
      _$GetBencfyCompleteModelFromJson(json);

  Map<String, dynamic> toJson() => _$GetBencfyCompleteModelToJson(this);

  @override
  String toString() {
    return 'GetBencfyCompleteModel{success: $success, data: $data}';
  }
}
