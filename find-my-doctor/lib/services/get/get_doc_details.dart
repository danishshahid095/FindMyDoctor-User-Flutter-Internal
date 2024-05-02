import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';

import '../../model/Doctor/booking_details_model.dart';
import '../../modules/dio_service.dart';

class DocBookingDetails {
  var _dioService = DioService.getInstance();

  Future docbookingdetails(
    String token,
   String orderId
  ) async {
    try {
      final response = await _dioService.get(
        'appointments/doctor/details/$orderId',
        options: Options(headers: {
          HttpHeaders.authorizationHeader: 'Bearer $token',
          'content-Type': 'application/json'
        }),
      );
      var data = json.decode(response.toString());
      if (response.statusCode == 200) {
        // user found

        if (response.data["success"] == 1) {
          BookingDetailsModel docbook = BookingDetailsModel.fromJson(response.data);

          return docbook;
        } else {
          return response.data['data'];
        }
      } else {
        return response.statusMessage;
      }
    } catch (e) {
      print('API Exception: $e');
      // dynamic exception = e;
      // return exception.message;
    }
  }
}
