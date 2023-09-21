import 'package:shared_preferences/shared_preferences.dart';
import 'package:stacked/stacked.dart';

class PreferencesViewModel extends BaseViewModel {
  String? userToken;
  String? fcmToken;
  int? userID;
  String? userName;
  String? userEmail;
  String? userPhone;
  String? userAddress;
  String? userAge;
  String? userHeight;
  String? userWeight;
  String? prodId;
  int? count;

  Future saveProdID(String ProdID) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    await sharedPreferences.setString("ProdID", ProdID);
    prodId = ProdID;
    notifyListeners();
  }

  Future getProdID() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    prodId = await sharedPreferences.getString("ProdID");
    notifyListeners();
  }

  Future saveUserToken(String tokenValue) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    await sharedPreferences.setString("tokenValue", tokenValue);
    userToken = tokenValue;
    notifyListeners();
  }

  Future getUserToken() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    userToken = await sharedPreferences.getString("tokenValue");
    notifyListeners();
  }

  Future removeUserToken() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    await sharedPreferences.remove("tokenValue");
    notifyListeners();
  }

  Future saveFCMToken(String tokenValue) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    await sharedPreferences.setString("FCMtokenValue", tokenValue);
    fcmToken = tokenValue;
    notifyListeners();
  }

  Future getFCMToken() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    fcmToken = await sharedPreferences.getString("FCMtokenValue");
    notifyListeners();
  }

  Future saveUserID(int userID) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    await sharedPreferences.setInt("userID", userID);
    userID = userID;
    notifyListeners();
  }

  Future getUserID() async {
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

// user address
  Future saveUseraddress(String address) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    await sharedPreferences.setString("address", address);
    userAddress = address;
    notifyListeners();
  }

  Future getUserAddress() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    userAddress = await sharedPreferences.getString("address");
    notifyListeners();
  }

  Future removeUserAddress() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    await sharedPreferences.remove("address");
    userAddress = null;
    notifyListeners();
  }

  //age
  Future saveUserage(String age) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    await sharedPreferences.setString("age", age);
    userAge = age;
    notifyListeners();
  }

  Future getUserAge() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    userAge = await sharedPreferences.getString("age");
    notifyListeners();
  }

  Future removeUserAge() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    await sharedPreferences.remove("age");
    notifyListeners();
  }

  //height
  Future saveUserHeight(String height) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    await sharedPreferences.setString("height", height);
    userHeight = height;
    notifyListeners();
  }

  Future getUserHeight() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    userHeight = await sharedPreferences.getString("height");
    notifyListeners();
  }

  Future removeUserHeight() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    await sharedPreferences.remove("height");
    notifyListeners();
  }

  //weight
  Future saveUserWeight(String weight) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    await sharedPreferences.setString("weight", weight);
    userWeight = weight;
    notifyListeners();
  }

  Future getUserWeight() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    userWeight = await sharedPreferences.getString("weight");
    notifyListeners();
  }

  Future removeUserWeight() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    await sharedPreferences.remove("weight");
    notifyListeners();
  }
}
