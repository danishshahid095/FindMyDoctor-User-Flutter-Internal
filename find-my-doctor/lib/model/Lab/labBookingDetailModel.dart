import 'package:json_annotation/json_annotation.dart';

part 'labBookingDetailModel.g.dart';

@JsonSerializable()
class LabTestModel {
  LabTestModel();

  int? id;
  int? booking;
  String? test_name;
  int? test_id;
  double? test_price;
  String? lab_name;
  int? lab_id;
  dynamic test_report;

  factory LabTestModel.fromJson(Map<String, dynamic> json) =>
      _$LabTestModelFromJson(json);

  Map<String, dynamic> toJson() => _$LabTestModelToJson(this);

  @override
  String toString() {
    return 'LabTestModel{id: $id, booking: $booking, test_name: $test_name, test_id: $test_id, test_price: $test_price, lab_name: $lab_name, lab_id: $lab_id, test_report: $test_report}';
  }
}

@JsonSerializable()
class LabBookingDetailModel {
  LabBookingDetailModel();

  int? id;
  double? amount;
  int? status;
  String? name;
  String? is_beneficiary;
  DateTime? date_time;
  String? b_status;
  List<LabTestModel>? tests;

  factory LabBookingDetailModel.fromJson(Map<String, dynamic> json) =>
      _$LabBookingDetailModelFromJson(json);

  Map<String, dynamic> toJson() => _$LabBookingDetailModelToJson(this);

  @override
  String toString() {
    return 'LabBookingDetailModel{id: $id, amount: $amount, status: $status, name: $name, is_beneficiary: $is_beneficiary, date_time: $date_time, b_status: $b_status, tests: $tests}';
  }
}

@JsonSerializable()
class LabBookingDetailCompleteModel {
  int? success;
  LabBookingDetailModel? data;

  LabBookingDetailCompleteModel({
    this.success,
    this.data,
  });

  factory LabBookingDetailCompleteModel.fromJson(Map<String, dynamic> json) =>
      _$LabBookingDetailCompleteModelFromJson(json);

  Map<String, dynamic> toJson() => _$LabBookingDetailCompleteModelToJson(this);

  @override
  String toString() {
    return 'LabBookingDetailCompleteModel{success: $success, data: $data}';
  }
}
