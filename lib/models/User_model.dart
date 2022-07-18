// ignore: file_names
import 'dart:convert';

Userprofilemodel userprofilemodelFromJson(String str) => Userprofilemodel.fromJson(json.decode(str));

String userprofilemodelToJson(Userprofilemodel data) => json.encode(data.toJson());

class Userprofilemodel {
    Userprofilemodel({
       this.noOfData,
       this.customerId,
       this.customerName,
       this.customerEmail,
       this.customerCity,
       this.customerStatus,
    });

    String noOfData;
    String customerId;
    String customerName;
    String customerEmail;
    String customerCity;
    String customerStatus;

    factory Userprofilemodel.fromJson(Map<String, dynamic> json) => Userprofilemodel(
        noOfData: json["no_of_data"],
        customerId: json["customer_id"],
        customerName: json["customer_name"],
        customerEmail: json["customer_email"],
        customerCity: json["customer_city"],
        customerStatus: json["customer_status"],
    );

    Map<String, dynamic> toJson() => {
        "no_of_data": noOfData,
        "customer_id": customerId,
        "customer_name": customerName,
        "customer_email": customerEmail,
        "customer_city": customerCity,
        "customer_status": customerStatus,
    };
}
