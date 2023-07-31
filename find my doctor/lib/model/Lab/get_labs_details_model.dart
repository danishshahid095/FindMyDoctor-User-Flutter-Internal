class LabModel {
  int? success;
  Data? data;

  LabModel({this.success, this.data});

  LabModel.fromJson(Map<String, dynamic> json) {
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
  int? amount;
  int? status;
  String? name;
  String? phone;
  String? address;
  int? paymentMethod;
  String? isBeneficiary;
  String? dateTime;
  String? bStatus;
  List<Tests>? tests;

  Data(
      {this.id,
      this.amount,
      this.status,
      this.name,
      this.phone,
      this.address,
      this.paymentMethod,
      this.isBeneficiary,
      this.dateTime,
      this.bStatus,
      this.tests});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    amount = json['amount'];
    status = json['status'];
    name = json['name'];
    phone = json['phone'];
    address = json['address'];
    paymentMethod = json['payment_method'];
    isBeneficiary = json['is_beneficiary'];
    dateTime = json['date_time'];
    bStatus = json['b_status'];
    if (json['tests'] != null) {
      tests = <Tests>[];
      json['tests'].forEach((v) {
        tests!.add(new Tests.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['amount'] = this.amount;
    data['status'] = this.status;
    data['name'] = this.name;
    data['phone'] = this.phone;
    data['address'] = this.address;
    data['payment_method'] = this.paymentMethod;
    data['is_beneficiary'] = this.isBeneficiary;
    data['date_time'] = this.dateTime;
    data['b_status'] = this.bStatus;
    if (this.tests != null) {
      data['tests'] = this.tests!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Tests {
  int? id;
  int? booking;
  String? testName;
  int? testId;
  int? testPrice;
  String? labName;
  int? labId;
  String? testReport;

  Tests(
      {this.id,
      this.booking,
      this.testName,
      this.testId,
      this.testPrice,
      this.labName,
      this.labId,
      this.testReport});

  Tests.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    booking = json['booking'];
    testName = json['test_name'];
    testId = json['test_id'];
    testPrice = json['test_price'];
    labName = json['lab_name'];
    labId = json['lab_id'];
    testReport = json['test_report'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['booking'] = this.booking;
    data['test_name'] = this.testName;
    data['test_id'] = this.testId;
    data['test_price'] = this.testPrice;
    data['lab_name'] = this.labName;
    data['lab_id'] = this.labId;
    data['test_report'] = this.testReport;
    return data;
  }
}
