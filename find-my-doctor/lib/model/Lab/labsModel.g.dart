// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'labsModel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LabsModel _$LabsModelFromJson(Map<String, dynamic> json) => LabsModel()
  ..id = json['id'] as int?
  ..fullname = json['fullname'] as String?
  ..email = json['email'] as String?
  ..phone = json['phone'] as String?
  ..lab_id = json['lab_id'] as int?
  ..type = json['type'] as int?
  ..name = json['name'] as String?
  ..logo = json['logo'] as String?
  ..lab_address = json['lab_address'] as String?
  ..city = json['city'] as int?;

Map<String, dynamic> _$LabsModelToJson(LabsModel instance) => <String, dynamic>{
      'id': instance.id,
      'fullname': instance.fullname,
      'email': instance.email,
      'phone': instance.phone,
      'lab_id': instance.lab_id,
      'type': instance.type,
      'name': instance.name,
      'logo': instance.logo,
      'lab_address': instance.lab_address,
      'city': instance.city,
    };

LabsCompleteModel _$LabsCompleteModelFromJson(Map<String, dynamic> json) =>
    LabsCompleteModel(
      success: json['success'] as int?,
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => LabsModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$LabsCompleteModelToJson(LabsCompleteModel instance) =>
    <String, dynamic>{
      'success': instance.success,
      'data': instance.data,
    };
