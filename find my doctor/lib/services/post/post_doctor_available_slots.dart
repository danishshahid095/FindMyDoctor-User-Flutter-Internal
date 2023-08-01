import 'dart:convert';
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:find_my_doctor/modules/dio_service.dart';

class availableSlot {
  var _dioService = DioService.getInstance();

  Future AvailableSlot(int? userId, String? date,) async {
    var availableslotJson = {
      "id": userId,
      "date": date,
     
    };
    try {
      final response = await _dioService.post('doctors/available-slots',
        options: Options(
            headers: {
             // HttpHeaders.authorizationHeader:
             // 'Bearer $token',
              HttpHeaders.contentTypeHeader: "application/json",
            }),
        data: jsonEncode(availableslotJson),
      );
      if(response.statusCode == 200){
        // user found
        if(response.data["status"] == 1){
          return;
        }
        else {
          return response.data['message'];
        }
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