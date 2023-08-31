import 'dart:io';

import 'package:dio/dio.dart';

import 'package:find_my_doctor/modules/dio_service.dart';

import '../../model/Beneficiaries/get_beneficiaries_model.dart';



class GetBeneficy {
  var _dioService = DioService.getInstance();

  Future getbeneficy(String token) async {
    try {
      final response = await _dioService.get(
        'beneficiaries/',
        options: Options(headers: {
          HttpHeaders.authorizationHeader: 'Bearer $token',
          'content-Type': 'application/json'
        }),
      );
      if (response.statusCode == 200) {
        if (response.data["success"] == 1) {
          List historyData = response.data["data"];
          List<GetBencfyModel> doctormyhistoryModel =
              historyData.map((e) => GetBencfyModel.fromJson(e)).toList();
          return doctormyhistoryModel;
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
