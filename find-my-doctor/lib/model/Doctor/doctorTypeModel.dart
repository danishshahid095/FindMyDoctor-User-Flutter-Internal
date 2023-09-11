import 'package:json_annotation/json_annotation.dart';

part 'doctorTypeModel.g.dart';

@JsonSerializable()
class DoctorTypeModel {
  DoctorTypeModel();

  int? id;
  String? image;
  String? title;
  String? description;
  int? consultationType;

  factory DoctorTypeModel.fromJson(Map<String, dynamic> json) =>
      _$DoctorTypeModelFromJson(json);

  Map<String, dynamic> toJson() => _$DoctorTypeModelToJson(this);

  @override
  String toString() {
    return 'DoctorTypeModel{id: $id, image: $image, title: $title, description: $description, consultationType: $consultationType}';
  }
}

@JsonSerializable()
class DoctorTypeCompleteModel {
  int? success;
  List<DoctorTypeModel>? data;

  DoctorTypeCompleteModel({
    this.success,
    this.data,
  });

  factory DoctorTypeCompleteModel.fromJson(Map<String, dynamic> json) =>
      _$DoctorTypeCompleteModelFromJson(json);

  Map<String, dynamic> toJson() => _$DoctorTypeCompleteModelToJson(this);

  @override
  String toString() {
    return 'DoctorTypeCompleteModel{success: $success, data: $data}';
  }
}
