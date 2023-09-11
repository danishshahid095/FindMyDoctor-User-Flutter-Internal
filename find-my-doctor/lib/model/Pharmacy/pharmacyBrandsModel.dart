import 'package:json_annotation/json_annotation.dart';

part 'pharmacyBrandsModel.g.dart';

@JsonSerializable()
class PharmacyBrandsModel {
  PharmacyBrandsModel();

  int? id;
  String? name;
  String? logo;
  String? description;

  factory PharmacyBrandsModel.fromJson(Map<String, dynamic> json) =>
      _$PharmacyBrandsModelFromJson(json);

  Map<String, dynamic> toJson() => _$PharmacyBrandsModelToJson(this);

  @override
  String toString() {
    return 'PharmacyBrandsModel{id: $id, name: $name, logo: $logo, description: $description}';
  }
}

@JsonSerializable()
class PharmacyBrandsCompleteModel {
  int? success;
  List<PharmacyBrandsModel>? data;

  PharmacyBrandsCompleteModel({
    this.success,
    this.data,
  });

  factory PharmacyBrandsCompleteModel.fromJson(Map<String, dynamic> json) =>
      _$PharmacyBrandsCompleteModelFromJson(json);

  Map<String, dynamic> toJson() => _$PharmacyBrandsCompleteModelToJson(this);

  @override
  String toString() {
    return 'PharmacyBrandsCompleteModel{success: $success, data: $data}';
  }
}
