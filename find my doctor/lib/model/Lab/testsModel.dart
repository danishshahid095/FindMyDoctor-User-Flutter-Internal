import 'package:json_annotation/json_annotation.dart';

part 'testsModel.g.dart';

@JsonSerializable()
class TestsModel {
  TestsModel();

  double? test_amount;
  String? test_time;
  String? test_name;
  int? test_id;
  String? lab_name;
  String? lab_logo;

  factory TestsModel.fromJson(Map<String, dynamic> json) =>
      _$TestsModelFromJson(json);

  Map<String, dynamic> toJson() => _$TestsModelToJson(this);

  @override
  String toString() {
    return 'TestsModel{test_amount: $test_amount, test_time: $test_time, test_name: $test_name, test_id: $test_id, lab_name: $lab_name, lab_logo: $lab_logo}';
  }
}

@JsonSerializable()
class TestsCompleteModel {
  int? success;
  List<TestsModel>? data;

  TestsCompleteModel({
    this.success,
    this.data,
  });

  factory TestsCompleteModel.fromJson(Map<String, dynamic> json) =>
      _$TestsCompleteModelFromJson(json);

  Map<String, dynamic> toJson() => _$TestsCompleteModelToJson(this);

  @override
  String toString() {
    return 'TestsCompleteModel{success: $success, data: $data}';
  }
}
