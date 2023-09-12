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
  String? date_time;
  int? promo;
  int? amount;
  int? payment_method;
  String? is_beneficiary;
  String? b_status;
  int? status;
  int? isdeleted;
  String? addedat;
  String? updatedat;
  String? recepient_name;
  String? name;
  String? Appointment_Type;
  String? consultation_type;
  Null specialist_category;
  String? card_details;
  int? booked_doctor;
  List<Prescriptions>? prescriptions;

  Data(
      {this.id,
      this.user,
      this.recepient,
      this.address,
      this.foruser,
      this.type,
      this.date_time,
      this.promo,
      this.amount,
      this.payment_method,
      this.is_beneficiary,
      this.b_status,
      this.status,
      this.isdeleted,
      this.addedat,
      this.updatedat,
      this.recepient_name,
      this.name,
      this.Appointment_Type,
      this.consultation_type,
      this.specialist_category,
      this.card_details,
      this.booked_doctor,
      this.prescriptions});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    user = json['user'];
    recepient = json['recepient'];
    address = json['address'];
    foruser = json['foruser'];
    type = json['type'];
    date_time = json['date_time'];
    promo = json['promo'];
    amount = json['amount'];
    payment_method = json['payment_method'];
    is_beneficiary = json['is_beneficiary'];
    b_status = json['b_status'];
    status = json['status'];
    isdeleted = json['isdeleted'];
    addedat = json['addedat'];
    updatedat = json['updatedat'];
    recepient_name = json['recepient_name'];
    name = json['name'];
    Appointment_Type = json['Appointment_Type'];
    consultation_type = json['consultation_type'];
    specialist_category = json['specialist_category'];
    card_details = json['card_details'];
    booked_doctor = json['booked_doctor'];
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
    data['date_time'] = this.date_time;
    data['promo'] = this.promo;
    data['amount'] = this.amount;
    data['payment_method'] = this.payment_method;
    data['is_beneficiary'] = this.is_beneficiary;
    data['b_status'] = this.b_status;
    data['status'] = this.status;
    data['isdeleted'] = this.isdeleted;
    data['addedat'] = this.addedat;
    data['updatedat'] = this.updatedat;
    data['recepient_name'] = this.recepient_name;
    data['name'] = this.name;
    data['Appointment_Type'] = this.Appointment_Type;
    data['consultation_type'] = this.consultation_type;
    data['specialist_category'] = this.specialist_category;
    data['card_details'] = this.card_details;
    data['booked_doctor'] = this.booked_doctor;
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
