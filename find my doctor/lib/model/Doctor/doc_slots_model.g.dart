// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'doc_slots_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SlotsModel _$SlotsModelFromJson(Map<String, dynamic> json) => SlotsModel(
      bookedSlotsDate: json['bookedSlotsDate'] as String?,
      bookedSlotsTime: json['bookedSlotsTime'] as String?,
    );

Map<String, dynamic> _$SlotsModelToJson(SlotsModel instance) =>
    <String, dynamic>{
      'bookedSlotsDate': instance.bookedSlotsDate,
      'bookedSlotsTime': instance.bookedSlotsTime,
    };

DocSlotCompleteModel _$DocSlotCompleteModelFromJson(
        Map<String, dynamic> json) =>
    DocSlotCompleteModel(
      success: json['success'] as int?,
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => SlotsModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$DocSlotCompleteModelToJson(
        DocSlotCompleteModel instance) =>
    <String, dynamic>{
      'success': instance.success,
      'data': instance.data,
    };
