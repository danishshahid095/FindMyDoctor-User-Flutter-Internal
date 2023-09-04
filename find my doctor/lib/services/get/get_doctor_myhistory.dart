import 'dart:io';

import 'package:dio/dio.dart';

import 'package:find_my_doctor/modules/dio_service.dart';

import '../../model/Doctor/doctor_history_model.dart';

class GetDoctorMyHostory {
  var _dioService = DioService.getInstance();

  Future getdoctorMyHistory(String token) async {
    try {
      final response = await _dioService.get(
        'appointments/doctor/my-history',
        options: Options(headers: {
          HttpHeaders.authorizationHeader: 'Bearer $token',
          'content-Type': 'application/json'
        }),
      );
      if (response.statusCode == 200) {
        List historyData = response.data["data"];
        List<DoctorHistoryModel> doctormyhistoryModel =
            historyData.map((e) => DoctorHistoryModel.fromJson(e)).toList();
        return doctormyhistoryModel;
      } else {
        return response.statusMessage;
      }
    } catch (e) {
      dynamic exception = e;
      return exception.message;
    }
  }
}
