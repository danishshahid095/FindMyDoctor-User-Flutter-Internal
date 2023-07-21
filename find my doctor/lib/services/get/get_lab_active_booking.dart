import 'dart:io';

import 'package:dio/dio.dart';
import 'package:find_my_doctor/model/Lab/activeLabBookingModel.dart';
import 'package:find_my_doctor/model/Pharmacy/pharmacyCityModel.dart';
import 'package:find_my_doctor/modules/dio_service.dart';

class GetLabActiveBooking {
  var _dioService = DioService.getInstance();

  Future getlabActiveBooking(String token) async {
    try {
      final response = await _dioService.get('booking-lab/my-bookings',
        options: Options(
            headers: {
              HttpHeaders.authorizationHeader:
              'Bearer $token',
              'content-Type': 'application/json'
            }),
      );
      if(response.statusCode == 200){
          List historyData = response.data["data"];
          List<ActiveLabBookingModel> activeLabBookingModel = historyData.map((e) => ActiveLabBookingModel.fromJson(e)).toList();
          return activeLabBookingModel;
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