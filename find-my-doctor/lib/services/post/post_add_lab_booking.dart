import 'dart:convert';
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:find_my_doctor/modules/dio_service.dart';

class AddLabBooking {
  var _dioService = DioService.getInstance();

  Future addLabBooking(String token, int test_for, int recepient, int lab_id, String date_time, int promo, String beneficiary, List tests) async {
    var benficiaryJson = {
      "test_for": test_for,
      "recepient": recepient,
      "lab_id": lab_id.toString(),
      "date_time" : date_time,
      "promo" : promo,
      "type" : null,
      "payment_method": 2,
      "beneficiary" : beneficiary,
      "tests" : tests,
    };
    try {
      final response = await _dioService.post('booking-lab/create',
        options: Options(
            headers: {
              HttpHeaders.authorizationHeader:
              'Bearer $token',
              HttpHeaders.contentTypeHeader: "application/json",
            }),
        data: jsonEncode(benficiaryJson),
      );
      if(response.statusCode == 200){
        // user found
        if(response.data["success"] == 1){
          return response.data["success"];
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