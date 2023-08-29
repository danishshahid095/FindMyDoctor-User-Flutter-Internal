import 'dart:io';

import 'package:dio/dio.dart';

import 'package:find_my_doctor/modules/dio_service.dart';

import '../../model/login/get_user_meta_model.dart';

class GetUseMeta {
  var _dioService = DioService.getInstance();

  Future getuser(String token, int usreId) async {
    try {
      final response = await _dioService.get(
        'user-meta/$usreId',
        options: Options(headers: {
          HttpHeaders.authorizationHeader: 'Bearer $token',
          'content-Type': 'application/json'
        }),
      );
      print('this is my respone ${response}');
      if (response.statusCode == 200) {
        // user found
        print(response.statusCode);
        print(response.data);
        if (response.data["success"] == 1) {
          List newdata = response.data['data'];
          print('my data ${newdata}');
          List<GetUserMeta> getUsermeta =
              newdata.map((e) => GetUserMeta.fromJson(e)).toList();
          //print('this is model dat ${doctormyactiveModel}');
          return getUsermeta;
        } else {
          return response.data['message'];
        }
      } else {
        return response.statusMessage;
      }
      // if (response.statusCode == 200) {

      //   List historyData = response.data["data"];
      //   List<DoctorActiveModel> doctormyactiveModel =
      //       historyData.map((e) => DoctorActiveModel.fromJson(e)).toList();
      //   return doctormyactiveModel;
      // } else {
      //   return response.statusMessage;
      // }
    } catch (e) {
      dynamic exception = e;
      print(e);
      return exception.message;
    }
  }
}
