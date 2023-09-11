// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pharmacyBrandsModel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PharmacyBrandsModel _$PharmacyBrandsModelFromJson(Map<String, dynamic> json) =>
    PharmacyBrandsModel()
      ..id = json['id'] as int?
      ..name = json['name'] as String?
      ..logo = json['logo'] as String?
      ..description = json['description'] as String?;

Map<String, dynamic> _$PharmacyBrandsModelToJson(
        PharmacyBrandsModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'logo': instance.logo,
      'description': instance.description,
    };

PharmacyBrandsCompleteModel _$PharmacyBrandsCompleteModelFromJson(
        Map<String, dynamic> json) =>
    PharmacyBrandsCompleteModel(
      success: json['success'] as int?,
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => PharmacyBrandsModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$PharmacyBrandsCompleteModelToJson(
        PharmacyBrandsCompleteModel instance) =>
    <String, dynamic>{
      'success': instance.success,
      'data': instance.data,
    };
