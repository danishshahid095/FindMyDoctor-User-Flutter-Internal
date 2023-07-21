import 'package:dio/dio.dart';
import 'package:find_my_doctor/model/Pharmacy/pharmacyCityModel.dart';
import 'package:find_my_doctor/modules/dio_service.dart';

class GetPharmacyCity {
  var _dioService = DioService.getInstance();

  Future getpharmacyCity() async {
    try {
      final response = await _dioService.get('cities',
        options: Options(
            headers: {
              'content-Type': 'application/json'
            }),
      );
      if(response.statusCode == 200){
          List historyData = response.data["data"];
          List<PharmacyCityModel> parmacyCityModel = historyData.map((e) => PharmacyCityModel.fromJson(e)).toList();
          return parmacyCityModel;
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