import 'package:json_annotation/json_annotation.dart';

part 'doc_slots_model.g.dart';

@JsonSerializable()
class SlotsModel {
  String? bookedSlotsDate;
  String? booked_slots_time;

  SlotsModel({this.bookedSlotsDate, this.booked_slots_time});
  factory SlotsModel.fromJson(Map<String, dynamic> json) =>
      _$SlotsModelFromJson(json);

  Map<String, dynamic> toJson() => _$SlotsModelToJson(this);
  @override
  String toString() {
    return 'SlotsModel{bookedSlotsDate: $bookedSlotsDate, bookedSlotsTime: $booked_slots_time,}';
  }
}

@JsonSerializable()
class DocSlotCompleteModel {
  int? success;
  List<SlotsModel>? data;

  DocSlotCompleteModel({
    this.success,
    this.data,
  });

  factory DocSlotCompleteModel.fromJson(Map<String, dynamic> json) =>
      _$DocSlotCompleteModelFromJson(json);

  Map<String, dynamic> toJson() => _$DocSlotCompleteModelToJson(this);

  @override
  String toString() {
    return 'DocSlotCompleteModel{success: $success, data: $data}';
  }
}
