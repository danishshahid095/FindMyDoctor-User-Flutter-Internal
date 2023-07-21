// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pharmacyCategoryModel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PharmacyCategoryModel _$PharmacyCategoryModelFromJson(
        Map<String, dynamic> json) =>
    PharmacyCategoryModel()
      ..id = json['id'] as int?
      ..name = json['name'] as String?
      ..image = json['image'] as String?
      ..description = json['description'] as String?;

Map<String, dynamic> _$PharmacyCategoryModelToJson(
        PharmacyCategoryModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'image': instance.image,
      'description': instance.description,
    };

PharmacyCategoryCompleteModel _$PharmacyCategoryCompleteModelFromJson(
        Map<String, dynamic> json) =>
    PharmacyCategoryCompleteModel(
      success: json['success'] as int?,
      data: (json['data'] as List<dynamic>?)
          ?.map(
              (e) => PharmacyCategoryModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$PharmacyCategoryCompleteModelToJson(
        PharmacyCategoryCompleteModel instance) =>
    <String, dynamic>{
      'success': instance.success,
      'data': instance.data,
    };
