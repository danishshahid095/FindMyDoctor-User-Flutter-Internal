import 'package:json_annotation/json_annotation.dart';
part 'pharmacyFrequwntlyModel.g.dart';

@JsonSerializable()
class PharmacyFrequentlyModel {
  PharmacyFrequentlyModel();
  int? id;
  String? name;
  String? title;
  String? featured_img;
  String? brandName;
  String? catName;
  double? price;
  double? discounted_price;
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
  int? isFeatured;
  int? totalCount;

  factory PharmacyFrequentlyModel.fromJson(Map<String, dynamic> json) =>
      _$PharmacyFrequentlyModelFromJson(json);

  Map<String, dynamic> toJson() => _$PharmacyFrequentlyModelToJson(this);

  // @override
  // String toString() {
  //   return 'PharmacyProductModel{id: $id, name: $name, image: $image, description: $description}';
  // }
}

@JsonSerializable()
class PharmacyFrequentlyModelCompleteModel {
  int? success;
  List<PharmacyFrequentlyModel>? data;

  PharmacyFrequentlyModelCompleteModel({
    this.success,
    this.data,
  });

  factory PharmacyFrequentlyModelCompleteModel.fromJson(Map<String, dynamic> json) =>
      _$PharmacyFrequentlyModelCompleteModelFromJson(json);

  Map<String, dynamic> toJson() => _$PharmacyFrequentlyModelCompleteModelToJson(this);

  @override
  String toString() {
    return 'PharmacyFrequentlyModelCompleteModel{success: $success, data: $data}';
  }
}
