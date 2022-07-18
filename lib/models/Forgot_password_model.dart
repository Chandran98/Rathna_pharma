// To parse this JSON data, do
//
//     final forgotpassmodel = forgotpassmodelFromJson(jsonString);

import 'dart:convert';

Forgotpassmodel forgotpassmodelFromJson(String str) => Forgotpassmodel.fromJson(json.decode(str));

String forgotpassmodelToJson(Forgotpassmodel data) => json.encode(data.toJson());

class Forgotpassmodel {
    Forgotpassmodel({
     this.status,
     this.otp,
     this.message
    });

    bool status;
    int otp;
    String message;

    factory Forgotpassmodel.fromJson(Map<String, dynamic> json) => Forgotpassmodel(
        status: json["status"],
        otp: json["otp"],
         message: json["message"],
    );

    Map<String, dynamic> toJson() => {
        "status": status,
        "otp": otp,
        "message": message,
    };
}
