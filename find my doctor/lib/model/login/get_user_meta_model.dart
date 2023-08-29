



import 'package:json_annotation/json_annotation.dart';

part 'get_user_meta_model.g.dart';

@JsonSerializable()
class GetUserMeta {
  GetUserMeta();

 
  String? meta_key;
  String? meta_value;
  

  factory GetUserMeta.fromJson(Map<String, dynamic> json) =>
      _$GetUserMetaFromJson(json);

  Map<String, dynamic> toJson() => _$GetUserMetaToJson(this);

  @override
  String toString() {
    return 'GetUserMeta{meta_key: $meta_key, meta_value: $meta_value, }';
  }
}

@JsonSerializable()
class GetUserMetaCompleteModel {
  int? success;
  List<GetUserMeta>? data;

  GetUserMetaCompleteModel({
    this.success,
    this.data,
  });

  factory GetUserMetaCompleteModel.fromJson(Map<String, dynamic> json) =>
      _$GetUserMetaCompleteModelFromJson(json);

  Map<String, dynamic> toJson() => _$GetUserMetaCompleteModelToJson(this);

  @override
  String toString() {
    return 'GetUserMetaCompleteModel{success: $success, data: $data}';
  }
}
