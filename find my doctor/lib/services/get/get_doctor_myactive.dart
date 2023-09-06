import 'dart:io';
import 'package:dio/dio.dart';
import 'package:find_my_doctor/modules/dio_service.dart';

import '../../model/Doctor/doctor_myactive_model.dart';

class GetDoctorMyActive {
  var _dioService = DioService.getInstance();

  Future getdoctorMyActive(String token) async {
    try {
      final response = await _dioService.get('appointments/doctor/my-active',
        options: Options(
            headers: {
              HttpHeaders.authorizationHeader:
              'Bearer $token',
              'content-Type': 'application/json'
            }),
      );
      if(response.statusCode == 200){
          List historyData = response.data["data"];
          List<DoctorActiveModel> doctormyactiveModel = historyData.map((e) => DoctorActiveModel.fromJson(e)).toList();
         
           print('this is  model data ${doctormyactiveModel}');
          return doctormyactiveModel;
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