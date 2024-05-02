import 'dart:convert';
import 'package:json_annotation/json_annotation.dart';

part 'insurancePackageModel.g.dart';

@JsonSerializable()
class Feature {
  String? featureKey;
  dynamic featureValue;

  Feature({this.featureKey, this.featureValue});

  factory Feature.fromJson(Map<String, dynamic> json) {
    return Feature(
      featureKey: json['featureKey'] as String?,
      featureValue: json['featureValue'] as dynamic,
    );
  }
}

@JsonSerializable()
class InsurancePackageModel {
  int? id;
  String? name;
  int? annual_cost;
  String? features; // Features as a string
  int? for_parents;

  InsurancePackageModel({
    this.id,
    this.name,
    this.annual_cost,
    this.features,
    this.for_parents,
  });

  factory InsurancePackageModel.fromJson(Map<String, dynamic> json) {
    return InsurancePackageModel(
      id: json['id'] as int?,
      name: json['name'] as String?,
      annual_cost: json['annual_cost'] as int?,
      features: json['features'] as String?,
      for_parents: json['for_parents'] as int?,
    );
  }

  Map<String, dynamic> toJson() => _$InsurancePackageModelToJson(this);

  List<Feature> getFormattedFeatures() {
    if (features != null) {
      final List<dynamic> rawFeatures = json.decode(features!);
      return rawFeatures
          .map((dynamic feature) => Feature.fromJson(feature))
          .toList();
    }
    return [];
  }

  String getFormattedFeaturesAsString() {
    final List<Feature> formattedFeatures = getFormattedFeatures();
    return formattedFeatures
        .map((feature) => '${feature.featureKey}: ${feature.featureValue}')
        .join('\n');
  }
}

@JsonSerializable()
class InsurancePackagesCompleteModel {
  int? success;
  List<InsurancePackageModel>? data;

  InsurancePackagesCompleteModel({
    this.success,
    this.data,
  });

  factory InsurancePackagesCompleteModel.fromJson(
      Map<String, dynamic> json) =>
      _$InsurancePackagesCompleteModelFromJson(json);

  Map<String, dynamic> toJson() =>
      _$InsurancePackagesCompleteModelToJson(this);
}
