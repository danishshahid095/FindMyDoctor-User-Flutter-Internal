
import 'package:shared_preferences/shared_preferences.dart';
import 'package:stacked/stacked.dart';

class PreferencesViewModel extends BaseViewModel{

  String? userToken;
  String? fcmToken;
  int? userID;

  Future saveUserToken(String tokenValue) async{
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    await sharedPreferences.setString("tokenValue", tokenValue);
    userToken = tokenValue;
    notifyListeners();
  }
  Future getUserToken() async{
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    userToken = await sharedPreferences.getString("tokenValue");
    notifyListeners();
  }

  Future removeUserToken() async{
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    await sharedPreferences.remove("tokenValue");
    notifyListeners();
  }

  Future saveFCMToken(String tokenValue) async{
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    await sharedPreferences.setString("FCMtokenValue", tokenValue);
    fcmToken = tokenValue;
    notifyListeners();
  }
  Future getFCMToken() async{
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    fcmToken = await sharedPreferences.getString("FCMtokenValue");
    notifyListeners();
  }

  Future saveUserID(int userID) async{
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    await sharedPreferences.setInt("userID", userID);
    userID = userID;
    notifyListeners();
  }
  Future getUserID() async{
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    userID = await sharedPreferences.getInt("userID");
    notifyListeners();
  }
}