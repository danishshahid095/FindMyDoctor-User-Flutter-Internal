// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pharmacyMyActiveModel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PharmacyActiveModel _$PharmacyActiveModelFromJson(Map<String, dynamic> json) =>
    PharmacyActiveModel()
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

Map<String, dynamic> _$PharmacyActiveModelToJson(
        PharmacyActiveModel instance) =>
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

PharmacyMyActiveCompleteModel _$PharmacyMyActiveCompleteModelFromJson(
        Map<String, dynamic> json) =>
    PharmacyMyActiveCompleteModel(
      success: json['success'] as int?,
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => PharmacyActiveModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$PharmacyMyActiveCompleteModelToJson(
        PharmacyMyActiveCompleteModel instance) =>
    <String, dynamic>{
      'success': instance.success,
      'data': instance.data,
    };
