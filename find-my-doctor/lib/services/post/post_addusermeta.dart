import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:find_my_doctor/modules/dio_service.dart';

class AddUserMeta {
  var _dioService = DioService.getInstance();

  Future addusermeta(
      String token, String key, String value, int user) async {
    var json = {
      "key": key,
      "value": value,
      "user": user
      // "password": password,
    };
    try {
      final response = await _dioService.post(
        'user-meta/create',
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
          // UserDetailsModel userDetailsResponse =
          //     UserDetailsModel.fromJson(response.data);
          // userDetailsResponse;
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
