import 'package:json_annotation/json_annotation.dart';

part 'pharmacyCategoryModel.g.dart';

@JsonSerializable()
class PharmacyCategoryModel {
  PharmacyCategoryModel();

  int? id;
  String? name;
  String? image;
  String? description;

  factory PharmacyCategoryModel.fromJson(Map<String, dynamic> json) =>
      _$PharmacyCategoryModelFromJson(json);

  Map<String, dynamic> toJson() => _$PharmacyCategoryModelToJson(this);

  @override
  String toString() {
    return 'PharmacyCategoryModel{id: $id, name: $name, image: $image, description: $description}';
  }
}

@JsonSerializable()
class PharmacyCategoryCompleteModel {
  int? success;
  List<PharmacyCategoryModel>? data;

  PharmacyCategoryCompleteModel({
    this.success,
    this.data,
  });

  factory PharmacyCategoryCompleteModel.fromJson(Map<String, dynamic> json) =>
      _$PharmacyCategoryCompleteModelFromJson(json);

  Map<String, dynamic> toJson() => _$PharmacyCategoryCompleteModelToJson(this);

  @override
  String toString() {
    return 'PharmacyCategoryCompleteModel{success: $success, data: $data}';
  }
}
