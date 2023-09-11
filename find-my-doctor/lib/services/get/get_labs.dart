import 'package:dio/dio.dart';
import 'package:find_my_doctor/modules/dio_service.dart';

import '../../model/Lab/labsModel.dart';

class GetLabs {
  var _dioService = DioService.getInstance();

  Future getLabs(int cityId) async {
    try {
      final response = await _dioService.get('labs/by-city/$cityId',
        queryParameters: {},
        options: Options(
            headers: {
              'content-Type': 'application/json'
            }),
      );
      if(response.statusCode == 200){
        List historyData = response.data["data"];
        List<LabsModel> labsModel = historyData.map((e) => LabsModel.fromJson(e)).toList();
        return labsModel;
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