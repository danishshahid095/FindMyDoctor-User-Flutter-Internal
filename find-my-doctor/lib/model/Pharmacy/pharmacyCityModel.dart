import 'package:json_annotation/json_annotation.dart';

part 'pharmacyCityModel.g.dart';

@JsonSerializable()
class PharmacyCityModel {
  PharmacyCityModel();

  int? id;
  String? name;

  factory PharmacyCityModel.fromJson(Map<String, dynamic> json) =>
      _$PharmacyCityModelFromJson(json);

  Map<String, dynamic> toJson() => _$PharmacyCityModelToJson(this);

  @override
  String toString() {
    return 'PharmacyCityModel{id: $id, name: $name}';
  }
}

@JsonSerializable()
class PharmacyCityCompleteModel {
  int? success;
  List<PharmacyCityModel>? data;

  PharmacyCityCompleteModel({
    this.success,
    this.data,
  });

  factory PharmacyCityCompleteModel.fromJson(Map<String, dynamic> json) =>
      _$PharmacyCityCompleteModelFromJson(json);

  Map<String, dynamic> toJson() => _$PharmacyCityCompleteModelToJson(this);

  @override
  String toString() {
    return 'PharmacyCityCompleteModel{success: $success, data: $data}';
  }
}
