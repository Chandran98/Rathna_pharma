// To parse this JSON data, do
//
//     final userprofile = userprofileFromJson(jsonString);

import 'dart:convert';

Userprofile userprofileFromJson(String str) =>
    Userprofile.fromJson(json.decode(str));

String userprofileToJson(Userprofile data) => json.encode(data.toJson());

class Userprofile {
  Userprofile({
    this.customerGetById,
  });

  List<CustomerGetById> customerGetById;

  factory Userprofile.fromJson(Map<String, dynamic> json) => Userprofile(
        customerGetById: List<CustomerGetById>.from(
            json["customer_getById"].map((x) => CustomerGetById.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "customer_getById":
            List<dynamic>.from(customerGetById.map((x) => x.toJson())),
      };
}

class CustomerGetById {
  CustomerGetById({
    this.noOfData,
    this.customerId,
    this.customerName,
    this.customerEmail,
    this.customerCity,
    this.customerStatus,
    this.gstNo,
  });

  String noOfData;
  String customerId;
  String customerName;
  String customerEmail;
  String customerCity;
  String customerStatus;
  String gstNo;

  factory CustomerGetById.fromJson(Map<String, dynamic> json) =>
      CustomerGetById(
        noOfData: json["no_of_data"],
        customerId: json["customer_id"],
        customerName: json["customer_name"],
        customerEmail: json["customer_email"],
        customerCity: json["customer_city"],
        customerStatus: json["customer_status"],
        gstNo: json["GST_NO"],
      );

  Map<String, dynamic> toJson() => {
        "no_of_data": noOfData,
        "customer_id": customerId,
        "customer_name": customerName,
        "customer_email": customerEmail,
        "customer_city": customerCity,
        "customer_status": customerStatus,
        "GST_NO": gstNo,
      };
}
