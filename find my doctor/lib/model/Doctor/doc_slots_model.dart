import 'package:json_annotation/json_annotation.dart';

part 'doc_slots_model.g.dart';

@JsonSerializable()
class SlotsModel {
  String? bookedSlotsDate;
  String? bookedSlotsTime;

  SlotsModel({this.bookedSlotsDate, this.bookedSlotsTime});
  factory SlotsModel.fromJson(Map<String, dynamic> json) =>
      _$SlotsModelFromJson(json);

  Map<String, dynamic> toJson() => _$SlotsModelToJson(this);
  @override
  String toString() {
    return 'OnlineDoctorModel{bookedSlotsDate: $bookedSlotsDate, bookedSlotsTime: $bookedSlotsTime,}';
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
