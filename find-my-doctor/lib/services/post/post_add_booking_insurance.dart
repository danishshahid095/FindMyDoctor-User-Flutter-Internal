import 'dart:convert';
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:find_my_doctor/modules/dio_service.dart';

class AddBookingInsurance {
  var _dioService = DioService.getInstance();

  Future addBookingInsurance(
      String token,
      int insurance_for,
      int recepient,
      String address,
      String date_time,
      int amount,
      int payment_method,
      int plan,
      String beneficiary,) async {
    var bookingdocJson = {
      "insurance_for": insurance_for,
      "recepient": recepient,
      "address": address,
      "date_time": date_time,
      "amount": amount,
      "payment_method": payment_method,
      "plan": plan,
      "beneficiary": beneficiary,
    };
    try {
      final response = await _dioService.post(
        'booking-insurance/create',
        options: Options(headers: {
          HttpHeaders.authorizationHeader: 'Bearer $token',
          HttpHeaders.contentTypeHeader: "application/json",
        }),
        data: jsonEncode(bookingdocJson),
      );
      if (response.statusCode == 200) {
        // user found
        if (response.data["success"] == 1) {
          return;
        } else {
          return response.data['data'];
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
