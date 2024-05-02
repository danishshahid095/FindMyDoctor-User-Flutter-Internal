// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'insuranceProviderModel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

InsuranceProviderModel _$InsuranceProviderModelFromJson(
        Map<String, dynamic> json) =>
    InsuranceProviderModel(
      id: json['id'] as int?,
      fullname: json['fullname'] as String?,
      email: json['email'] as String?,
      phone: json['phone'] as String?,
      type: json['type'] as int?,
      name: json['name'] as String?,
      logo: json['logo'] as String?,
      website: json['website'] as String?,
      headofficeAddress: json['headofficeAddress'] as String?,
      contactPersonNumber: json['contactPersonNumber'] as String?,
    );

Map<String, dynamic> _$InsuranceProviderModelToJson(
        InsuranceProviderModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'fullname': instance.fullname,
      'email': instance.email,
      'phone': instance.phone,
      'type': instance.type,
      'name': instance.name,
      'logo': instance.logo,
      'website': instance.website,
      'headofficeAddress': instance.headofficeAddress,
      'contactPersonNumber': instance.contactPersonNumber,
    };

InsuranceProvidersCompleteModel _$InsuranceProvidersCompleteModelFromJson(
        Map<String, dynamic> json) =>
    InsuranceProvidersCompleteModel(
      success: json['success'] as int?,
      data: (json['data'] as List<dynamic>?)
          ?.map(
              (e) => InsuranceProviderModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$InsuranceProvidersCompleteModelToJson(
        InsuranceProvidersCompleteModel instance) =>
    <String, dynamic>{
      'success': instance.success,
      'data': instance.data,
    };
