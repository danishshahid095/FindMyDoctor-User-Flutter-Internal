import 'dart:convert';
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:find_my_doctor/modules/dio_service.dart';

import '../../model/Doctor/doc_slots_model.dart';
import '../../model/Doctor/onlineDoctorModel.dart';

class availableSlot {
  var _dioService = DioService.getInstance();

  Future<List<SlotsModel>?> AvailableSlot(
    int? id,
    String? date,
  ) async {
    var availableslotJson = {
      "id": id,
      "date": date,
    };
    try {
      final response = await _dioService.post(
        'doctors/available-slots',
        options: Options(headers: {
          // HttpHeaders.authorizationHeader:
          // 'Bearer $token',
          HttpHeaders.contentTypeHeader: "application/json",
        }),
        data: jsonEncode(availableslotJson),

        //var data = json.decode(response.toString());
      );
      // var newdata = json.decode(data);
      if (response.statusCode == 200) {
        // user found
        if (response.data["success"] == 1) {
          List historyData = response.data["data"];
          print(historyData);
          List<SlotsModel> docslotModel =
              historyData.map((e) => SlotsModel.fromJson(e)).toList();
          return docslotModel;
          // SlotsModel onlineDocResponse = SlotsModel.fromJson(response.data);
          // return onlineDocResponse;
        } else {
          return null;
        }
      } else {
        return null;
      }
    } catch (e) {
      dynamic exception = e;
      return exception.message;
    }
  }
}
