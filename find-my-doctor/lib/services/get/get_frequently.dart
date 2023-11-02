import 'package:dio/dio.dart';
import 'package:find_my_doctor/model/Pharmacy/pharmacyProductModel.dart';
import 'package:find_my_doctor/modules/dio_service.dart';

import '../../model/Pharmacy/pharmacyFrequwntlyModel.dart';

class GetFrequently {
  var _dioService = DioService.getInstance();

  Future getpharmacyfrequntly() async {
    try {
      final response = await _dioService.get('products/best',
        options: Options(
            headers: {
              'content-Type': 'application/json'
            }),
      );
      if(response.statusCode == 200){
          List historyData = response.data["data"];
          List<PharmacyFrequentlyModel> parmacyFrequntlyModel = historyData.map((e) => PharmacyFrequentlyModel.fromJson(e)).toList();
          return parmacyFrequntlyModel;
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