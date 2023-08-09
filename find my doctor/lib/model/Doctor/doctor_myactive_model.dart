import 'package:json_annotation/json_annotation.dart';

part 'doctor_myactive_model.g.dart';

@JsonSerializable()
class DoctorActiveModel {
  DoctorActiveModel();

  int? id;
  String? resepient_name;
  String? appointment_user;
  String? appoint_type;
  String? doctor_consultation_type;
  String? doctor;
  String? is_beneficiary;
  DateTime? date_time;
  double? amount;

  factory DoctorActiveModel.fromJson(Map<String, dynamic> json) =>
      _$DoctorActiveModelFromJson(json);

  Map<String, dynamic> toJson() => _$DoctorActiveModelToJson(this);

  @override
  String toString() {
    return 'DoctorActiveModel{id: $id, resepient_name: $resepient_name, appointment_user: $appointment_user, appoint_type: $appoint_type, doctor_consultation_type:$doctor_consultation_type, doctor: $doctor, is_beneficiary: $is_beneficiary, date_time: $date_time,amount:$amount}';
  }
}

@JsonSerializable()
class DoctorActiveCompleteModel {
  int? success;
  List<DoctorActiveModel>? data;

  DoctorActiveCompleteModel({
    this.success,
    this.data,
  });

  factory DoctorActiveCompleteModel.fromJson(Map<String, dynamic> json) =>
      _$DoctorActiveCompleteModelFromJson(json);

  Map<String, dynamic> toJson() => _$DoctorActiveCompleteModelToJson(this);

  @override
  String toString() {
    return 'DoctorActiveCompleteModel{success: $success, data: $data}';
  }
}
