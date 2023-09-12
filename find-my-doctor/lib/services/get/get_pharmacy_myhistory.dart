import 'dart:io';
import 'package:dio/dio.dart';
import 'package:find_my_doctor/modules/dio_service.dart';
import '../../model/Pharmacy/pharmacyMyHistoryModel.dart';

class GetPharmacyMyHistory {
  var _dioService = DioService.getInstance();

  Future getpharmacyMyHistory(String token) async {
    try {
      final response = await _dioService.get(
        'appointments/pharmacy/my-history',
        options: Options(headers: {
          HttpHeaders.authorizationHeader: 'Bearer $token',
          'content-Type': 'application/json'
        }),
      );
      print('this is my respone ${response}');
      if (response.statusCode == 200) {
        // user found
        print(response.statusCode);
        print(response.data);
        if (response.data["success"] == 11) {
          List newdata = response.data['data'];
         // print('my data ${newdata}');
          List<PharmacyHistoryModel> pharmacymyhistoryModel =
              newdata.map((e) => PharmacyHistoryModel.fromJson(e)).toList();
          //print('this is model dat ${doctormyactiveModel}');
          return pharmacymyhistoryModel;
        } else {
          return response.data['message'];
        }
      } else {
        return response.statusMessage;
      }
      
    } catch (e) {
      dynamic exception = e;
      print(e);
      return exception.message;
    }
  }
}
