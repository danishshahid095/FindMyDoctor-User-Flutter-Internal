// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'activeLabBookingModel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ActiveLabBookingModel _$ActiveLabBookingModelFromJson(
        Map<String, dynamic> json) =>
    ActiveLabBookingModel()
      ..id = json['id'] as int?
      ..amount = json['amount'] as int?
      ..status = json['status'] as int?
      ..name = json['name'] as String?
      ..is_beneficiary = json['is_beneficiary'] as String?
      ..date_time = json['date_time'] as String?
      ..b_status = json['b_status'] as String?;

Map<String, dynamic> _$ActiveLabBookingModelToJson(
        ActiveLabBookingModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'amount': instance.amount,
      'status': instance.status,
      'name': instance.name,
      'is_beneficiary': instance.is_beneficiary,
      'date_time': instance.date_time,
      'b_status': instance.b_status,
    };

ActiveLabBookingCompleteModel _$ActiveLabBookingCompleteModelFromJson(
        Map<String, dynamic> json) =>
    ActiveLabBookingCompleteModel(
      success: json['success'] as int?,
      data: (json['data'] as List<dynamic>?)
          ?.map(
              (e) => ActiveLabBookingModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ActiveLabBookingCompleteModelToJson(
        ActiveLabBookingCompleteModel instance) =>
    <String, dynamic>{
      'success': instance.success,
      'data': instance.data,
    };
