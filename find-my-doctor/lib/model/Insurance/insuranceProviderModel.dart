import 'package:json_annotation/json_annotation.dart';

part 'insuranceProviderModel.g.dart';

@JsonSerializable()
class InsuranceProviderModel {
  int? id;
  String? fullname;
  String? email;
  String? phone;
  int? type;
  String? name;
  String? logo;
  String? website;
  String? headofficeAddress;
  String? contactPersonNumber;

  InsuranceProviderModel({
    this.id,
    this.fullname,
    this.email,
    this.phone,
    this.type,
    this.name,
    this.logo,
    this.website,
    this.headofficeAddress,
    this.contactPersonNumber,
  });

  factory InsuranceProviderModel.fromJson(Map<String, dynamic> json) =>
      _$InsuranceProviderModelFromJson(json);

  Map<String, dynamic> toJson() => _$InsuranceProviderModelToJson(this);

  @override
  String toString() {
    return 'InsuranceProviderModel{id: $id, fullname: $fullname, email: $email, phone: $phone, type: $type, name: $name, logo: $logo, website: $website, headofficeAddress: $headofficeAddress, contactPersonNumber: $contactPersonNumber}';
  }
}

@JsonSerializable()
class InsuranceProvidersCompleteModel {
  int? success;
  List<InsuranceProviderModel>? data;

  InsuranceProvidersCompleteModel({
    this.success,
    this.data,
  });

  factory InsuranceProvidersCompleteModel.fromJson(
      Map<String, dynamic> json) =>
      _$InsuranceProvidersCompleteModelFromJson(json);

  Map<String, dynamic> toJson() =>
      _$InsuranceProvidersCompleteModelToJson(this);

  @override
  String toString() {
    return 'InsuranceProvidersCompleteModel{success: $success, data: $data}';
  }
}
