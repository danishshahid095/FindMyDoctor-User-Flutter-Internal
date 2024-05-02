import 'dart:io';
import 'package:dio/dio.dart';
import 'package:find_my_doctor/modules/dio_service.dart';
import '../../model/Insurance/insurancePackageModel.dart';

class GetInsurancePlans {
  var _dioService = DioService.getInstance();

  Future getInsurancePackage(String token, int providerId) async {
    try {
      final response = await _dioService.get('insurance-plans/get-by-provider/$providerId',
        options: Options(
            headers: {
              HttpHeaders.authorizationHeader:
              'Bearer $token',
              'content-Type': 'application/json'
            }),
      );
      print(response.statusCode);
      if(response.statusCode == 200){
          List historyData = response.data["data"];
          List<InsurancePackageModel> insurancePackageModel = historyData.map((e) => InsurancePackageModel.fromJson(e)).toList();
          return insurancePackageModel;
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