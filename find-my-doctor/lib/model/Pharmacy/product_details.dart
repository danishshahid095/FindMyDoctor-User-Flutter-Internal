
class ProductDetails {
  int? success;
  Data? data;

  ProductDetails({this.success, this.data});

  ProductDetails.fromJson(Map<String, dynamic> json) {
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
  String? name;
  String? title;
  String? featured_img;
  String? brandName;
  String? catName;
  int? price;
  int? discountedPrice;
  String? description;
  int? quantity;
  String? weight;
  String? manufactureDate;
  String? expiryDate;
  String? tags;
  String? batchNumber;
  String? packageDelivery;
  String? suggestUse;
  String? ingredients;
  String? warning;
  String? dosage;
  int? activity;
  Null? rating;
  int? isFeatured;
  List<String>? reviews;

  Data(
      {this.id,
      this.name,
      this.title,
      this.featured_img,
      this.brandName,
      this.catName,
      this.price,
      this.discountedPrice,
      this.description,
      this.quantity,
      this.weight,
      this.manufactureDate,
      this.expiryDate,
      this.tags,
      this.batchNumber,
      this.packageDelivery,
      this.suggestUse,
      this.ingredients,
      this.warning,
      this.dosage,
      this.activity,
      this.rating,
      this.isFeatured,
      this.reviews});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    title = json['title'];
    featured_img = json['featured_img'];
    brandName = json['brand_name'];
    catName = json['cat_name'];
    price = json['price'];
    discountedPrice = json['discounted_price'];
    description = json['description'];
    quantity = json['quantity'];
    weight = json['weight'];
    manufactureDate = json['manufacture_date'];
    expiryDate = json['expiry_date'];
    tags = json['tags'];
    batchNumber = json['batch_number'];
    packageDelivery = json['package_delivery'];
    suggestUse = json['suggest_use'];
    ingredients = json['ingredients'];
    warning = json['warning'];
    dosage = json['dosage'];
    activity = json['activity'];
    rating = json['rating'];
    isFeatured = json['is_featured'];
    if (json['reviews'] != null) {
      reviews = List<String>.from(json['reviews']);
      // reviews = <Null>[];
      // json['reviews'].forEach((v) {
      //   reviews!.add(new Null.fromJson(v));
      //});
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['title'] = this.title;
    data['featured_img'] = this.featured_img;
    data['brand_name'] = this.brandName;
    data['cat_name'] = this.catName;
    data['price'] = this.price;
    data['discounted_price'] = this.discountedPrice;
    data['description'] = this.description;
    data['quantity'] = this.quantity;
    data['weight'] = this.weight;
    data['manufacture_date'] = this.manufactureDate;
    data['expiry_date'] = this.expiryDate;
    data['tags'] = this.tags;
    data['batch_number'] = this.batchNumber;
    data['package_delivery'] = this.packageDelivery;
    data['suggest_use'] = this.suggestUse;
    data['ingredients'] = this.ingredients;
    data['warning'] = this.warning;
    data['dosage'] = this.dosage;
    data['activity'] = this.activity;
    data['rating'] = this.rating;
    data['is_featured'] = this.isFeatured;
    // if (this.reviews != null) {
    //  // reviews = List<String>.from(json['reviews']);
    //   data['reviews'] = this.reviews!.map((v) => v.toJson()).toList();
    // }
    return data;
  }
}
