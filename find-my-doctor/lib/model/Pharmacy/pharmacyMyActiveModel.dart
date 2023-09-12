import 'package:json_annotation/json_annotation.dart';

part 'pharmacyMyActiveModel.g.dart';

@JsonSerializable()
class PharmacyActiveModel {
  PharmacyActiveModel();

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

  factory PharmacyActiveModel.fromJson(Map<String, dynamic> json) =>
      _$PharmacyActiveModelFromJson(json);

  Map<String, dynamic> toJson() => _$PharmacyActiveModelToJson(this);

  @override
  String toString() {
    return 'PharmacyActiveModel{id: $id, resepient_name: $resepient_name, name: $name, amount:$amount,status:$status,rider: $rider, delivery_status:$delivery_status, is_beneficiary: $is_beneficiary, date_time: $date_time, b_status:$b_status}';
  }
}

@JsonSerializable()
class PharmacyMyActiveCompleteModel {
  int? success;
  List<PharmacyActiveModel>? data;

  PharmacyMyActiveCompleteModel({
    this.success,
    this.data,
  });

  factory PharmacyMyActiveCompleteModel.fromJson(Map<String, dynamic> json) =>
      _$PharmacyMyActiveCompleteModelFromJson(json);

  Map<String, dynamic> toJson() => _$PharmacyMyActiveCompleteModelToJson(this);

  @override
  String toString() {
    return 'PharmacyMyActiveCompleteModel{success: $success, data: $data}';
  }
}
