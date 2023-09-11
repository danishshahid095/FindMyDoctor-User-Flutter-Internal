import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:find_my_doctor/model/login/userLoginModel.dart';
import 'package:find_my_doctor/modules/dio_service.dart';

class UserLoginGet {
  var _dioService = DioService.getInstance();

  Future loginUser(String login_id, String password) async {
    var json = {
      "email": login_id,
      "password": password,
    };
    try {
      final response = await _dioService.post('users/login',
        options: Options(
            headers: {
              HttpHeaders.contentTypeHeader: "application/json",
            }),
        data: jsonEncode(json),
      );
      if(response.statusCode == 200){
        // user found
        if(response.data["success"] == 1){
          UserLoginModel userLoginResponse = UserLoginModel.fromJson(response.data);
          return userLoginResponse;
        }
        else {
          return response.data['data'];
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