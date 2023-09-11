import 'dart:convert';
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:find_my_doctor/modules/dio_service.dart';

class UserSignUp {
  var _dioService = DioService.getInstance();

  Future signup(String fullname, String email, String password, String phone) async {
    var signupJson = {
      "fullname": fullname,
      "email": email,
      "password": password,
      "phone" : phone
    };
    try {
      final response = await _dioService.post('users/register',
        options: Options(
            headers: {
              HttpHeaders.contentTypeHeader: "application/json",
            }),
        data: jsonEncode(signupJson),
      );
      if(response.statusCode == 200){
        // user found
        if(response.data["status"] == true){
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