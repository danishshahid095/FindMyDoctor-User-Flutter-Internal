// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'onlineDoctorModel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OnlineDoctorModel _$OnlineDoctorModelFromJson(Map<String, dynamic> json) =>
    OnlineDoctorModel(
      id: json['id'] as int?,
      fullname: json['fullname'] as String?,
      email: json['email'] as String?,
      phone: json['phone'] as String?,
      type: json['type'] as int?,
      image: json['image'] as String?,
      qualification: json['qualification'] as String?,
      experience: json['experience'] as String?,
      specialistCategory: json['specialistCategory'] as int?,
      PMDA_ID: json['PMDA_ID'] as int?,
      CNIC: json['CNIC'] as String?,
      availability: json['availability'] as String?,
      fee: (json['fee'] as num?)?.toDouble(),
      speciality: json['speciality'] as String?,
      doctorType: json['doctorType'] as String?,
      consultation: json['consultation'] as String?,
      start_time: json['start_time'] as String?,
      end_time: json['end_time'] as String?,
    );

Map<String, dynamic> _$OnlineDoctorModelToJson(OnlineDoctorModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'fullname': instance.fullname,
      'email': instance.email,
      'phone': instance.phone,
      'type': instance.type,
      'image': instance.image,
      'qualification': instance.qualification,
      'experience': instance.experience,
      'specialistCategory': instance.specialistCategory,
      'PMDA_ID': instance.PMDA_ID,
      'CNIC': instance.CNIC,
      'availability': instance.availability,
      'fee': instance.fee,
      'speciality': instance.speciality,
      'doctorType': instance.doctorType,
      'consultation': instance.consultation,
      'start_time': instance.start_time,
      'end_time': instance.end_time,
    };

OnlineDoctorCompleteModel _$OnlineDoctorCompleteModelFromJson(
        Map<String, dynamic> json) =>
    OnlineDoctorCompleteModel(
      success: json['success'] as int?,
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => OnlineDoctorModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$OnlineDoctorCompleteModelToJson(
        OnlineDoctorCompleteModel instance) =>
    <String, dynamic>{
      'success': instance.success,
      'data': instance.data,
    };
