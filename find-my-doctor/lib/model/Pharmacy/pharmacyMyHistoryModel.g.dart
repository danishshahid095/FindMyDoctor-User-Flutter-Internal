// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pharmacyMyHistoryModel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PharmacyHistoryModel _$PharmacyHistoryModelFromJson(
        Map<String, dynamic> json) =>
    PharmacyHistoryModel()
      ..id = json['id'] as int?
      ..resepient_name = json['resepient_name'] as String?
      ..name = json['name'] as String?
      ..amount = json['amount'] as int?
      ..status = json['status'] as int?
      ..rider = json['rider'] as String?
      ..delivery_status = json['delivery_status'] as String?
      ..is_beneficiary = json['is_beneficiary'] as String?
      ..date_time = json['date_time'] as String?
      ..b_status = json['b_status'] as String?;

Map<String, dynamic> _$PharmacyHistoryModelToJson(
        PharmacyHistoryModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'resepient_name': instance.resepient_name,
      'name': instance.name,
      'amount': instance.amount,
      'status': instance.status,
      'rider': instance.rider,
      'delivery_status': instance.delivery_status,
      'is_beneficiary': instance.is_beneficiary,
      'date_time': instance.date_time,
      'b_status': instance.b_status,
    };

PharmacyMyHistoryCompleteModel _$PharmacyMyHistoryCompleteModelFromJson(
        Map<String, dynamic> json) =>
    PharmacyMyHistoryCompleteModel(
      success: json['success'] as int?,
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => PharmacyHistoryModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$PharmacyMyHistoryCompleteModelToJson(
        PharmacyMyHistoryCompleteModel instance) =>
    <String, dynamic>{
      'success': instance.success,
      'data': instance.data,
    };
