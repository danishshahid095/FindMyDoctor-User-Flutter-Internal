import 'package:json_annotation/json_annotation.dart';

part 'historyLabBookingModel.g.dart';

@JsonSerializable()
class HistoryLabBookingModel {
  HistoryLabBookingModel();

  int? id;
  double? amount;
  int? status;
  String? name;
  String? is_beneficiary;
  DateTime? date_time;
  String? b_status;

  factory HistoryLabBookingModel.fromJson(Map<String, dynamic> json) =>
      _$HistoryLabBookingModelFromJson(json);

  Map<String, dynamic> toJson() => _$HistoryLabBookingModelToJson(this);

  @override
  String toString() {
    return 'HistoryLabBookingModel{id: $id, amount: $amount, status: $status, name: $name, is_beneficiary: $is_beneficiary, date_time: $date_time, b_status: $b_status}';
  }
}

@JsonSerializable()
class HistoryLabBookingCompleteModel {
  int? success;
  List<HistoryLabBookingModel>? data;

  HistoryLabBookingCompleteModel({
    this.success,
    this.data,
  });

  factory HistoryLabBookingCompleteModel.fromJson(Map<String, dynamic> json) =>
      _$HistoryLabBookingCompleteModelFromJson(json);

  Map<String, dynamic> toJson() => _$HistoryLabBookingCompleteModelToJson(this);

  @override
  String toString() {
    return 'HistoryLabBookingCompleteModel{success: $success, data: $data}';
  }
}
