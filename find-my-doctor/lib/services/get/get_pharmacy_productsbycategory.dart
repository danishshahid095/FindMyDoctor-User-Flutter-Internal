import 'package:dio/dio.dart';
import 'package:find_my_doctor/model/Pharmacy/pharmacyProductModel.dart';
import 'package:find_my_doctor/modules/dio_service.dart';

class GetPharmacyProductByCategory {
  var _dioService = DioService.getInstance();

  Future getpharmacyProductByCategory(int categoryId) async {
    try {
      final response = await _dioService.get('products/category/$categoryId',
        options: Options(
            headers: {
              'content-Type': 'application/json'
            }),
      );
      if(response.statusCode == 200){
          List historyData = response.data["data"];
          List<PharmacyProductModel> pharmacyProductByCategoryModel = historyData.map((e) => PharmacyProductModel.fromJson(e)).toList();
          return pharmacyProductByCategoryModel;
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