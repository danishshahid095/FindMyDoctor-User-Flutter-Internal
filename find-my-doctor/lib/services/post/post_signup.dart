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

      if (response.statusCode == 200) {
        // Successful response
        if (response.data["status"] == true) {
          return response.data;
        } else {
          return response.data;
        }
      } else if (response.statusCode == 409) {
        // Handle conflict (status code 409) here
        return response.data;
      } else {
        // Handle other status codes here if needed
        return response.data;
      }
    } on DioError catch (e) {
      // Catch DioError separately
      if (e.response != null && e.response!.statusCode == 409) {
        // Handle conflict (status code 409) here
        return e.response!.data;
      } else {
        // Handle other DioError cases here
        return e.message;
      }
    } catch (e) {
      // Handle other exceptions here
      dynamic exception = e;
      return exception.message;
    }
  }
}
