import 'package:json_annotation/json_annotation.dart';

part 'pharmacyMyHistoryModel.g.dart';

@JsonSerializable()
class PharmacyHistoryModel {
  PharmacyHistoryModel();

  int? id;
  String? resepient_name;
  String? name;
  int? amount;
  int? status;
  String? rider;
  String? delivery_status;
  String? is_beneficiary;
  String? date_time;
  String? b_status;

  factory PharmacyHistoryModel.fromJson(Map<String, dynamic> json) =>
      _$PharmacyHistoryModelFromJson(json);

  Map<String, dynamic> toJson() => _$PharmacyHistoryModelToJson(this);

  @override
  String toString() {
    return 'PharmacyHistoryModel{id: $id, resepient_name: $resepient_name, name: $name, amount:$amount,status:$status,rider: $rider, delivery_status:$delivery_status, is_beneficiary: $is_beneficiary, date_time: $date_time, b_status:$b_status}';
  }
}

@JsonSerializable()
class PharmacyMyHistoryCompleteModel {
  int? success;
  List<PharmacyHistoryModel>? data;

  PharmacyMyHistoryCompleteModel({
    this.success,
    this.data,
  });

  factory PharmacyMyHistoryCompleteModel.fromJson(Map<String, dynamic> json) =>
      _$PharmacyMyHistoryCompleteModelFromJson(json);

  Map<String, dynamic> toJson() => _$PharmacyMyHistoryCompleteModelToJson(this);

  @override
  String toString() {
    return 'PharmacyMyHistoryCompleteModel{success: $success, data: $data}';
  }
}
