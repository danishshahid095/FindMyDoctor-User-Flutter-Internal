// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'labBookingDetailModel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LabTestModel _$LabTestModelFromJson(Map<String, dynamic> json) => LabTestModel()
  ..id = json['id'] as int?
  ..booking = json['booking'] as int?
  ..test_name = json['test_name'] as String?
  ..test_id = json['test_id'] as int?
  ..test_price = (json['test_price'] as num?)?.toDouble()
  ..lab_name = json['lab_name'] as String?
  ..lab_id = json['lab_id'] as int?
  ..test_report = json['test_report'];

Map<String, dynamic> _$LabTestModelToJson(LabTestModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'booking': instance.booking,
      'test_name': instance.test_name,
      'test_id': instance.test_id,
      'test_price': instance.test_price,
      'lab_name': instance.lab_name,
      'lab_id': instance.lab_id,
      'test_report': instance.test_report,
    };

LabBookingDetailModel _$LabBookingDetailModelFromJson(
        Map<String, dynamic> json) =>
    LabBookingDetailModel()
      ..id = json['id'] as int?
      ..amount = (json['amount'] as num?)?.toDouble()
      ..status = json['status'] as int?
      ..name = json['name'] as String?
      ..is_beneficiary = json['is_beneficiary'] as String?
      ..date_time = json['date_time'] == null
          ? null
          : DateTime.parse(json['date_time'] as String)
      ..b_status = json['b_status'] as String?
      ..tests = (json['tests'] as List<dynamic>?)
          ?.map((e) => LabTestModel.fromJson(e as Map<String, dynamic>))
          .toList();

Map<String, dynamic> _$LabBookingDetailModelToJson(
        LabBookingDetailModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'amount': instance.amount,
      'status': instance.status,
      'name': instance.name,
      'is_beneficiary': instance.is_beneficiary,
      'date_time': instance.date_time?.toIso8601String(),
      'b_status': instance.b_status,
      'tests': instance.tests,
    };

LabBookingDetailCompleteModel _$LabBookingDetailCompleteModelFromJson(
        Map<String, dynamic> json) =>
    LabBookingDetailCompleteModel(
      success: json['success'] as int?,
      data: json['data'] == null
          ? null
          : LabBookingDetailModel.fromJson(
              json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$LabBookingDetailCompleteModelToJson(
        LabBookingDetailCompleteModel instance) =>
    <String, dynamic>{
      'success': instance.success,
      'data': instance.data,
    };
