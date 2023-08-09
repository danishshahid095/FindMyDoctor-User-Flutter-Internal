// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'doctor_history_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DoctorHistoryModel _$DoctorHistoryModelFromJson(Map<String, dynamic> json) =>
    DoctorHistoryModel()
      ..id = json['id'] as int?
      ..resepient_name = json['resepient_name'] as String?
      ..appointment_user = json['appointment_user'] as String?
      ..appoint_type = json['appoint_type'] as String?
      ..doctor_consultation_type = json['doctor_consultation_type'] as String?
      ..doctor = json['doctor'] as String?
      ..is_beneficiary = json['is_beneficiary'] as String?
      ..date_time = json['date_time'] == null
          ? null
          : DateTime.parse(json['date_time'] as String)
      ..amount = (json['amount'] as num?)?.toDouble();

Map<String, dynamic> _$DoctorHistoryModelToJson(DoctorHistoryModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'resepient_name': instance.resepient_name,
      'appointment_user': instance.appointment_user,
      'appoint_type': instance.appoint_type,
      'doctor_consultation_type': instance.doctor_consultation_type,
      'doctor': instance.doctor,
      'is_beneficiary': instance.is_beneficiary,
      'date_time': instance.date_time?.toIso8601String(),
      'amount': instance.amount,
    };

DoctorHistoryCompleteModel _$DoctorHistoryCompleteModelFromJson(
        Map<String, dynamic> json) =>
    DoctorHistoryCompleteModel(
      success: json['success'] as int?,
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => DoctorHistoryModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$DoctorHistoryCompleteModelToJson(
        DoctorHistoryCompleteModel instance) =>
    <String, dynamic>{
      'success': instance.success,
      'data': instance.data,
    };
