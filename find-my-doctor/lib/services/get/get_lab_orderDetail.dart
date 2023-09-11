import 'dart:io';
import 'package:dio/dio.dart';
import 'package:find_my_doctor/model/Lab/labBookingDetailModel.dart';
import 'package:find_my_doctor/modules/dio_service.dart';

class GetLabOrderDetail {
  var _dioService = DioService.getInstance();

  Future getLabOrderDetail(String token,int orderId) async {
    try {
      final response = await _dioService.get('booking-lab/my-booking-details/$orderId',
        options: Options(
            headers: {
              HttpHeaders.authorizationHeader:
              'Bearer $token',
              'content-Type': 'application/json'
            }),
      );
      if(response.statusCode == 200){
          List historyData = response.data["data"];
          List<LabBookingDetailModel> labBookingDetailModel = historyData.map((e) => LabBookingDetailModel.fromJson(e)).toList();
          return labBookingDetailModel;
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