class UserBeneficiaries {
  int? success;
  List<Data>? data;

  UserBeneficiaries({this.success, this.data});

  UserBeneficiaries.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(new Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  int? id;
  String? fullname;
  String? relation;
  String? nick;
  String? gender;
  String? dob;
  String? phone;
  String? city;
  String? address;
  String? policyno;
  String? cnic;

  Data(
      {this.id,
        this.fullname,
        this.relation,
        this.nick,
        this.gender,
        this.dob,
        this.phone,
        this.city,
        this.address,
        this.policyno,
        this.cnic});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    fullname = json['fullname'];
    relation = json['relation'];
    nick = json['nick'];
    gender = json['gender'];
    dob = json['dob'];
    phone = json['phone'];
    city = json['city'];
    address = json['address'];
    policyno = json['policyno'];
    cnic = json['cnic'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['fullname'] = this.fullname;
    data['relation'] = this.relation;
    data['nick'] = this.nick;
    data['gender'] = this.gender;
    data['dob'] = this.dob;
    data['phone'] = this.phone;
    data['city'] = this.city;
    data['address'] = this.address;
    data['policyno'] = this.policyno;
    data['cnic'] = this.cnic;
    return data;
  }
}
