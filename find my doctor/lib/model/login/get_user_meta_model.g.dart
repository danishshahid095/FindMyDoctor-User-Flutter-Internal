// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_user_meta_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetUserMeta _$GetUserMetaFromJson(Map<String, dynamic> json) => GetUserMeta()
  ..meta_key = json['meta_key'] as String?
  ..meta_value = json['meta_value'] as String?;

Map<String, dynamic> _$GetUserMetaToJson(GetUserMeta instance) =>
    <String, dynamic>{
      'meta_key': instance.meta_key,
      'meta_value': instance.meta_value,
    };

GetUserMetaCompleteModel _$GetUserMetaCompleteModelFromJson(
        Map<String, dynamic> json) =>
    GetUserMetaCompleteModel(
      success: json['success'] as int?,
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => GetUserMeta.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$GetUserMetaCompleteModelToJson(
        GetUserMetaCompleteModel instance) =>
    <String, dynamic>{
      'success': instance.success,
      'data': instance.data,
    };
