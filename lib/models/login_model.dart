import 'dart:convert';

Loginmodel loginmodelFromJson(String str) =>
    Loginmodel.fromJson(json.decode(str));

String loginmodelToJson(Loginmodel data) => json.encode(data.toJson());

class Loginmodel {
  Loginmodel({
    this.status,
    this.message,
    this.customerId,
    this.customerEmail,
  });

  bool status;
  String message;
  String customerId;
  String customerEmail;

  factory Loginmodel.fromJson(Map<String, dynamic> json) => Loginmodel(
        status: json["status"],
        message: json["message"],
        customerId: json["customer_id"],
        customerEmail: json["customer_email"],
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "customer_id": customerId,
        "customer_email": customerEmail,
      };
}
