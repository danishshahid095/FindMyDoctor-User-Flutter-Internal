import 'package:dio/dio.dart';
import 'package:find_my_doctor/modules/dio_service.dart';
import '../../model/Doctor/specialistCategoryModel.dart';

class GetDoctorSpecilistCategory {
  var _dioService = DioService.getInstance();

  Future getDoctorSpecialist() async {
    try {
      final response = await _dioService.get('specialist-categories',
        options: Options(
            headers: {
              'content-Type': 'application/json'
            }),
      );
      if(response.statusCode == 200){
          List historyData = response.data["data"];
          List<SpecialistCategoryModel> specialistCategoryModel = historyData.map((e) => SpecialistCategoryModel.fromJson(e)).toList();
          return specialistCategoryModel;
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