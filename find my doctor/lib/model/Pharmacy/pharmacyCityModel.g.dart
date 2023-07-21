// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pharmacyCityModel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PharmacyCityModel _$PharmacyCityModelFromJson(Map<String, dynamic> json) =>
    PharmacyCityModel()
      ..id = json['id'] as int?
      ..name = json['name'] as String?;

Map<String, dynamic> _$PharmacyCityModelToJson(PharmacyCityModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
    };

PharmacyCityCompleteModel _$PharmacyCityCompleteModelFromJson(
        Map<String, dynamic> json) =>
    PharmacyCityCompleteModel(
      success: json['success'] as int?,
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => PharmacyCityModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$PharmacyCityCompleteModelToJson(
        PharmacyCityCompleteModel instance) =>
    <String, dynamic>{
      'success': instance.success,
      'data': instance.data,
    };
