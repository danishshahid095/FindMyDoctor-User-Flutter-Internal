import 'package:dio/dio.dart';
import 'package:find_my_doctor/model/Pharmacy/pharmacyProductModel.dart';
import 'package:find_my_doctor/modules/dio_service.dart';

class GetPharmacyBestSellers {
  var _dioService = DioService.getInstance();

  Future getpharmacyBestSellers() async {
    try {
      final response = await _dioService.get('products/by-best-brand/',
        options: Options(
            headers: {
              'content-Type': 'application/json'
            }),
      );
      if(response.statusCode == 200){
          List historyData = response.data["data"];
          List<PharmacyProductModel> parmacyBestSellerModel = historyData.map((e) => PharmacyProductModel.fromJson(e)).toList();
          return parmacyBestSellerModel;
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