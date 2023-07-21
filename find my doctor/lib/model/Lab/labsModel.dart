import 'package:json_annotation/json_annotation.dart';

part 'labsModel.g.dart';

@JsonSerializable()
class LabsModel {
  LabsModel();

  int? id;
  String? fullname;
  String? email;
  String? phone;
  int? lab_id;
  int? type;
  String? name;
  String? logo;
  String? lab_address;
  int? city;

  factory LabsModel.fromJson(Map<String, dynamic> json) =>
      _$LabsModelFromJson(json);

  Map<String, dynamic> toJson() => _$LabsModelToJson(this);

  @override
  String toString() {
    return 'LabsModel{id: $id, fullname: $fullname, email: $email, phone: $phone, lab_id: $lab_id, type: $type, name: $name, logo: $logo, lab_address: $lab_address, city: $city}';
  }
}

@JsonSerializable()
class LabsCompleteModel {
  int? success;
  List<LabsModel>? data;

  LabsCompleteModel({
    this.success,
    this.data,
  });

  factory LabsCompleteModel.fromJson(Map<String, dynamic> json) =>
      _$LabsCompleteModelFromJson(json);

  Map<String, dynamic> toJson() => _$LabsCompleteModelToJson(this);

  @override
  String toString() {
    return 'LabsCompleteModel{success: $success, data: $data}';
  }
}
