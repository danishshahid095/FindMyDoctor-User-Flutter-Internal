import 'package:json_annotation/json_annotation.dart';

part 'onlineDoctorModel.g.dart';

@JsonSerializable()
class OnlineDoctorModel {
  int? id;
  String? fullName;
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
  String? startTime;
  String? endTime;

  OnlineDoctorModel({
    this.id,
    this.fullName,
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
    this.startTime,
    this.endTime,
  });

  factory OnlineDoctorModel.fromJson(Map<String, dynamic> json) =>
      _$OnlineDoctorModelFromJson(json);

  Map<String, dynamic> toJson() => _$OnlineDoctorModelToJson(this);

  @override
  String toString() {
    return 'OnlineDoctorModel{id: $id, fullname: $fullName, email: $email, phone: $phone, type: $type, image: $image, qualification: $qualification, experience: $experience, specialistCategory: $specialistCategory, PMDA_ID: $PMDA_ID, CNIC: $CNIC, availability: $availability, fee: $fee, speciality: $speciality, doctorType: $doctorType, consultation: $consultation, startTime: $startTime, endTime: $endTime}';
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
