// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'historyLabBookingModel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

HistoryLabBookingModel _$HistoryLabBookingModelFromJson(
        Map<String, dynamic> json) =>
    HistoryLabBookingModel()
      ..id = json['id'] as int?
      ..amount = (json['amount'] as num?)?.toDouble()
      ..status = json['status'] as int?
      ..name = json['name'] as String?
      ..is_beneficiary = json['is_beneficiary'] as String?
      ..date_time = json['date_time'] == null
          ? null
          : DateTime.parse(json['date_time'] as String)
      ..b_status = json['b_status'] as String?;

Map<String, dynamic> _$HistoryLabBookingModelToJson(
        HistoryLabBookingModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'amount': instance.amount,
      'status': instance.status,
      'name': instance.name,
      'is_beneficiary': instance.is_beneficiary,
      'date_time': instance.date_time?.toIso8601String(),
      'b_status': instance.b_status,
    };

HistoryLabBookingCompleteModel _$HistoryLabBookingCompleteModelFromJson(
        Map<String, dynamic> json) =>
    HistoryLabBookingCompleteModel(
      success: json['success'] as int?,
      data: (json['data'] as List<dynamic>?)
          ?.map(
              (e) => HistoryLabBookingModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$HistoryLabBookingCompleteModelToJson(
        HistoryLabBookingCompleteModel instance) =>
    <String, dynamic>{
      'success': instance.success,
      'data': instance.data,
    };
