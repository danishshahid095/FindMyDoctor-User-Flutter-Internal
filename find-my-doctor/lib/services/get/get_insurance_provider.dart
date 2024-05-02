import 'dart:io';

import 'package:dio/dio.dart';
import 'package:find_my_doctor/model/Insurance/insuranceProviderModel.dart';
import 'package:find_my_doctor/modules/dio_service.dart';

class GetInsuranceProvider {
  var _dioService = DioService.getInstance();

  Future getInsuranceProvider(String token) async {
    try {
      final response = await _dioService.get('insurace-providers',
        options: Options(
            headers: {
              HttpHeaders.authorizationHeader:
              'Bearer $token',
              'content-Type': 'application/json'
            }),
      );
      if(response.statusCode == 200){
          List historyData = response.data["data"];
          List<InsuranceProviderModel> insuranceProviderModel = historyData.map((e) => InsuranceProviderModel.fromJson(e)).toList();
          return insuranceProviderModel;
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