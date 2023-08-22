import 'package:json_annotation/json_annotation.dart';

part 'doctor_history_model.g.dart';

@JsonSerializable()
class DoctorHistoryModel {
  DoctorHistoryModel();

  int? id;
  String? resepient_name;
  String? appointment_user;
  String? appoint_type;
  String? doctor_consultation_type;
  int? doctor;
  String? is_beneficiary;
  DateTime? date_time;
  double? amount;

  factory DoctorHistoryModel.fromJson(Map<String, dynamic> json) =>
      _$DoctorHistoryModelFromJson(json);

  Map<String, dynamic> toJson() => _$DoctorHistoryModelToJson(this);

  @override
  String toString() {
    return 'DoctorHistoryModel{id: $id, resepient_name: $resepient_name, appointment_user: $appointment_user, appoint_type: $appoint_type, doctor_consultation_type:$doctor_consultation_type, doctor: $doctor, is_beneficiary: $is_beneficiary, date_time: $date_time,amount:$amount}';
  }
}

@JsonSerializable()
class DoctorHistoryCompleteModel {
  int? success;
  List<DoctorHistoryModel>? data;

  DoctorHistoryCompleteModel({
    this.success,
    this.data,
  });

  factory DoctorHistoryCompleteModel.fromJson(Map<String, dynamic> json) =>
      _$DoctorHistoryCompleteModelFromJson(json);

  Map<String, dynamic> toJson() => _$DoctorHistoryCompleteModelToJson(this);

  @override
  String toString() {
    return 'DoctorHistoryCompleteModel{success: $success, data: $data}';
  }
}
