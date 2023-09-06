class BookingDetailsModel {
  int? success;
  Data? data;

  BookingDetailsModel({this.success, this.data});

  BookingDetailsModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  int? id;
  int? user;
  int? recepient;
  String? address;
  String? foruser;
  int? type;
  String? dateTime;
  int? promo;
  int? amount;
  int? paymentMethod;
  String? isBeneficiary;
  String? bStatus;
  int? status;
  int? isdeleted;
  String? addedat;
  String? updatedat;
  String? recepient_name;
  String? name;
  String? appointmentType;
  String? consultationType;
  Null? specialistCategory;
  String? cardDetails;
  int? bookedDoctor;
  List<Prescriptions>? prescriptions;

  Data(
      {this.id,
      this.user,
      this.recepient,
      this.address,
      this.foruser,
      this.type,
      this.dateTime,
      this.promo,
      this.amount,
      this.paymentMethod,
      this.isBeneficiary,
      this.bStatus,
      this.status,
      this.isdeleted,
      this.addedat,
      this.updatedat,
      this.recepient_name,
      this.name,
      this.appointmentType,
      this.consultationType,
      this.specialistCategory,
      this.cardDetails,
      this.bookedDoctor,
      this.prescriptions});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    user = json['user'];
    recepient = json['recepient'];
    address = json['address'];
    foruser = json['foruser'];
    type = json['type'];
    dateTime = json['date_time'];
    promo = json['promo'];
    amount = json['amount'];
    paymentMethod = json['payment_method'];
    isBeneficiary = json['is_beneficiary'];
    bStatus = json['b_status'];
    status = json['status'];
    isdeleted = json['isdeleted'];
    addedat = json['addedat'];
    updatedat = json['updatedat'];
    recepient_name = json['recepient_name'];
    name = json['name'];
    appointmentType = json['Appointment_Type'];
    consultationType = json['consultation_type'];
    specialistCategory = json['specialist_category'];
    cardDetails = json['card_details'];
    bookedDoctor = json['booked_doctor'];
    if (json['prescriptions'] != null) {
      prescriptions = <Prescriptions>[];
      json['prescriptions'].forEach((v) {
        prescriptions!.add(new Prescriptions.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['user'] = this.user;
    data['recepient'] = this.recepient;
    data['address'] = this.address;
    data['foruser'] = this.foruser;
    data['type'] = this.type;
    data['date_time'] = this.dateTime;
    data['promo'] = this.promo;
    data['amount'] = this.amount;
    data['payment_method'] = this.paymentMethod;
    data['is_beneficiary'] = this.isBeneficiary;
    data['b_status'] = this.bStatus;
    data['status'] = this.status;
    data['isdeleted'] = this.isdeleted;
    data['addedat'] = this.addedat;
    data['updatedat'] = this.updatedat;
    data['recepient_name'] = this.recepient_name;
    data['name'] = this.name;
    data['Appointment_Type'] = this.appointmentType;
    data['consultation_type'] = this.consultationType;
    data['specialist_category'] = this.specialistCategory;
    data['card_details'] = this.cardDetails;
    data['booked_doctor'] = this.bookedDoctor;
    if (this.prescriptions != null) {
      data['prescriptions'] =
          this.prescriptions!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Prescriptions {
  int? booking;
  String? prescriptions;
  String? medicines;
  int? user;

  Prescriptions({this.booking, this.prescriptions, this.medicines, this.user});

  Prescriptions.fromJson(Map<String, dynamic> json) {
    booking = json['booking'];
    prescriptions = json['prescriptions'];
    medicines = json['medicines'];
    user = json['user'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['booking'] = this.booking;
    data['prescriptions'] = this.prescriptions;
    data['medicines'] = this.medicines;
    data['user'] = this.user;
    return data;
  }
}
