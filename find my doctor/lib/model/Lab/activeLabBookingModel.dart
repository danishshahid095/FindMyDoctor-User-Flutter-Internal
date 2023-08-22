import 'package:json_annotation/json_annotation.dart';

part 'activeLabBookingModel.g.dart';

@JsonSerializable()
class ActiveLabBookingModel {
  ActiveLabBookingModel();

  int? id;
  int? amount;
  int? status;
  String? name;
  String? is_beneficiary;
  String? date_time;
  String? b_status;

  factory ActiveLabBookingModel.fromJson(Map<String, dynamic> json) =>
      _$ActiveLabBookingModelFromJson(json);

  Map<String, dynamic> toJson() => _$ActiveLabBookingModelToJson(this);

  @override
  String toString() {
    return 'ActiveLabBookingModel{id: $id, amount: $amount, status: $status, name: $name, is_beneficiary: $is_beneficiary, date_time: $date_time, b_status: $b_status}';
  }
}

@JsonSerializable()
class ActiveLabBookingCompleteModel {
  int? success;
  List<ActiveLabBookingModel>? data;

  ActiveLabBookingCompleteModel({
    this.success,
    this.data,
  });

  factory ActiveLabBookingCompleteModel.fromJson(Map<String, dynamic> json) =>
      _$ActiveLabBookingCompleteModelFromJson(json);

  Map<String, dynamic> toJson() => _$ActiveLabBookingCompleteModelToJson(this);

  @override
  String toString() {
    return 'ActiveLabBookingCompleteModel{success: $success, data: $data}';
  }
}
