// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'testsModel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TestsModel _$TestsModelFromJson(Map<String, dynamic> json) => TestsModel()
  ..test_amount = (json['test_amount'] as num?)?.toDouble()
  ..test_time = json['test_time'] as String?
  ..test_name = json['test_name'] as String?
  ..test_id = json['test_id'] as int?
  ..lab_name = json['lab_name'] as String?
  ..lab_logo = json['lab_logo'] as String?;

Map<String, dynamic> _$TestsModelToJson(TestsModel instance) =>
    <String, dynamic>{
      'test_amount': instance.test_amount,
      'test_time': instance.test_time,
      'test_name': instance.test_name,
      'test_id': instance.test_id,
      'lab_name': instance.lab_name,
      'lab_logo': instance.lab_logo,
    };

TestsCompleteModel _$TestsCompleteModelFromJson(Map<String, dynamic> json) =>
    TestsCompleteModel(
      success: json['success'] as int?,
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => TestsModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$TestsCompleteModelToJson(TestsCompleteModel instance) =>
    <String, dynamic>{
      'success': instance.success,
      'data': instance.data,
    };
