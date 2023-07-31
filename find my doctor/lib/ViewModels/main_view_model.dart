import 'dart:async';
import 'package:find_my_doctor/UI/login.dart';
import 'package:find_my_doctor/UI/sign_in_options.dart';
import 'package:find_my_doctor/Utils/extensions.dart';
import 'package:find_my_doctor/Utils/image_utils.dart';
import 'package:find_my_doctor/ViewModels/prefrences_view_model.dart';
import 'package:find_my_doctor/model/Doctor/doctorTypeModel.dart';
import 'package:find_my_doctor/model/Doctor/onlineDoctorModel.dart';
import 'package:find_my_doctor/model/Doctor/specialistCategoryModel.dart';
import 'package:find_my_doctor/model/Lab/activeLabBookingModel.dart';
import 'package:find_my_doctor/model/Lab/labsModel.dart';
import 'package:find_my_doctor/model/Lab/testsModel.dart';
import 'package:find_my_doctor/model/Pharmacy/pharmacyBrandsModel.dart';
import 'package:find_my_doctor/model/Pharmacy/pharmacyCityModel.dart';
import 'package:find_my_doctor/model/Pharmacy/pharmacyProductModel.dart';
import 'package:find_my_doctor/services/get/get_doctor_specilist_category.dart';
import 'package:find_my_doctor/services/get/get_doctor_type.dart';
import 'package:find_my_doctor/services/get/get_lab_active_booking.dart';
import 'package:find_my_doctor/services/get/get_lab_orderDetail.dart';
import 'package:find_my_doctor/services/get/get_labs.dart';
import 'package:find_my_doctor/services/get/get_online_doctors.dart';
import 'package:find_my_doctor/services/get/get_pharmacy_bestsellers.dart';
import 'package:find_my_doctor/services/get/get_pharmacy_cities.dart';
import 'package:find_my_doctor/services/get/get_pharmacy_productsbycategory.dart';
import 'package:find_my_doctor/services/get/get_tests.dart';
import 'package:find_my_doctor/services/post/post_add_fcmToken.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:stacked/stacked.dart';
import 'package:find_my_doctor/modules/navigation_service.dart'
    as my_nav_service;

import '../App/locator.dart';
import '../Utils/font_utils.dart';
import '../Widgets/bottom_navigation_bar.dart';
import '../model/Lab/historyLabBookingModel.dart';
import '../model/Lab/labBookingDetailModel.dart';
import '../model/Pharmacy/pharmacyCategoryModel.dart';
import '../model/login/userLoginModel.dart';
import '../services/get/get_lab_history_booking.dart';
import '../services/get/get_pharmacy_brands.dart';
import '../services/get/get_pharmacy_category.dart';
import '../services/post/post_add_beneficiary.dart';
import '../services/post/post_add_email.dart';
import '../services/post/post_add_fullname.dart';
import '../services/post/post_add_phone_number.dart';
import '../services/post/post_login.dart';
import '../services/post/post_signup.dart';

class MainViewModel extends BaseViewModel {

  var navigationService = my_nav_service.NavigationService();
  bool loadingWidget = false;
  var prefService = locator<PreferencesViewModel>();
  String? token;
  String? fcmToken;
  int? userID;

  bool fromDoctorBook = false;
  bool fromLabTestBook = false;
  bool fromPharmacy = false;
  bool fromBuyInsurance = false;

  List FAQs = [
    {
      "question": "1. What services does FindMyDoctor offer?",
      "answer":
          "FindMyDoctor is a healthcare startup that aims to give consumers control over all aspects of their healthcare ecosystem. We currently offer Insurance Products, Lab Tests, Scheduled and Urgent Home Doctor Visits, and Pharmacy Delivery (in under 100 minutes). We are constantly innovating and increasing our service offering.",
    },
    {
      "question": "2. What services does FindMyDoctor offer?",
      "answer":
          "FindMyDoctor is a healthcare startup that aims to give consumers control over all aspects of their healthcare ecosystem. We currently offer Insurance Products, Lab Tests, Scheduled and Urgent Home Doctor Visits, and Pharmacy Delivery (in under 100 minutes). We are constantly innovating and increasing our service offering.",
    },
    {
      "question":
          "3. Are the iOS, Android and Web Versions of FindMyDoctor the same?",
      "answer":
          "FindMyDoctor is a healthcare startup that aims to give consumers control over all aspects of their healthcare ecosystem. We currently offer Insurance Products, Lab Tests, Scheduled and Urgent Home Doctor Visits, and Pharmacy Delivery (in under 100 minutes). We are constantly innovating and increasing our service offering.",
    },
    {
      "question":
          "4. I don’t own a smartphone. Can I still avail FindMyDoctor Services?",
      "answer":
          "FindMyDoctor is a healthcare startup that aims to give consumers control over all aspects of their healthcare ecosystem. We currently offer Insurance Products, Lab Tests, Scheduled and Urgent Home Doctor Visits, and Pharmacy Delivery (in under 100 minutes). We are constantly innovating and increasing our service offering.",
    },
    {
      "question": "5. Where can I avail FindMyDoctor services?",
      "answer":
          "FindMyDoctor is a healthcare startup that aims to give consumers control over all aspects of their healthcare ecosystem. We currently offer Insurance Products, Lab Tests, Scheduled and Urgent Home Doctor Visits, and Pharmacy Delivery (in under 100 minutes). We are constantly innovating and increasing our service offering.",
    },
    {
      "question": "6. Who are the medical professionals on FindMyDoctor?",
      "answer":
          "FindMyDoctor is a healthcare startup that aims to give consumers control over all aspects of their healthcare ecosystem. We currently offer Insurance Products, Lab Tests, Scheduled and Urgent Home Doctor Visits, and Pharmacy Delivery (in under 100 minutes). We are constantly innovating and increasing our service offering.",
    },
    {
      "question": "7. Where are Lab Tests conducted from?",
      "answer":
          "FindMyDoctor is a healthcare startup that aims to give consumers control over all aspects of their healthcare ecosystem. We currently offer Insurance Products, Lab Tests, Scheduled and Urgent Home Doctor Visits, and Pharmacy Delivery (in under 100 minutes). We are constantly innovating and increasing our service offering.",
    },
    {
      "question": "8. How long does it take to receive my Sehat Card?",
      "answer":
          "FindMyDoctor is a healthcare startup that aims to give consumers control over all aspects of their healthcare ecosystem. We currently offer Insurance Products, Lab Tests, Scheduled and Urgent Home Doctor Visits, and Pharmacy Delivery (in under 100 minutes). We are constantly innovating and increasing our service offering.",
    },
    {
      "question": "9. Where can I see my Lab Test Results?",
      "answer":
          "FindMyDoctor is a healthcare startup that aims to give consumers control over all aspects of their healthcare ecosystem. We currently offer Insurance Products, Lab Tests, Scheduled and Urgent Home Doctor Visits, and Pharmacy Delivery (in under 100 minutes). We are constantly innovating and increasing our service offering.",
    },
    {
      "question": "10. Where are Lab Tests conducted from?",
      "answer":
          "FindMyDoctor is a healthcare startup that aims to give consumers control over all aspects of their healthcare ecosystem. We currently offer Insurance Products, Lab Tests, Scheduled and Urgent Home Doctor Visits, and Pharmacy Delivery (in under 100 minutes). We are constantly innovating and increasing our service offering.",
    },
    {
      "question": "11. How long does it take to receive my Sehat Card?",
      "answer":
          "FindMyDoctor is a healthcare startup that aims to give consumers control over all aspects of their healthcare ecosystem. We currently offer Insurance Products, Lab Tests, Scheduled and Urgent Home Doctor Visits, and Pharmacy Delivery (in under 100 minutes). We are constantly innovating and increasing our service offering.",
    },
    {
      "question": "12. Where can I see my Lab Test Results?",
      "answer":
          "FindMyDoctor is a healthcare startup that aims to give consumers control over all aspects of their healthcare ecosystem. We currently offer Insurance Products, Lab Tests, Scheduled and Urgent Home Doctor Visits, and Pharmacy Delivery (in under 100 minutes). We are constantly innovating and increasing our service offering.",
    },
    {
      "question":
          "13. Can I order services for my family through the application?",
      "answer":
          "FindMyDoctor is a healthcare startup that aims to give consumers control over all aspects of their healthcare ecosystem. We currently offer Insurance Products, Lab Tests, Scheduled and Urgent Home Doctor Visits, and Pharmacy Delivery (in under 100 minutes). We are constantly innovating and increasing our service offering.",
    },
    {
      "question": "14. Does FindMyDoctor offer corporate solutions?",
      "answer":
          "FindMyDoctor is a healthcare startup that aims to give consumers control over all aspects of their healthcare ecosystem. We currently offer Insurance Products, Lab Tests, Scheduled and Urgent Home Doctor Visits, and Pharmacy Delivery (in under 100 minutes). We are constantly innovating and increasing our service offering.",
    },
    {
      "question": "15. How can I pay for FindMyDoctor’s services?",
      "answer":
          "FindMyDoctor is a healthcare startup that aims to give consumers control over all aspects of their healthcare ecosystem. We currently offer Insurance Products, Lab Tests, Scheduled and Urgent Home Doctor Visits, and Pharmacy Delivery (in under 100 minutes). We are constantly innovating and increasing our service offering.",
    },
    {
      "question": "16. What is the refund policy on FindMyDoctor?",
      "answer":
          "FindMyDoctor is a healthcare startup that aims to give consumers control over all aspects of their healthcare ecosystem. We currently offer Insurance Products, Lab Tests, Scheduled and Urgent Home Doctor Visits, and Pharmacy Delivery (in under 100 minutes). We are constantly innovating and increasing our service offering.",
    },
  ];
  List privacy_policy = [
    {
      "question": "1. Introduction",
      "answer":
          "FIND MY DOCTOR (Private) Limited (“FIND MY DOCTOR”, “we”, “us”, or “our”) operates (the Website) located at http://findmydoctor.pk and related mobile applications with links to this Privacy Policy (collectively, the “Application”). Through the Application, we operate an online service enabling patients (the “Patients”) to receive health services (the “Services”) from various healthcare providers (the “Providers”). We developed this privacy policy (the “Privacy Policy”) to explain how we collect, use, and disclose information from and/or about you when you use the Application or the Services. \n\nTHE APPLICATION WILL BE COLLECTING AND TRANSMITTING PERSONAL, MEDICAL AND HEALTH-RELATED INFORMATION ABOUT YOU. BY USING THE APPLICATION, YOU AGREE THAT WE CAN COLLECT AND USE YOUR PERSONAL AND OTHER INFORMATION AS DESCRIBED IN THIS PRIVACY POLICY. IF YOU DO NOT AGREE, PLEASE DO NOT USE THE SITE.",
    },
    {
      "question": "2. Important Definitions",
      "answer":
          "FIND MY DOCTOR (Private) Limited (“FIND MY DOCTOR”, “we”, “us”, or “our”) operates (the Website) located at http://findmydoctor.pk and related mobile applications with links to this Privacy Policy (collectively, the “Application”). Through the Application, we operate an online service enabling patients (the “Patients”) to receive health services (the “Services”) from various healthcare providers (the “Providers”). We developed this privacy policy (the “Privacy Policy”) to explain how we collect, use, and disclose information from and/or about you when you use the Application or the Services. \n\nTHE APPLICATION WILL BE COLLECTING AND TRANSMITTING PERSONAL, MEDICAL AND HEALTH-RELATED INFORMATION ABOUT YOU. BY USING THE APPLICATION, YOU AGREE THAT WE CAN COLLECT AND USE YOUR PERSONAL AND OTHER INFORMATION AS DESCRIBED IN THIS PRIVACY POLICY. IF YOU DO NOT AGREE, PLEASE DO NOT USE THE SITE.",
    },
    {
      "question": "3. Questions",
      "answer":
          "FIND MY DOCTOR (Private) Limited (“FIND MY DOCTOR”, “we”, “us”, or “our”) operates (the Website) located at http://findmydoctor.pk and related mobile applications with links to this Privacy Policy (collectively, the “Application”). Through the Application, we operate an online service enabling patients (the “Patients”) to receive health services (the “Services”) from various healthcare providers (the “Providers”). We developed this privacy policy (the “Privacy Policy”) to explain how we collect, use, and disclose information from and/or about you when you use the Application or the Services. \n\nTHE APPLICATION WILL BE COLLECTING AND TRANSMITTING PERSONAL, MEDICAL AND HEALTH-RELATED INFORMATION ABOUT YOU. BY USING THE APPLICATION, YOU AGREE THAT WE CAN COLLECT AND USE YOUR PERSONAL AND OTHER INFORMATION AS DESCRIBED IN THIS PRIVACY POLICY. IF YOU DO NOT AGREE, PLEASE DO NOT USE THE SITE.",
    },
    {
      "question": "4. Children Under Age 18",
      "answer":
          "FIND MY DOCTOR (Private) Limited (“FIND MY DOCTOR”, “we”, “us”, or “our”) operates (the Website) located at http://findmydoctor.pk and related mobile applications with links to this Privacy Policy (collectively, the “Application”). Through the Application, we operate an online service enabling patients (the “Patients”) to receive health services (the “Services”) from various healthcare providers (the “Providers”). We developed this privacy policy (the “Privacy Policy”) to explain how we collect, use, and disclose information from and/or about you when you use the Application or the Services. \n\nTHE APPLICATION WILL BE COLLECTING AND TRANSMITTING PERSONAL, MEDICAL AND HEALTH-RELATED INFORMATION ABOUT YOU. BY USING THE APPLICATION, YOU AGREE THAT WE CAN COLLECT AND USE YOUR PERSONAL AND OTHER INFORMATION AS DESCRIBED IN THIS PRIVACY POLICY. IF YOU DO NOT AGREE, PLEASE DO NOT USE THE SITE.",
    },
    {
      "question":
          "5. The Personal Information We Collect Or Maintain May Include:",
      "answer":
          "FIND MY DOCTOR (Private) Limited (“FIND MY DOCTOR”, “we”, “us”, or “our”) operates (the Website) located at http://findmydoctor.pk and related mobile applications with links to this Privacy Policy (collectively, the “Application”). Through the Application, we operate an online service enabling patients (the “Patients”) to receive health services (the “Services”) from various healthcare providers (the “Providers”). We developed this privacy policy (the “Privacy Policy”) to explain how we collect, use, and disclose information from and/or about you when you use the Application or the Services. \n\nTHE APPLICATION WILL BE COLLECTING AND TRANSMITTING PERSONAL, MEDICAL AND HEALTH-RELATED INFORMATION ABOUT YOU. BY USING THE APPLICATION, YOU AGREE THAT WE CAN COLLECT AND USE YOUR PERSONAL AND OTHER INFORMATION AS DESCRIBED IN THIS PRIVACY POLICY. IF YOU DO NOT AGREE, PLEASE DO NOT USE THE SITE.",
    },
    {
      "question": "6. Sensitive Permissions Requested By The Application",
      "answer":
          "FIND MY DOCTOR (Private) Limited (“FIND MY DOCTOR”, “we”, “us”, or “our”) operates (the Website) located at http://findmydoctor.pk and related mobile applications with links to this Privacy Policy (collectively, the “Application”). Through the Application, we operate an online service enabling patients (the “Patients”) to receive health services (the “Services”) from various healthcare providers (the “Providers”). We developed this privacy policy (the “Privacy Policy”) to explain how we collect, use, and disclose information from and/or about you when you use the Application or the Services. \n\nTHE APPLICATION WILL BE COLLECTING AND TRANSMITTING PERSONAL, MEDICAL AND HEALTH-RELATED INFORMATION ABOUT YOU. BY USING THE APPLICATION, YOU AGREE THAT WE CAN COLLECT AND USE YOUR PERSONAL AND OTHER INFORMATION AS DESCRIBED IN THIS PRIVACY POLICY. IF YOU DO NOT AGREE, PLEASE DO NOT USE THE SITE.",
    },
    {
      "question":
          "7. We May Use Your Personal Information For The Following Purposes (Subject To Applicable Legal Restrictions):",
      "answer":
          "FIND MY DOCTOR (Private) Limited (“FIND MY DOCTOR”, “we”, “us”, or “our”) operates (the Website) located at http://findmydoctor.pk and related mobile applications with links to this Privacy Policy (collectively, the “Application”). Through the Application, we operate an online service enabling patients (the “Patients”) to receive health services (the “Services”) from various healthcare providers (the “Providers”). We developed this privacy policy (the “Privacy Policy”) to explain how we collect, use, and disclose information from and/or about you when you use the Application or the Services. \n\nTHE APPLICATION WILL BE COLLECTING AND TRANSMITTING PERSONAL, MEDICAL AND HEALTH-RELATED INFORMATION ABOUT YOU. BY USING THE APPLICATION, YOU AGREE THAT WE CAN COLLECT AND USE YOUR PERSONAL AND OTHER INFORMATION AS DESCRIBED IN THIS PRIVACY POLICY. IF YOU DO NOT AGREE, PLEASE DO NOT USE THE SITE.",
    },
    {
      "question":
          "8. We May Also Disclose The Personal Information That We Collect Or You Provide (Subject To Applicable Legal Restrictions):",
      "answer":
          "FIND MY DOCTOR (Private) Limited (“FIND MY DOCTOR”, “we”, “us”, or “our”) operates (the Website) located at http://findmydoctor.pk and related mobile applications with links to this Privacy Policy (collectively, the “Application”). Through the Application, we operate an online service enabling patients (the “Patients”) to receive health services (the “Services”) from various healthcare providers (the “Providers”). We developed this privacy policy (the “Privacy Policy”) to explain how we collect, use, and disclose information from and/or about you when you use the Application or the Services. \n\nTHE APPLICATION WILL BE COLLECTING AND TRANSMITTING PERSONAL, MEDICAL AND HEALTH-RELATED INFORMATION ABOUT YOU. BY USING THE APPLICATION, YOU AGREE THAT WE CAN COLLECT AND USE YOUR PERSONAL AND OTHER INFORMATION AS DESCRIBED IN THIS PRIVACY POLICY. IF YOU DO NOT AGREE, PLEASE DO NOT USE THE SITE.",
    },
    {
      "question": "9. Information Collected Via Technology",
      "answer":
          "FIND MY DOCTOR (Private) Limited (“FIND MY DOCTOR”, “we”, “us”, or “our”) operates (the Website) located at http://findmydoctor.pk and related mobile applications with links to this Privacy Policy (collectively, the “Application”). Through the Application, we operate an online service enabling patients (the “Patients”) to receive health services (the “Services”) from various healthcare providers (the “Providers”). We developed this privacy policy (the “Privacy Policy”) to explain how we collect, use, and disclose information from and/or about you when you use the Application or the Services. \n\nTHE APPLICATION WILL BE COLLECTING AND TRANSMITTING PERSONAL, MEDICAL AND HEALTH-RELATED INFORMATION ABOUT YOU. BY USING THE APPLICATION, YOU AGREE THAT WE CAN COLLECT AND USE YOUR PERSONAL AND OTHER INFORMATION AS DESCRIBED IN THIS PRIVACY POLICY. IF YOU DO NOT AGREE, PLEASE DO NOT USE THE SITE.",
    },
    {
      "question": "10. De-Identified Information",
      "answer":
          "FIND MY DOCTOR (Private) Limited (“FIND MY DOCTOR”, “we”, “us”, or “our”) operates (the Website) located at http://findmydoctor.pk and related mobile applications with links to this Privacy Policy (collectively, the “Application”). Through the Application, we operate an online service enabling patients (the “Patients”) to receive health services (the “Services”) from various healthcare providers (the “Providers”). We developed this privacy policy (the “Privacy Policy”) to explain how we collect, use, and disclose information from and/or about you when you use the Application or the Services. \n\nTHE APPLICATION WILL BE COLLECTING AND TRANSMITTING PERSONAL, MEDICAL AND HEALTH-RELATED INFORMATION ABOUT YOU. BY USING THE APPLICATION, YOU AGREE THAT WE CAN COLLECT AND USE YOUR PERSONAL AND OTHER INFORMATION AS DESCRIBED IN THIS PRIVACY POLICY. IF YOU DO NOT AGREE, PLEASE DO NOT USE THE SITE.",
    },
    {
      "question": "11. Information You Share With Third Parties",
      "answer":
          "FIND MY DOCTOR (Private) Limited (“FIND MY DOCTOR”, “we”, “us”, or “our”) operates (the Website) located at http://findmydoctor.pk and related mobile applications with links to this Privacy Policy (collectively, the “Application”). Through the Application, we operate an online service enabling patients (the “Patients”) to receive health services (the “Services”) from various healthcare providers (the “Providers”). We developed this privacy policy (the “Privacy Policy”) to explain how we collect, use, and disclose information from and/or about you when you use the Application or the Services. \n\nTHE APPLICATION WILL BE COLLECTING AND TRANSMITTING PERSONAL, MEDICAL AND HEALTH-RELATED INFORMATION ABOUT YOU. BY USING THE APPLICATION, YOU AGREE THAT WE CAN COLLECT AND USE YOUR PERSONAL AND OTHER INFORMATION AS DESCRIBED IN THIS PRIVACY POLICY. IF YOU DO NOT AGREE, PLEASE DO NOT USE THE SITE.",
    },
    {
      "question": "12. Modification Of Information",
      "answer":
          "FIND MY DOCTOR (Private) Limited (“FIND MY DOCTOR”, “we”, “us”, or “our”) operates (the Website) located at http://findmydoctor.pk and related mobile applications with links to this Privacy Policy (collectively, the “Application”). Through the Application, we operate an online service enabling patients (the “Patients”) to receive health services (the “Services”) from various healthcare providers (the “Providers”). We developed this privacy policy (the “Privacy Policy”) to explain how we collect, use, and disclose information from and/or about you when you use the Application or the Services. \n\nTHE APPLICATION WILL BE COLLECTING AND TRANSMITTING PERSONAL, MEDICAL AND HEALTH-RELATED INFORMATION ABOUT YOU. BY USING THE APPLICATION, YOU AGREE THAT WE CAN COLLECT AND USE YOUR PERSONAL AND OTHER INFORMATION AS DESCRIBED IN THIS PRIVACY POLICY. IF YOU DO NOT AGREE, PLEASE DO NOT USE THE SITE.",
    },
    {
      "question": "13. Limitations On Deletion Of Information",
      "answer":
          "FIND MY DOCTOR (Private) Limited (“FIND MY DOCTOR”, “we”, “us”, or “our”) operates (the Website) located at http://findmydoctor.pk and related mobile applications with links to this Privacy Policy (collectively, the “Application”). Through the Application, we operate an online service enabling patients (the “Patients”) to receive health services (the “Services”) from various healthcare providers (the “Providers”). We developed this privacy policy (the “Privacy Policy”) to explain how we collect, use, and disclose information from and/or about you when you use the Application or the Services. \n\nTHE APPLICATION WILL BE COLLECTING AND TRANSMITTING PERSONAL, MEDICAL AND HEALTH-RELATED INFORMATION ABOUT YOU. BY USING THE APPLICATION, YOU AGREE THAT WE CAN COLLECT AND USE YOUR PERSONAL AND OTHER INFORMATION AS DESCRIBED IN THIS PRIVACY POLICY. IF YOU DO NOT AGREE, PLEASE DO NOT USE THE SITE.",
    },
    {
      "question": "14. Steps We Take To Keep Your Information Secure",
      "answer":
          "FIND MY DOCTOR (Private) Limited (“FIND MY DOCTOR”, “we”, “us”, or “our”) operates (the Website) located at http://findmydoctor.pk and related mobile applications with links to this Privacy Policy (collectively, the “Application”). Through the Application, we operate an online service enabling patients (the “Patients”) to receive health services (the “Services”) from various healthcare providers (the “Providers”). We developed this privacy policy (the “Privacy Policy”) to explain how we collect, use, and disclose information from and/or about you when you use the Application or the Services. \n\nTHE APPLICATION WILL BE COLLECTING AND TRANSMITTING PERSONAL, MEDICAL AND HEALTH-RELATED INFORMATION ABOUT YOU. BY USING THE APPLICATION, YOU AGREE THAT WE CAN COLLECT AND USE YOUR PERSONAL AND OTHER INFORMATION AS DESCRIBED IN THIS PRIVACY POLICY. IF YOU DO NOT AGREE, PLEASE DO NOT USE THE SITE.",
    },
    {
      "question": "15. Report Violations",
      "answer":
          "FIND MY DOCTOR (Private) Limited (“FIND MY DOCTOR”, “we”, “us”, or “our”) operates (the Website) located at http://findmydoctor.pk and related mobile applications with links to this Privacy Policy (collectively, the “Application”). Through the Application, we operate an online service enabling patients (the “Patients”) to receive health services (the “Services”) from various healthcare providers (the “Providers”). We developed this privacy policy (the “Privacy Policy”) to explain how we collect, use, and disclose information from and/or about you when you use the Application or the Services. \n\nTHE APPLICATION WILL BE COLLECTING AND TRANSMITTING PERSONAL, MEDICAL AND HEALTH-RELATED INFORMATION ABOUT YOU. BY USING THE APPLICATION, YOU AGREE THAT WE CAN COLLECT AND USE YOUR PERSONAL AND OTHER INFORMATION AS DESCRIBED IN THIS PRIVACY POLICY. IF YOU DO NOT AGREE, PLEASE DO NOT USE THE SITE.",
    },
    {
      "question": "16. Changes To This Privacy Policy",
      "answer":
          "FIND MY DOCTOR (Private) Limited (“FIND MY DOCTOR”, “we”, “us”, or “our”) operates (the Website) located at http://findmydoctor.pk and related mobile applications with links to this Privacy Policy (collectively, the “Application”). Through the Application, we operate an online service enabling patients (the “Patients”) to receive health services (the “Services”) from various healthcare providers (the “Providers”). We developed this privacy policy (the “Privacy Policy”) to explain how we collect, use, and disclose information from and/or about you when you use the Application or the Services. \n\nTHE APPLICATION WILL BE COLLECTING AND TRANSMITTING PERSONAL, MEDICAL AND HEALTH-RELATED INFORMATION ABOUT YOU. BY USING THE APPLICATION, YOU AGREE THAT WE CAN COLLECT AND USE YOUR PERSONAL AND OTHER INFORMATION AS DESCRIBED IN THIS PRIVACY POLICY. IF YOU DO NOT AGREE, PLEASE DO NOT USE THE SITE.",
    },
  ];

  // ################################################  EXTRA ##############################################################

  TextEditingController forgotPasswordController = TextEditingController();

  // Navigate From Splash Screen
  void goToScreen(BuildContext context) async {
    await prefService.getUserToken();
    token = prefService.userToken;
    await prefService.getFCMToken();
    fcmToken = prefService.fcmToken;
    await prefService.getUserID();
    userID = prefService.userID;

    if (token != null) {}
    Timer(
      Duration(seconds: 3),
      () => Navigator.pushReplacement(
          context,
          PageTransition(
              type: PageTransitionType.fade,
              child: token == null ? SignInOptions() : MyBottomNavBar())),
    );
  }

  // On LogOut
  void onLogout() async {
    await prefService.removeUserToken();
    navigationService.navigateToUntil(to: SignInOptions());
  }

  //######################################################################## Sign Up Screen ###############################################################################//
/////////////////////////////////////////////////////////////////////////     Starts    ///////////////////////////////////////////////////////////////////////////////////

  TextEditingController signupNameController = TextEditingController();
  TextEditingController signupEmailController = TextEditingController();
  TextEditingController signupPasswordController = TextEditingController();
  TextEditingController signupConfirmPasswordController =
      TextEditingController();
  TextEditingController signupPhoneController = TextEditingController();

  var userSignup = UserSignUp();

  Future doUserSignup(BuildContext context, String name, String email,
      String phone, String password, String confirmPassword) async {
    if (signupNameController.text.isEmpty) {
      showErrorMessage(context, "Please Enter Name");
      //gotPhoneOtp = false;
      notifyListeners();
    } else if (signupEmailController.text.isEmpty) {
      showErrorMessage(context, "Please Enter Email");
      //gotPhoneOtp = false;
      notifyListeners();
    } else if (signupPasswordController.text.isEmpty) {
      showErrorMessage(context, "Please Enter Password");
      //gotPhoneOtp = false;
      notifyListeners();
    } else if (signupConfirmPasswordController.text.isEmpty) {
      showErrorMessage(context, "Please Enter Confirm Password");
      //gotPhoneOtp = false;
      notifyListeners();
    } else if (signupPhoneController.text.isEmpty) {
      showErrorMessage(context, "Please Enter Phone Number");
      //gotPhoneOtp = false;
      notifyListeners();
    } else if (signupPasswordController.text !=
        signupConfirmPasswordController.text) {
      showErrorMessage(context, "Passwords don't match");
      //gotPhoneOtp = false;
      notifyListeners();
    } else {
      loadingWidget = true;
      notifyListeners();
      var signupResponse = await userSignup.signup(
          signupNameController.text.toString(),
          signupEmailController.text.toString(),
          signupPasswordController.text.toString(),
          signupPhoneController.text.toString());
      loadingWidget = false;
      notifyListeners();
      Navigator.push(context,
          PageTransition(type: PageTransitionType.fade, child: Login()));
    }
  }

  //######################################################################## Sign Up Screen ###############################################################################//
/////////////////////////////////////////////////////////////////////////     Ends    ///////////////////////////////////////////////////////////////////////////////////

//######################################################################## Login Screen ###############################################################################//
/////////////////////////////////////////////////////////////////////////     Starts    ///////////////////////////////////////////////////////////////////////////////////

  TextEditingController loginEmailController = TextEditingController();
  TextEditingController loginPasswordController = TextEditingController();
  var getLogin = UserLoginGet();
  bool rememberMe = true;

  Future doUserLogin(
      BuildContext context, String userId, String password) async {
    if (loginEmailController.text.isEmpty) {
      showErrorMessage(context, "Please Enter Email");
    } else if (loginPasswordController.text.isEmpty) {
      showErrorMessage(context, "Please Enter Password");
    } else {
      loadingWidget = true;
      notifyListeners();
      var response = await getLogin.loginUser(userId, password);
      if (response != null && response is UserLoginModel) {
        token = response.token!;
        prefService.saveUserToken(token!);
        userID = response.data!.id;
        prefService.saveUserID(userID!);

        // // Getting User Details
        // var userDetailsResponse = await getUserDetails.getUserDetails(token!);
        // if(userDetailsResponse is UserDetailsModel){
        //   userDetailsModel = userDetailsResponse;
        //   accountNameController.text = userDetailsModel.name ?? "";
        //   notifyListeners();
        //
        // }
        loadingWidget = false;
        navigationService.navigateToUntil(to: MyBottomNavBar());
      } else {
        showErrorMessage(context, "Something Went Wrong");
      }
    }
    loadingWidget = false;
    notifyListeners();
  }

  //######################################################################## Login Screen ###############################################################################//
/////////////////////////////////////////////////////////////////////////     Ends    ///////////////////////////////////////////////////////////////////////////////////

  //######################################################################## Add Beneficiary Screen ###############################################################################//
/////////////////////////////////////////////////////////////////////////     Starts    ///////////////////////////////////////////////////////////////////////////////////

  TextEditingController newBeneficiaryNameController = TextEditingController();
  TextEditingController newBeneficiaryGenderController =
      TextEditingController();
  TextEditingController newBeneficiaryDOBController = TextEditingController();
  TextEditingController newBeneficiaryRelationController =
      TextEditingController();
  TextEditingController newBeneficiaryNumberController =
      TextEditingController();
  TextEditingController newBeneficiaryCityController = TextEditingController();
  TextEditingController newBeneficiaryAddressController =
      TextEditingController();
  TextEditingController newBeneficiaryPolicyNumberController =
      TextEditingController();
  TextEditingController newBeneficiaryNickController = TextEditingController();

  var addBeneficiary = AddBeneficiary();

  Future doAddBenficiary(
      BuildContext context,
      String fullname,
      String gender,
      String dob,
      String relation,
      String number,
      String city,
      String address,
      String policyNumber,
      String nick) async {
    if (newBeneficiaryNameController.text.isEmpty) {
      showErrorMessage(context, "Please Enter Name");
      //gotPhoneOtp = false;
      notifyListeners();
    } else if (newBeneficiaryGenderController.text.isEmpty) {
      showErrorMessage(context, "Please Enter Gender");
      //gotPhoneOtp = false;
      notifyListeners();
    } else if (newBeneficiaryDOBController.text.isEmpty) {
      showErrorMessage(context, "Please Enter Date Of Birth");
      //gotPhoneOtp = false;
      notifyListeners();
    } else if (newBeneficiaryRelationController.text.isEmpty) {
      showErrorMessage(context, "Please Enter Relation");
      //gotPhoneOtp = false;
      notifyListeners();
    } else if (newBeneficiaryNumberController.text.isEmpty) {
      showErrorMessage(context, "Please Enter Phone Number");
      //gotPhoneOtp = false;
      notifyListeners();
    } else if (newBeneficiaryCityController.text.isEmpty) {
      showErrorMessage(context, "Please Select City");
      //gotPhoneOtp = false;
      notifyListeners();
    } else if (newBeneficiaryAddressController.text.isEmpty) {
      showErrorMessage(context, "Please Enter Address");
      //gotPhoneOtp = false;
      notifyListeners();
    } else {
      loadingWidget = true;
      notifyListeners();
      var newBeneficiaryResponse = await addBeneficiary.addBeneficiary(
        token!,
        newBeneficiaryNameController.text.toString(),
        newBeneficiaryGenderController.text.toString(),
        newBeneficiaryDOBController.text.toString(),
        newBeneficiaryRelationController.text.toString(),
        newBeneficiaryNumberController.text.toString(),
        newBeneficiaryCityController.text.toString(),
        newBeneficiaryAddressController.text.toString(),
        newBeneficiaryPolicyNumberController.text.toString(),
        newBeneficiaryNickController.text.toString(),
      );
      loadingWidget = false;
      notifyListeners();
      Navigator.pop(context);
    }
  }

  //######################################################################## Add Beneficiary Screen ###############################################################################//
/////////////////////////////////////////////////////////////////////////     Ends    ///////////////////////////////////////////////////////////////////////////////////

  //######################################################################## Home Screen ###############################################################################//
/////////////////////////////////////////////////////////////////////////    Starts    ///////////////////////////////////////////////////////////////////////////////////
  List services = [
    {
      "serviceImage": ImageUtils.stetescope,
      "serviceName": "Book a Doctor",
    },
    {
      "serviceImage": ImageUtils.tablets,
      "serviceName": "Shop from Pharmacy",
    },
    {
      "serviceImage": ImageUtils.testInjection,
      "serviceName": "Book a Test",
    },
    {
      "serviceImage": ImageUtils.handWithHeart,
      "serviceName": "Buy Insurance",
    }
  ];

  //list of lab
  List Labs = [
    {
      "serviceImage": ImageUtils.HashmanisLab,
      //"serviceName" : "Book a Doctor",
    },
    {
      "serviceImage": ImageUtils.hormnelab,
      // "serviceName" : "Shop from Pharmacy",
    },
    {
      "serviceImage": ImageUtils.onehealthlab,
      // "serviceName" : "Book a Test",
    },
    {
      "serviceImage": ImageUtils.karachilab,
      // "serviceName" : "Buy Insurance",
    },
    {
      "serviceImage": ImageUtils.minhajlab,
      // "serviceName" : "Buy Insurance",
    },
    {
      "serviceImage": ImageUtils.nationallab,
      // "serviceName" : "Buy Insurance",
    }
  ];

  List blogs = [
    {
      "blogImage": ImageUtils.stomachPain,
      "blogName": "What is Diarrhea?",
      "details": "15th Feb 2022 | 7 min read"
    },
    {
      "blogImage": ImageUtils.obesity,
      "blogName": "What is Obesity?",
      "details": "7th Jan 2022 | 12 min read"
    }
  ];

  List selectConsultationType = [
    {
      "image": ImageUtils.smilingDoctor,
      "name": "Physical Checkup",
      "description": "Get the best medical help at your door step",
    },
    {
      "image": ImageUtils.deliveryGuy,
      "name": "Online Consultation",
      "description": "Connect with the best doctors from all over the country",
    },
  ];


  List selectCitySindh = [
    "Karachi",
    "Hyderabad",
  ];

  List selectCityPunjab = [
    "Lahore",
    "Taxila",
  ];

  // Pharmacy

  List pharmacyCategory = [
    {
      "image": ImageUtils.tablets,
      "text": "Category 1",
    },
    {
      "image": ImageUtils.tablets,
      "text": "Category 2",
    },
    {
      "image": ImageUtils.tablets,
      "text": "Category 3",
    },
  ];

  List pharmacyBestSeller = [
    {
      "image": ImageUtils.panadol,
      "name": "Panadol ",
      "quantity": "100gm x 96 tabs",
      "price": "PKR. 750",
      "originalprice": "PKR. 750",
    },
    {
      "image": ImageUtils.calpol,
      "name": "Calpol Syrup ",
      "quantity": "100ml x 1 bottle",
      "price": "PKR. 120",
      "originalprice": "PKR. 150",
    },
  ];

  List pharmacyFrequentlyBought = [
    {
      "image": ImageUtils.calpol,
      "name": "Calpol Syrup ",
      "quantity": "100ml x 1 bottle",
      "price": "PKR. 120",
      "originalprice": "PKR. 150",
    },
    {
      "image": ImageUtils.panadol,
      "name": "Panadol ",
      "quantity": "100gm x 96 tabs",
      "price": "PKR. 750",
      "originalprice": "PKR. 750",
    },
  ];
  List pharmacyFrequentlyBought1 = [
    // {
    //   "image": ImageUtils.calpol,
    //   "name": "Calpol Syrup ",
    //   "quantity": "100ml x 1 bottle",
    //   "price": "PKR. 120",
    //   "originalprice": "PKR. 150",
    // },
    {
      "image": ImageUtils.panadol,
      "name": "Panadol ",
      "quantity": "100gm x 96 tabs",
      "price": "PKR. 750",
      "originalprice": "PKR. 750",
    },
  ];

  List brands = [
    ImageUtils.ferezsons,
    ImageUtils.getz_pharma,
    ImageUtils.gsk,
  ];

  List allBrands = [
    ImageUtils.ferezsons,
    ImageUtils.getz_pharma,
    ImageUtils.gsk,
    ImageUtils.atco
  ];

  List allCategories = [
    "Category 1",
    "Category 2",
    "Category 3",
    "Category 4",
  ];

  // Insurance
  List allInsurance = [
    {
      "image": ImageUtils.insuranceContainer,
      "title": "Insurance Market Place",
      "description": "Exploratory description regarding the service.",
    },
    {
      "image": ImageUtils.insuranceContainer,
      "title": "Roshan Digital Account",
      "description": "Exploratory description regarding the service.",
    },
    {
      "image": ImageUtils.insuranceContainer,
      "title": "Sehat Card",
      "description": "Exploratory description regarding the service.",
    },
  ];

  List insuranceSelectProvide = [
    {
      "image": ImageUtils.insuranceContainer,
      "title": "Provider 1",
      "description": "Insurance",
    },
    {
      "image": ImageUtils.insuranceContainer,
      "title": "Provider 2",
      "description": "Insurance",
    },
    {
      "image": ImageUtils.insuranceContainer,
      "title": "Provider 3",
      "description": "Insurance",
    },
    {
      "image": ImageUtils.insuranceContainer,
      "title": "Provider 4",
      "description": "Insurance",
    },
    {
      "image": ImageUtils.insuranceContainer,
      "title": "Provider 5",
      "description": "Insurance",
    },
  ];

  List insuranceSelectPlan = [
    {
      "individualType": "Individual Plan",
      "person": "1 Person",
      "pkr": "PKR. 50,000/Annual",
    },
    {
      "individualType": "Basic Plan",
      "person": "Self + Spouse",
      "pkr": "PKR. 100,000/Annual",
    },
    {
      "individualType": "Standard Plan",
      "person": "Self + Spouse + 2 Children",
      "pkr": "PKR. 200,000/Annual",
    },
    {
      "individualType": "Premium Plan",
      "person": "Self + Spouse + 2 Children + Parents",
      "pkr": "PKR. 300,000/Annual",
    }
  ];

  List insuranceMembers = [
    {
      "relation": "Ammi",
      "name": "Tooba Akhtar",
    },
    {
      "relation": "Abbu",
      "name": "Akhtar Khalid",
    },
  ];

  List providerType = ["All", "Insurance", "Takaful"];

  bool? memberSelected = false;
  bool? insurancePaymentMethodSelected = false;
  bool? pharmacyPaymentMethodSelected = false;
  bool? physicalVisitPaymentMethodSelected = false;

  List paymentType = [
    ImageUtils.cash,
    ImageUtils.masterPayment,
    ImageUtils.applePay,
  ];

  // Lab Test
  List selectedTestsList = [
    {
      "testLabImage": ImageUtils.aghaKhan,
      "name": "Test ABC",
      "labDetails": "AKUH Lab | 36 hours",
      "charges": "Rs. 1,700"
    },
    {
      "testLabImage": ImageUtils.aghaKhan,
      "name": "Test JKL",
      "labDetails": "AKUH Lab | 10 hours",
      "charges": "Rs. 2,100"
    },
  ];

  bool labPaySelected = false;

  // Physical Visit
  List physicalVisitPaymentType = [
    ImageUtils.cash,
    ImageUtils.masterPayment,
    ImageUtils.applePay,
  ];

  List doctorDetails = [
    {
      "image": ImageUtils.doctor,
      "name": "Dr. Azeem Esaq",
      "description": "M.B.B.S | 10Years Experience",
      "fees": "Rs. 1,500"
    },
    {
      "image": ImageUtils.doctor,
      "name": "Dr. M.Mawis Anees",
      "description": "M.B.B.S | 9Years Experience",
      "fees": "Rs. 1,700"
    },
    {
      "image": ImageUtils.doctor,
      "name": "Dr. Nusrat Banu",
      "description": "M.B.B.S | 9Years Experience",
      "fees": "Rs. 1,100"
    },
  ];

  List sortDoctors = [
    "Experience: High to Low",
    "Experience: Low to High",
    "Price: Low to High",
    "Price: High to Low",
  ];

//######################################################################## Home Screen ###############################################################################//
/////////////////////////////////////////////////////////////////////////    Ends    ///////////////////////////////////////////////////////////////////////////////////

  //######################################################################## Helpline ###############################################################################//
/////////////////////////////////////////////////////////////////////////    Starts    ///////////////////////////////////////////////////////////////////////////////////

  //######################################################################## Helpline ###############################################################################//
/////////////////////////////////////////////////////////////////////////    Ends    ///////////////////////////////////////////////////////////////////////////////////

//######################################################################## Bookings ###############################################################################//
/////////////////////////////////////////////////////////////////////////    Starts    ///////////////////////////////////////////////////////////////////////////////////

  List activeBookings = [
    {
      "date": "Friday - 16 July 2022",
      "orderType": "General Physician",
      "patient": "Patient: Farah Hussain",
      "amount": "Rs. 1,500"
    },
    {
      "date": "Friday - 16 July 2022",
      "orderType": "Pharmacy Order",
      "patient": "Patient: Tooba Akhtar ",
      "amount": "Rs. 2,530"
    },
    /*{
      "date" : "Monday - 10 July 2022",
      "orderType" : "General Physician",
      "patient" : "Patient: Hussain Akhtar",
      "amount" : "Rs. 1,500"
    },
    {
      "date" : "Monday - 10 July 2022",
      "orderType" : "Lab Test",
      "patient" : "Patient: Hussain Akhtar",
      "amount" : "Rs. 5,720"
    },*/
  ];

  List bookingHistory = [
    {
      "orderType": "General Physician",
      "patient": "Patient: Farah Hussain",
      "amount": "Rs. 1,500"
    },
    {
      "orderType": "General Physician",
      "patient": "Patient: Hussain Akhtar",
      "amount": "Rs. 1,500"
    },
  ];

//######################################################################## Bookings ###############################################################################//
/////////////////////////////////////////////////////////////////////////    End    ///////////////////////////////////////////////////////////////////////////////////


//######################################################################## Doctor Specialist Category ###############################################################################//
/////////////////////////////////////////////////////////////////////////     Starts    ///////////////////////////////////////////////////////////////////////////////////

  GetDoctorSpecilistCategory getDoctorSpecilistCategory = GetDoctorSpecilistCategory();
  List<SpecialistCategoryModel>? specialistCategoryModel = SpecialistCategoryCompleteModel().data;
  bool specialistCatLoader = false;

  Future getSpecialistCategory(BuildContext context) async{

    specialistCatLoader = true;

    var specialistCategoryResponse = await getDoctorSpecilistCategory.getDoctorSpecialist();
    if (specialistCategoryResponse != null && specialistCategoryResponse is List<SpecialistCategoryModel>) {
      specialistCategoryModel = specialistCategoryResponse;
      specialistCatLoader = false;
      notifyListeners();
    }
    else{
      specialistCatLoader = false;
      notifyListeners();
    }
    specialistCatLoader = false;
  }

//######################################################################## Doctor Specialist Category ###############################################################################//
/////////////////////////////////////////////////////////////////////////     Ends    ///////////////////////////////////////////////////////////////////////////////////

  //######################################################################## Doctor Types ###############################################################################//
/////////////////////////////////////////////////////////////////////////     Starts    ///////////////////////////////////////////////////////////////////////////////////

  GetDoctorTypes getDoctorTypes = GetDoctorTypes();
  List<DoctorTypeModel>? doctorTypeModel = DoctorTypeCompleteModel().data;
  bool doctorTypeCatLoader = false;

  Future gettingDoctorTypes(BuildContext context) async{

    doctorTypeCatLoader = true;

    var doctorTypeResponse = await getDoctorTypes.getDoctorTypes();
    if (doctorTypeResponse != null && doctorTypeResponse is List<DoctorTypeModel>) {
      doctorTypeModel = doctorTypeResponse;
      doctorTypeCatLoader = false;
      notifyListeners();
    }
    else{
      doctorTypeCatLoader = false;
      notifyListeners();
    }
    doctorTypeCatLoader = false;
  }

//######################################################################## Doctor Types ###############################################################################//
/////////////////////////////////////////////////////////////////////////     Ends    ///////////////////////////////////////////////////////////////////////////////////


  //######################################################################## Online Doctor Names ###############################################################################//
/////////////////////////////////////////////////////////////////////////     Starts    ///////////////////////////////////////////////////////////////////////////////////

  GetOnlineDoctor getOnlineDoctor = GetOnlineDoctor();
  List<OnlineDoctorModel>? onlineDoctorModel = OnlineDoctorCompleteModel().data;
  bool onlineDoctorLoader = false;

  Future getOnlineDoctorDetails(BuildContext context, int categoryId) async{

    onlineDoctorLoader = true;

    var onlineDoctorResponse = await getOnlineDoctor.getOnlineDoctor(categoryId);
    if (onlineDoctorResponse != null && onlineDoctorResponse is List<OnlineDoctorModel>) {
      onlineDoctorModel = onlineDoctorResponse;
      onlineDoctorLoader = false;
      notifyListeners();
    }
    else{
      onlineDoctorLoader = false;
      notifyListeners();
    }
    onlineDoctorLoader = false;
  }

//######################################################################## Doctor Specialist Category ###############################################################################//
/////////////////////////////////////////////////////////////////////////     Ends    ///////////////////////////////////////////////////////////////////////////////////


  //######################################################################## Pharmacy Brands ###############################################################################//
/////////////////////////////////////////////////////////////////////////     Starts    ///////////////////////////////////////////////////////////////////////////////////

  GetPharmacyBrands getPharmacyBrands = GetPharmacyBrands();
  List<PharmacyBrandsModel>? pharmacyBrandsModel = PharmacyBrandsCompleteModel().data;
  bool pharmacyBrandsLoader = false;

  Future gettingPharmacyBrands(BuildContext context) async{

    pharmacyBrandsLoader = true;

    var pharmacyBrandsResponse = await getPharmacyBrands.getpharmacyBrands();
    if (pharmacyBrandsResponse != null && pharmacyBrandsResponse is List<PharmacyBrandsModel>) {
      pharmacyBrandsModel = pharmacyBrandsResponse;
      pharmacyBrandsLoader = false;
      notifyListeners();
    }
    else{
      pharmacyBrandsLoader = false;
      notifyListeners();
    }
    pharmacyBrandsLoader = false;
  }

//######################################################################## Pharmacy Brands ###############################################################################//
/////////////////////////////////////////////////////////////////////////     Ends    ///////////////////////////////////////////////////////////////////////////////////



  //######################################################################## Pharmacy Categories ###############################################################################//
/////////////////////////////////////////////////////////////////////////     Starts    ///////////////////////////////////////////////////////////////////////////////////

  GetPharmacyCategory getPharmacyCategory = GetPharmacyCategory();
  List<PharmacyCategoryModel>? pharmacyCategoryModel = PharmacyCategoryCompleteModel().data;
  bool pharmacyCategoryLoader = false;

  Future gettingPharmacyCategory(BuildContext context) async{

    pharmacyCategoryLoader = true;

    var pharmacyCategoryResponse = await getPharmacyCategory.getpharmacyCategory();
    if (pharmacyCategoryResponse != null && pharmacyCategoryResponse is List<PharmacyCategoryModel>) {
      pharmacyCategoryModel = pharmacyCategoryResponse;
      pharmacyCategoryLoader = false;
      notifyListeners();
    }
    else{
      pharmacyCategoryLoader = false;
      notifyListeners();
    }
    pharmacyCategoryLoader = false;
  }

//######################################################################## Pharmacy Categories ###############################################################################//
/////////////////////////////////////////////////////////////////////////     Ends    ///////////////////////////////////////////////////////////////////////////////////

  //######################################################################## Pharmacy Best Seller ###############################################################################//
/////////////////////////////////////////////////////////////////////////     Starts    ///////////////////////////////////////////////////////////////////////////////////

  GetPharmacyBestSellers getPharmacyBestSeller = GetPharmacyBestSellers();
  List<PharmacyProductModel>? pharmacyBestSellerModel = PharmacyProductCompleteModel().data;
  bool pharmacyBestSellerLoader = false;

  Future gettingPharmacyBestSellers(BuildContext context) async{

    pharmacyBestSellerLoader = true;

    var pharmacyProductResponse = await getPharmacyBestSeller.getpharmacyBestSellers();
    if (pharmacyProductResponse != null && pharmacyProductResponse is List<PharmacyProductModel>) {
      pharmacyBestSellerModel = pharmacyProductResponse;
      pharmacyBestSellerLoader = false;
      notifyListeners();
    }
    else{
      pharmacyBestSellerLoader = false;
      notifyListeners();
    }
    pharmacyBestSellerLoader = false;
  }

//######################################################################## Pharmacy Best Seller ###############################################################################//
/////////////////////////////////////////////////////////////////////////     Ends    ///////////////////////////////////////////////////////////////////////////////////

  //######################################################################## Pharmacy Product By Category ###############################################################################//
/////////////////////////////////////////////////////////////////////////     Starts    ///////////////////////////////////////////////////////////////////////////////////

  GetPharmacyProductByCategory getPharmacyProductByCategory = GetPharmacyProductByCategory();
  List<PharmacyProductModel>? pharmacyProductByCategoryModel = PharmacyProductCompleteModel().data;
  bool pharmacyProductByCategoryLoader = false;

  Future gettingPharmacyProductByCategory(BuildContext context, int categoryId) async{

    pharmacyProductByCategoryLoader = true;

    var pharmacyProductResponse = await getPharmacyProductByCategory.getpharmacyProductByCategory( categoryId);
    if (pharmacyProductResponse != null && pharmacyProductResponse is List<PharmacyProductModel>) {
      pharmacyProductByCategoryModel = pharmacyProductResponse;
      pharmacyProductByCategoryLoader = false;
      notifyListeners();
    }
    else{
      pharmacyProductByCategoryLoader = false;
      notifyListeners();
    }
    pharmacyProductByCategoryLoader = false;
  }

//######################################################################## Pharmacy Product By Category ###############################################################################//
/////////////////////////////////////////////////////////////////////////     Ends    ///////////////////////////////////////////////////////////////////////////////////

  //######################################################################## Pharmacy Product By Category ###############################################################################//
/////////////////////////////////////////////////////////////////////////     Starts    ///////////////////////////////////////////////////////////////////////////////////

  GetPharmacyCity getPharmacyCity = GetPharmacyCity();
  List<PharmacyCityModel>? pharmacyCityModel = PharmacyCityCompleteModel().data;
  bool pharmacyCityLoader = false;

  Future gettingPharmacyCity(BuildContext context) async{

    pharmacyCityLoader = true;

    var pharmacyCityResponse = await getPharmacyCity.getpharmacyCity();
    if (pharmacyCityResponse != null && pharmacyCityResponse is List<PharmacyCityModel>) {
      pharmacyCityModel = pharmacyCityResponse;
      pharmacyCityLoader = false;
      notifyListeners();
    }
    else{
      pharmacyCityLoader = false;
      notifyListeners();
    }
    pharmacyCityLoader = false;
  }

//######################################################################## Pharmacy Product By Category ###############################################################################//
/////////////////////////////////////////////////////////////////////////     Ends    ///////////////////////////////////////////////////////////////////////////////////

  //######################################################################## Labs List ###############################################################################//
/////////////////////////////////////////////////////////////////////////     Starts    ///////////////////////////////////////////////////////////////////////////////////

  GetLabs getLabs = GetLabs();
  List<LabsModel>? labsModel = LabsCompleteModel().data;
  bool labsLoader = false;

  Future gettingLabs(BuildContext context, int cityId) async{

    labsLoader = true;

    var labsResponse = await getLabs.getLabs(cityId);
    if (labsResponse != null && labsResponse is List<LabsModel>) {
      labsModel = labsResponse;
      labsLoader = false;
      notifyListeners();
    }
    else{
      labsLoader = false;
      notifyListeners();
    }
    labsLoader = false;
  }

//######################################################################## Labs List ###############################################################################//
/////////////////////////////////////////////////////////////////////////     Ends    ///////////////////////////////////////////////////////////////////////////////////

  //######################################################################## Tests List ###############################################################################//
/////////////////////////////////////////////////////////////////////////     Starts    ///////////////////////////////////////////////////////////////////////////////////

  GetTests getTests = GetTests();
  List<TestsModel>? testsModel = TestsCompleteModel().data;
  bool testsLoader = false;

  Future gettingTests(BuildContext context, int labId) async{

    testsLoader = true;

    var testsResponse = await getTests.getTests(labId);
    if (testsResponse != null && testsResponse is List<TestsModel>) {
      testsModel = testsResponse;
      testsLoader = false;
      notifyListeners();
    }
    else{
      testsLoader = false;
      notifyListeners();
    }
    testsLoader = false;
  }

//######################################################################## Tests List ###############################################################################//
/////////////////////////////////////////////////////////////////////////     Ends    ///////////////////////////////////////////////////////////////////////////////////

  //######################################################################## Lab Active Booking ###############################################################################//
/////////////////////////////////////////////////////////////////////////     Starts    ///////////////////////////////////////////////////////////////////////////////////

  GetLabActiveBooking getLabActiveBooking = GetLabActiveBooking();
  List<ActiveLabBookingModel>? activeLabBookingModel = ActiveLabBookingCompleteModel().data;
  bool activeLabBookingLoader = false;

  Future gettingActiveLabBooking(BuildContext context, String token) async{

    activeLabBookingLoader = true;

    var activeLabBookingResponse = await getLabActiveBooking.getlabActiveBooking(token);
    if (activeLabBookingResponse != null && activeLabBookingResponse is List<ActiveLabBookingModel>) {
      activeLabBookingModel = activeLabBookingResponse;
      activeLabBookingLoader = false;
      notifyListeners();
    }
    else{
      activeLabBookingLoader = false;
      notifyListeners();
    }
    activeLabBookingLoader = false;
  }

//######################################################################## Lab Active Booking  ###############################################################################//
/////////////////////////////////////////////////////////////////////////     Ends    ///////////////////////////////////////////////////////////////////////////////////

  //######################################################################## Lab History Booking ###############################################################################//
/////////////////////////////////////////////////////////////////////////     Starts    ///////////////////////////////////////////////////////////////////////////////////

  GetLabHistoryBooking getLabHistoryBooking = GetLabHistoryBooking();
  List<HistoryLabBookingModel>? historyLabBookingModel = HistoryLabBookingCompleteModel().data;
  bool historyLabBookingLoader = false;

  Future gettingHistoryLabBooking(BuildContext context , String token) async{

    historyLabBookingLoader = true;

    var historyLabBookingResponse = await getLabHistoryBooking.getlabHistoryBooking(token);
    if (historyLabBookingResponse != null && historyLabBookingResponse is List<HistoryLabBookingModel>) {
      historyLabBookingModel = historyLabBookingResponse;
      historyLabBookingLoader = false;
      notifyListeners();
    }
    else{
      historyLabBookingLoader = false;
      notifyListeners();
    }
    historyLabBookingLoader = false;
  }

//######################################################################## Lab History Booking  ###############################################################################//
/////////////////////////////////////////////////////////////////////////     Ends    ///////////////////////////////////////////////////////////////////////////////////

  //######################################################################## Lab History Booking ###############################################################################//
/////////////////////////////////////////////////////////////////////////     Starts    ///////////////////////////////////////////////////////////////////////////////////

  GetLabOrderDetail getLabOrderDetail = GetLabOrderDetail();
  LabBookingDetailModel? labBookingDetailModel = LabBookingDetailCompleteModel().data;
  bool labBookingDetailLoader = false;

  Future gettingLabBookingDetail(BuildContext context , String token, int orderID) async{

    labBookingDetailLoader = true;

    var labBookingDetailResponse = await getLabOrderDetail.getLabOrderDetail(token,orderID);
    if (labBookingDetailResponse != null && labBookingDetailResponse is LabBookingDetailModel) {
      labBookingDetailModel = labBookingDetailResponse;
      labBookingDetailLoader = false;
      notifyListeners();
    }
    else{
      labBookingDetailLoader = false;
      notifyListeners();
    }
    labBookingDetailLoader = false;
  }

//######################################################################## Lab History Booking  ###############################################################################//
/////////////////////////////////////////////////////////////////////////     Ends    ///////////////////////////////////////////////////////////////////////////////////


  //######################################################################## Upload FCM Token ###############################################################################//
/////////////////////////////////////////////////////////////////////////     Starts    ///////////////////////////////////////////////////////////////////////////////////

  var addFCM = AddFcmToken();

  Future uploadFCM(
      BuildContext context, String token, String fcmToken, int userId) async {
      loadingWidget = true;
      notifyListeners();
      var response = await addFCM.addFcmToken(token,fcmToken,userId);
    loadingWidget = false;
    notifyListeners();
  }

  //######################################################################## Upload FCM Token ###############################################################################//
/////////////////////////////////////////////////////////////////////////     Ends    ///////////////////////////////////////////////////////////////////////////////////

  // Show Error Message
  void showErrorMessage(BuildContext context, String error) async {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text(
        error,
        textAlign: TextAlign.center,
        style: TextStyle(
          color: Colors.white,
          fontFamily: FontUtils.poppinsBold,
          fontSize: 1.8.t,
        ),
      ),
      backgroundColor: Colors.red,
      padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 2.h),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
            topRight: Radius.circular(20), topLeft: Radius.circular(20)),
      ),
      elevation: 10,
      duration: Duration(seconds: 2),
    ));
  }
}
