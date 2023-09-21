import 'dart:convert';
import 'dart:io';
import 'package:dio/dio.dart';
import '../../model/Pharmacy/product_details.dart';
import '../../modules/dio_service.dart';

class productDetails {
  var _dioService = DioService.getInstance();

  Future ProductDetail(String token, String Id) async {
    try {
      final response = await _dioService.get(
        'products/$Id',
        options: Options(headers: {
          HttpHeaders.authorizationHeader: 'Bearer $token',
          'content-Type': 'application/json'
        }),
      );
     // var data = json.decode(response.toString());
      if (response.statusCode == 200) {
        // user found

        if (response.data["success"] == 1) {
          ProductDetails productlist =
              ProductDetails.fromJson(response.data);
          print(productlist);
          return productlist;
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
