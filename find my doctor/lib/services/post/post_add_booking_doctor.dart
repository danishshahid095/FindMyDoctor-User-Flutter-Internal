import 'dart:convert';
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:find_my_doctor/modules/dio_service.dart';

class AddBookingDoctor {
  var _dioService = DioService.getInstance();

  Future addBookingDoc(String token, int foruser, int recepient,String is_beneficiary, int type, String date_time, int promo,  int payment_method ,String consultation_type, String booked_doctor) async {
    var bookingdocJson = {
      "foruser": foruser,
      "recepient": recepient.toString(),
      "is_beneficiary":is_beneficiary,
      "date_time" : date_time,
      "promo" : promo,
      "payment_method":payment_method,
      "type" : null,
      "consultation_type" : consultation_type,
      "booked_doctor" : null,
    };
    try {
      final response = await _dioService.post('booking-doctor/create',
        options: Options(
            headers: {
              HttpHeaders.authorizationHeader:
              'Bearer $token',
              HttpHeaders.contentTypeHeader: "application/json",
            }),
        data: jsonEncode(bookingdocJson),
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