// To parse this JSON data, do
//
//     final queryresponse = queryresponseFromJson(jsonString);

import 'dart:convert';

Queryresponse queryresponseFromJson(String str) =>
    Queryresponse.fromJson(json.decode(str));

String queryresponseToJson(Queryresponse data) => json.encode(data.toJson());

class Queryresponse {
  Queryresponse({
    this.message,
    // this.error,
  });

  String message;
  // bool error;

  factory Queryresponse.fromJson(Map<String, dynamic> json) => Queryresponse(
        message: json["message"],
        // error: json["error"],
      );

  Map<String, dynamic> toJson() => {
        "message": message,
        // "error": error,
      };
}
