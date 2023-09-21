// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pharmacyProductModel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PharmacyProductModel _$PharmacyProductModelFromJson(
        Map<String, dynamic> json) =>
    PharmacyProductModel()
      ..id = json['id'] as int?
      ..name = json['name'] as String?
      ..title = json['title'] as String?
      ..featured_img = json['featured_img'] as String?
      ..brandName = json['brandName'] as String?
      ..catName = json['catName'] as String?
      ..price = (json['price'] as num?)?.toDouble()
      ..discountedPrice = (json['discountedPrice'] as num?)?.toDouble()
      ..description = json['description'] as String?
      ..quantity = json['quantity'] as int?
      ..weight = json['weight'] as String?
      ..manufactureDate = json['manufactureDate'] as String?
      ..expiryDate = json['expiryDate'] as String?
      ..tags = json['tags'] as String?
      ..batchNumber = json['batchNumber'] as String?
      ..packageDelivery = json['packageDelivery'] as String?
      ..suggestUse = json['suggestUse'] as String?
      ..ingredients = json['ingredients'] as String?
      ..warning = json['warning'] as String?
      ..dosage = json['dosage'] as String?
      ..activity = json['activity'] as int?
      ..rating = (json['rating'] as num?)?.toDouble();

Map<String, dynamic> _$PharmacyProductModelToJson(
        PharmacyProductModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'title': instance.title,
      'featured_img': instance.featured_img,
      'brandName': instance.brandName,
      'catName': instance.catName,
      'price': instance.price,
      'discountedPrice': instance.discountedPrice,
      'description': instance.description,
      'quantity': instance.quantity,
      'weight': instance.weight,
      'manufactureDate': instance.manufactureDate,
      'expiryDate': instance.expiryDate,
      'tags': instance.tags,
      'batchNumber': instance.batchNumber,
      'packageDelivery': instance.packageDelivery,
      'suggestUse': instance.suggestUse,
      'ingredients': instance.ingredients,
      'warning': instance.warning,
      'dosage': instance.dosage,
      'activity': instance.activity,
      'rating': instance.rating,
    };

PharmacyProductCompleteModel _$PharmacyProductCompleteModelFromJson(
        Map<String, dynamic> json) =>
    PharmacyProductCompleteModel(
      success: json['success'] as int?,
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => PharmacyProductModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$PharmacyProductCompleteModelToJson(
        PharmacyProductCompleteModel instance) =>
    <String, dynamic>{
      'success': instance.success,
      'data': instance.data,
    };
