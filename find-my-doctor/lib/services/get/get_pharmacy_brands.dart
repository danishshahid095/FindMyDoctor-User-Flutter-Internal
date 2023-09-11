import 'package:dio/dio.dart';
import 'package:find_my_doctor/model/Pharmacy/pharmacyBrandsModel.dart';
import 'package:find_my_doctor/modules/dio_service.dart';

class GetPharmacyBrands {
  var _dioService = DioService.getInstance();

  Future getpharmacyBrands() async {
    try {
      final response = await _dioService.get('brands',
        options: Options(
            headers: {
              'content-Type': 'application/json'
            }),
      );
      if(response.statusCode == 200){
          List historyData = response.data["data"];
          List<PharmacyBrandsModel> parmacyBrandsModel = historyData.map((e) => PharmacyBrandsModel.fromJson(e)).toList();
          return parmacyBrandsModel;
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