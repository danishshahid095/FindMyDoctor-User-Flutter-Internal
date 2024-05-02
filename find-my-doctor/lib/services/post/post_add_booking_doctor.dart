import 'dart:convert';
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:find_my_doctor/modules/dio_service.dart';

import '../../model/Doctor/booking_doc_model.dart';

class AddBookingDoctor {
  var _dioService = DioService.getInstance();

  Future addBookingDoc(
      String token,
      int foruser,
      String recepient,
      String is_beneficiary,
      int type,
      String date_time,
      String promo,
      int payment_method,
      String consultation_type,
      String booked_doctor) async {
    var bookingdocJson = {
      "foruser": foruser,
      "recepient": recepient,
      "is_beneficiary": is_beneficiary,
      "type": type,
      "date_time": date_time,
      "promo": promo,
      "payment_method": payment_method,
      "consultation_type": consultation_type,
      "booked_doctor": booked_doctor,
    };
    try {
      final response = await _dioService.post(
        'booking-doctor/create',
        options: Options(headers: {
          HttpHeaders.authorizationHeader: 'Bearer $token',
          HttpHeaders.contentTypeHeader: "application/json",
        }),
        data: jsonEncode(bookingdocJson),
      );
      if (response.statusCode == 200) {
        // user found
        if (response.data["success"] == 1) {
          BookingDocModel bookDocResponse = BookingDocModel.fromJson(response.data);
          
          return bookDocResponse;
          
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
