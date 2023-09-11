import 'package:json_annotation/json_annotation.dart';

part 'specialistCategoryModel.g.dart';

@JsonSerializable()
class SpecialistCategoryModel {
  SpecialistCategoryModel();

  int? id;
  String? image;
  String? title;
  String? description;
  int? consultationType;

  factory SpecialistCategoryModel.fromJson(Map<String, dynamic> json) =>
      _$SpecialistCategoryModelFromJson(json);

  Map<String, dynamic> toJson() => _$SpecialistCategoryModelToJson(this);

  @override
  String toString() {
    return 'SpecialistCategoryModel{id: $id, image: $image, title: $title, description: $description, consultationType: $consultationType}';
  }
}

@JsonSerializable()
class SpecialistCategoryCompleteModel {
  int? success;
  List<SpecialistCategoryModel>? data;

  SpecialistCategoryCompleteModel({
    this.success,
    this.data,
  });

  factory SpecialistCategoryCompleteModel.fromJson(
      Map<String, dynamic> json) =>
      _$SpecialistCategoryCompleteModelFromJson(json);

  Map<String, dynamic> toJson() =>
      _$SpecialistCategoryCompleteModelToJson(this);

  @override
  String toString() {
    return 'SpecialistCategoryCompleteModel{success: $success, data: $data}';
  }
}
