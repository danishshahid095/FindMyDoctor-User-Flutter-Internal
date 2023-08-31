import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';

import '../../model/Lab/get_labs_details_model.dart';
import '../../modules/dio_service.dart';

class LabBookingDetails {
  var _dioService = DioService.getInstance();

  Future labbookingdetails(
    String token,
  ) async {
    try {
      final response = await _dioService.get(
        'booking-lab/my-booking-details/146',
        options: Options(headers: {
          HttpHeaders.authorizationHeader: 'Bearer $token',
          'content-Type': 'application/json'
        }),
       
      );
      var data = json.decode(response.toString());
      if (response.statusCode == 200) {
        // user found
         
        if (response.data["success"] == 1) {
          LabModel labbook =LabModel.fromJson( response.data);

          return labbook;
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
