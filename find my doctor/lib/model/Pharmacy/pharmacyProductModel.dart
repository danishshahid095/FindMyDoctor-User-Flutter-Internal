import 'package:json_annotation/json_annotation.dart';

part 'pharmacyProductModel.g.dart';

@JsonSerializable()
class PharmacyProductModel {
  PharmacyProductModel();

  int? id;
  String? name;
  String? title;
  String? featuredImg;
  String? brandName;
  String? catName;
  double? price;
  double? discountedPrice;
  String? description;
  int? quantity;
  String? weight;
  String? manufactureDate;
  String? expiryDate;
  String? tags;
  String? batchNumber;
  String? packageDelivery;
  String? suggestUse;
  String? ingredients;
  String? warning;
  String? dosage;
  int? activity;
  double? rating;

  factory PharmacyProductModel.fromJson(Map<String, dynamic> json) =>
      _$PharmacyProductModelFromJson(json);

  Map<String, dynamic> toJson() => _$PharmacyProductModelToJson(this);

  // @override
  // String toString() {
  //   return 'PharmacyProductModel{id: $id, name: $name, image: $image, description: $description}';
  // }
}

@JsonSerializable()
class PharmacyProductCompleteModel {
  int? success;
  List<PharmacyProductModel>? data;

  PharmacyProductCompleteModel({
    this.success,
    this.data,
  });

  factory PharmacyProductCompleteModel.fromJson(Map<String, dynamic> json) =>
      _$PharmacyProductCompleteModelFromJson(json);

  Map<String, dynamic> toJson() => _$PharmacyProductCompleteModelToJson(this);

  @override
  String toString() {
    return 'PharmacyProductCompleteModel{success: $success, data: $data}';
  }
}
