import 'dart:convert';
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:find_my_doctor/modules/dio_service.dart';

class AddBookingPharmacy {
  var _dioService = DioService.getInstance();

  Future addBookingPharmacy(
      String token,
      int med_for,
      int recepient,
      String date_time,
      int promo,
      int payment_method,
      String beneficiary,
      String address,
      List<Map<String?, dynamic>> med) async {
    var bookingdocJson = {
      "med_for": med_for,
      "recepient": recepient,
      "date_time": date_time,
      "promo": promo,
      "payment_method": payment_method,
      "beneficiary": beneficiary,
      "address" : address,
      "med": med
    };
    try {
      final response = await _dioService.post(
        'booking-pharmacy/create',
        options: Options(headers: {
          HttpHeaders.authorizationHeader: 'Bearer $token',
          HttpHeaders.contentTypeHeader: "application/json",
        }),
        data: jsonEncode(bookingdocJson),
      );
      if (response.statusCode == 200) {
        // user found
        print("ResponseCheck1: " + response.data['success'].toString());
        if (response.data['success'] == 1) {
          return  response.data;
        } else {
          return response.data;
        }
      } else {
        return response.statusMessage;
      }
    } catch (e) {
      dynamic exception = e;
      print("Pharmacy Error: " +  exception.message);
      return exception.message;
    }
  }
}
