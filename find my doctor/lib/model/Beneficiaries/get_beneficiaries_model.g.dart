// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_beneficiaries_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetBencfyModel _$GetBencfyModelFromJson(Map<String, dynamic> json) =>
    GetBencfyModel()
      ..id = json['id'] as int?
      ..fullname = json['fullname'] as String?
      ..relation = json['relation'] as String?
      ..nick = json['nick'] as String?
      ..gender = json['gender'] as String?
      ..dob = json['dob'] as String?
      ..phone = json['phone'] as String?
      ..city = json['city'] as String?
      ..address = (json['address'] as num?)?.toDouble()
      ..policyno = json['policyno'] as String?
      ..cnic = json['cnic'] as String?;

Map<String, dynamic> _$GetBencfyModelToJson(GetBencfyModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'fullname': instance.fullname,
      'relation': instance.relation,
      'nick': instance.nick,
      'gender': instance.gender,
      'dob': instance.dob,
      'phone': instance.phone,
      'city': instance.city,
      'address': instance.address,
      'policyno': instance.policyno,
      'cnic': instance.cnic,
    };

GetBencfyCompleteModel _$GetBencfyCompleteModelFromJson(
        Map<String, dynamic> json) =>
    GetBencfyCompleteModel(
      success: json['success'] as int?,
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => GetBencfyModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$GetBencfyCompleteModelToJson(
        GetBencfyCompleteModel instance) =>
    <String, dynamic>{
      'success': instance.success,
      'data': instance.data,
    };
