import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:find_my_doctor/modules/dio_service.dart';

class UserUpdate {
  var _dioService = DioService.getInstance();
  Future userUpdate(String token, String fullName, String Email, String Phone,
      int id) async {
    var json = {
      "fullname": fullName,
      "email": Email,
      "phone": Phone,
      "id": id
      // "password": password,
    };
    try {
      final response = await _dioService.patch(
        'users/update-data',
        //  'user-meta/update',
        options: Options(headers: {
          HttpHeaders.authorizationHeader: 'Bearer $token',
          HttpHeaders.contentTypeHeader: "application/json",
        }),
        data: jsonEncode(json),
      );
      if (response.statusCode == 200) {
        // user found
        //print('udate');
        if (response.data["success"] == 1) {
          return;
        } else {
          return response.data['message'];
        }
      } else {
        return response.statusMessage;
      }
    } catch (e) {
      dynamic exception = e;
      return exception.message;
    }
  }
}
