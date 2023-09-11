import 'package:dio/dio.dart';
import 'package:find_my_doctor/model/Doctor/onlineDoctorModel.dart';
import 'package:find_my_doctor/modules/dio_service.dart';

class GetOnlineDoctor {
  var _dioService = DioService.getInstance();

  Future getOnlineDoctor(int categoryId) async {
    try {
      final response = await _dioService.get('doctors/category/$categoryId',
        queryParameters: {},
        options: Options(
            headers: {
              'content-Type': 'application/json'
            }),
      );
      if(response.statusCode == 200){
        List historyData = response.data["data"];
        List<OnlineDoctorModel> onlineDoctorModel = historyData.map((e) => OnlineDoctorModel.fromJson(e)).toList();
        return onlineDoctorModel;
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