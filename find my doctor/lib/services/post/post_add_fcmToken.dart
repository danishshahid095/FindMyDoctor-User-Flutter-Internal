import 'dart:convert';
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:find_my_doctor/modules/dio_service.dart';

class AddFcmToken {
  var _dioService = DioService.getInstance();

  Future addFcmToken(String token, String fcmToken, int userId) async {
    var benficiaryJson = {
      "user": userId,
      "key": "device_token",
      "value" : fcmToken
    };
    try {
      final response = await _dioService.post('user-meta/create',
        options: Options(
            headers: {
              HttpHeaders.authorizationHeader:
              'Bearer $token',
              HttpHeaders.contentTypeHeader: "application/json",
            }),
        data: jsonEncode(benficiaryJson),
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