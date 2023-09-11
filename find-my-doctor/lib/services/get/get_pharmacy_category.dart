import 'package:dio/dio.dart';
import 'package:find_my_doctor/model/Pharmacy/pharmacyCategoryModel.dart';
import 'package:find_my_doctor/modules/dio_service.dart';

class GetPharmacyCategory {
  var _dioService = DioService.getInstance();

  Future getpharmacyCategory() async {
    try {
      final response = await _dioService.get('categories',
        options: Options(
            headers: {
              'content-Type': 'application/json'
            }),
      );
      if(response.statusCode == 200){
          List historyData = response.data["data"];
          List<PharmacyCategoryModel> parmacyCategorysModel = historyData.map((e) => PharmacyCategoryModel.fromJson(e)).toList();
          return parmacyCategorysModel;
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