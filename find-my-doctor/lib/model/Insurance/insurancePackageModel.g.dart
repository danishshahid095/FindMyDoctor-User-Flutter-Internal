// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'insurancePackageModel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Feature _$FeatureFromJson(Map<String, dynamic> json) => Feature(
      featureKey: json['featureKey'] as String?,
      featureValue: json['featureValue'],
    );

Map<String, dynamic> _$FeatureToJson(Feature instance) => <String, dynamic>{
      'featureKey': instance.featureKey,
      'featureValue': instance.featureValue,
    };

InsurancePackageModel _$InsurancePackageModelFromJson(
        Map<String, dynamic> json) =>
    InsurancePackageModel(
      id: json['id'] as int?,
      name: json['name'] as String?,
      annual_cost: json['annual_cost'] as int?,
      features: json['features'] as String?,
      for_parents: json['for_parents'] as int?,
    );

Map<String, dynamic> _$InsurancePackageModelToJson(
        InsurancePackageModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'annual_cost': instance.annual_cost,
      'features': instance.features,
      'for_parents': instance.for_parents,
    };

InsurancePackagesCompleteModel _$InsurancePackagesCompleteModelFromJson(
        Map<String, dynamic> json) =>
    InsurancePackagesCompleteModel(
      success: json['success'] as int?,
      data: (json['data'] as List<dynamic>?)
          ?.map(
              (e) => InsurancePackageModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$InsurancePackagesCompleteModelToJson(
        InsurancePackagesCompleteModel instance) =>
    <String, dynamic>{
      'success': instance.success,
      'data': instance.data,
    };
