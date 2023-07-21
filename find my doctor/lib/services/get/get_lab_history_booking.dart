import 'dart:io';

import 'package:dio/dio.dart';
import 'package:find_my_doctor/modules/dio_service.dart';
import '../../model/Lab/historyLabBookingModel.dart';

class GetLabHistoryBooking {
  var _dioService = DioService.getInstance();

  Future getlabHistoryBooking(String token) async {
    try {
      final response = await _dioService.get('booking-lab/my-history',
        options: Options(
            headers: {
              HttpHeaders.authorizationHeader:
              'Bearer $token',
              'content-Type': 'application/json'
            }),
      );
      if(response.statusCode == 200){
          List historyData = response.data["data"];
          List<HistoryLabBookingModel> historyLabBookingModel = historyData.map((e) => HistoryLabBookingModel.fromJson(e)).toList();
          return historyLabBookingModel;
      }
      else{
        return response.statusMessage;
      }
    }
    catch (e) {
      dynamic exception= e;
      return exception.message;
    }
  }
}