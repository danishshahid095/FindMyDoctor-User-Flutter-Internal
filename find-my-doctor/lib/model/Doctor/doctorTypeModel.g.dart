// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'doctorTypeModel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DoctorTypeModel _$DoctorTypeModelFromJson(Map<String, dynamic> json) =>
    DoctorTypeModel()
      ..id = json['id'] as int?
      ..image = json['image'] as String?
      ..title = json['title'] as String?
      ..description = json['description'] as String?
      ..consultationType = json['consultationType'] as int?;

Map<String, dynamic> _$DoctorTypeModelToJson(DoctorTypeModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'image': instance.image,
      'title': instance.title,
      'description': instance.description,
      'consultationType': instance.consultationType,
    };

DoctorTypeCompleteModel _$DoctorTypeCompleteModelFromJson(
        Map<String, dynamic> json) =>
    DoctorTypeCompleteModel(
      success: json['success'] as int?,
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => DoctorTypeModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$DoctorTypeCompleteModelToJson(
        DoctorTypeCompleteModel instance) =>
    <String, dynamic>{
      'success': instance.success,
      'data': instance.data,
    };
