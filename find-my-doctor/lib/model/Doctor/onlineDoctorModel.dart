import 'package:json_annotation/json_annotation.dart';

part 'onlineDoctorModel.g.dart';

@JsonSerializable()
class OnlineDoctorModel {
  int? id;
  String? fullname;
  String? email;
  String? phone;
  int? type;
  String? image;
  String? qualification;
  String? experience;
  int? specialistCategory;
  int? PMDA_ID;
  String? CNIC;
  String? availability;
  double? fee;
  String? speciality;
  String? doctorType;
  String? consultation;
  String? start_time;
  String? end_time;

  OnlineDoctorModel({
    this.id,
    this.fullname,
    this.email,
    this.phone,
    this.type,
    this.image,
    this.qualification,
    this.experience,
    this.specialistCategory,
    this.PMDA_ID,
    this.CNIC,
    this.availability,
    this.fee,
    this.speciality,
    this.doctorType,
    this.consultation,
    this.start_time,
    this.end_time,
  });

  factory OnlineDoctorModel.fromJson(Map<String, dynamic> json) =>
      _$OnlineDoctorModelFromJson(json);

  Map<String, dynamic> toJson() => _$OnlineDoctorModelToJson(this);

  @override
  String toString() {
    return 'OnlineDoctorModel{id: $id, fullname: $fullname, email: $email, phone: $phone, type: $type, image: $image, qualification: $qualification, experience: $experience, specialistCategory: $specialistCategory, PMDA_ID: $PMDA_ID, CNIC: $CNIC, availability: $availability, fee: $fee, speciality: $speciality, doctorType: $doctorType, consultation: $consultation, start_time: $start_time, end_time: $end_time}';
  }
}

@JsonSerializable()
class OnlineDoctorCompleteModel {
  int? success;
  List<OnlineDoctorModel>? data;

  OnlineDoctorCompleteModel({
    this.success,
    this.data,
  });

  factory OnlineDoctorCompleteModel.fromJson(Map<String, dynamic> json) =>
      _$OnlineDoctorCompleteModelFromJson(json);

  Map<String, dynamic> toJson() => _$OnlineDoctorCompleteModelToJson(this);

  @override
  String toString() {
    return 'OnlineDoctorCompleteModel{success: $success, data: $data}';
  }
}
