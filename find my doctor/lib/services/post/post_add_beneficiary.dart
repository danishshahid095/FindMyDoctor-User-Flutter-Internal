import 'dart:convert';
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:find_my_doctor/modules/dio_service.dart';

class AddBeneficiary {
  var _dioService = DioService.getInstance();

  Future addBeneficiary(String token, String fullname, String gender, String dob, String relation, String number, String city, String address, String policyNumber, String nick) async {
    var benficiaryJson = {
      "fullname": fullname,
      "relation": relation,
      "nick": nick,
      "gender" : gender,
      "dob" : dob,
      "phone" : number,
      "city" : city,
      "address" : address,
      "policyno" : policyNumber,
      "cnic" : ""
    };
    try {
      final response = await _dioService.post('beneficiaries/create-beneficiaries',
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
        if(response.data["status"] == 1){
          return;
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