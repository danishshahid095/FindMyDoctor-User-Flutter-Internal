// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pharmacyFrequwntlyModel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PharmacyFrequentlyModel _$PharmacyFrequentlyModelFromJson(
        Map<String, dynamic> json) =>
    PharmacyFrequentlyModel()
      ..id = json['id'] as int?
      ..name = json['name'] as String?
      ..title = json['title'] as String?
      ..featured_img = json['featured_img'] as String?
      ..brandName = json['brandName'] as String?
      ..catName = json['catName'] as String?
      ..price = (json['price'] as num?)?.toDouble()
      ..discounted_price = (json['discounted_price'] as num?)?.toDouble()
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
      ..rating = (json['rating'] as num?)?.toDouble()
      ..isFeatured = json['isFeatured'] as int?
      ..totalCount = json['totalCount'] as int?;

Map<String, dynamic> _$PharmacyFrequentlyModelToJson(
        PharmacyFrequentlyModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'title': instance.title,
      'featured_img': instance.featured_img,
      'brandName': instance.brandName,
      'catName': instance.catName,
      'price': instance.price,
      'discounted_price': instance.discounted_price,
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
      'isFeatured': instance.isFeatured,
      'totalCount': instance.totalCount,
    };

PharmacyFrequentlyModelCompleteModel
    _$PharmacyFrequentlyModelCompleteModelFromJson(Map<String, dynamic> json) =>
        PharmacyFrequentlyModelCompleteModel(
          success: json['success'] as int?,
          data: (json['data'] as List<dynamic>?)
              ?.map((e) =>
                  PharmacyFrequentlyModel.fromJson(e as Map<String, dynamic>))
              .toList(),
        );

Map<String, dynamic> _$PharmacyFrequentlyModelCompleteModelToJson(
        PharmacyFrequentlyModelCompleteModel instance) =>
    <String, dynamic>{
      'success': instance.success,
      'data': instance.data,
    };
