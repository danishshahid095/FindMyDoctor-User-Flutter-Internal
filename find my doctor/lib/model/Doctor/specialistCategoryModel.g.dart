// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'specialistCategoryModel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SpecialistCategoryModel _$SpecialistCategoryModelFromJson(
        Map<String, dynamic> json) =>
    SpecialistCategoryModel()
      ..id = json['id'] as int?
      ..image = json['image'] as String?
      ..title = json['title'] as String?
      ..description = json['description'] as String?
      ..consultationType = json['consultationType'] as int?;

Map<String, dynamic> _$SpecialistCategoryModelToJson(
        SpecialistCategoryModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'image': instance.image,
      'title': instance.title,
      'description': instance.description,
      'consultationType': instance.consultationType,
    };

SpecialistCategoryCompleteModel _$SpecialistCategoryCompleteModelFromJson(
        Map<String, dynamic> json) =>
    SpecialistCategoryCompleteModel(
      success: json['success'] as int?,
      data: (json['data'] as List<dynamic>?)
          ?.map((e) =>
              SpecialistCategoryModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$SpecialistCategoryCompleteModelToJson(
        SpecialistCategoryCompleteModel instance) =>
    <String, dynamic>{
      'success': instance.success,
      'data': instance.data,
    };
