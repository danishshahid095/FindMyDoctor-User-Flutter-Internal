
import 'package:shared_preferences/shared_preferences.dart';
import 'package:stacked/stacked.dart';

class PreferencesViewModel extends BaseViewModel{

  String? userToken;
  String? fcmToken;
  int? userID;
  String? userName;
  String? userEmail;
  String? userPhone;

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

  Future saveUserName(String fullname) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    await sharedPreferences.setString("fullname", fullname);
    userName = fullname;
    notifyListeners();
  }

  Future getUserName() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    userName = await sharedPreferences.getString("fullname");
    notifyListeners();
  }

  Future removeUserName() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    await sharedPreferences.remove("fullname");
    notifyListeners();
  }
   //user email

  Future saveUserEmail(String email) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    await sharedPreferences.setString("email", email);
    userEmail = email;
    notifyListeners();
  }

  Future getUserEmail() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    userEmail = await sharedPreferences.getString("email");
    notifyListeners();
  }

  Future removeUserEmail() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    await sharedPreferences.remove("email");
    notifyListeners();
  }
   //user phone

  Future saveUserPhone(String phone) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    await sharedPreferences.setString("phone", phone);
    userPhone = phone;
    notifyListeners();
  }

  Future getUserPhone() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    userPhone = await sharedPreferences.getString("phone");
    notifyListeners();
  }

  Future removeUserPhone() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    await sharedPreferences.remove("phone");
    notifyListeners();
  }

}