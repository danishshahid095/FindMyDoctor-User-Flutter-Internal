import 'package:dio/dio.dart';
import 'package:find_my_doctor/modules/dio_service.dart';
import '../../model/Doctor/doctorTypeModel.dart';

class GetDoctorTypes {
  var _dioService = DioService.getInstance();

  Future getDoctorTypes() async {
    try {
      final response = await _dioService.get('doctor-types',
        options: Options(
            headers: {
              'content-Type': 'application/json'
            }),
      );
      if(response.statusCode == 200){
          List historyData = response.data["data"];
          List<DoctorTypeModel> doctorTypeModel = historyData.map((e) => DoctorTypeModel.fromJson(e)).toList();
          return doctorTypeModel;
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