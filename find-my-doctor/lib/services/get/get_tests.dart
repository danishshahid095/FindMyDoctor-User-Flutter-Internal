import 'package:dio/dio.dart';
import 'package:find_my_doctor/model/Lab/testsModel.dart';
import 'package:find_my_doctor/modules/dio_service.dart';



class GetTests {
  var _dioService = DioService.getInstance();

  Future getTests(int labId) async {
    try {
      final response = await _dioService.get('lab/test/lab/$labId',
        queryParameters: {},
        options: Options(
            headers: {
              'content-Type': 'application/json'
            }),
      );
      if(response.statusCode == 200){
        List historyData = response.data["data"];
        List<TestsModel> testsModel = historyData.map((e) => TestsModel.fromJson(e)).toList();
        return testsModel;
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