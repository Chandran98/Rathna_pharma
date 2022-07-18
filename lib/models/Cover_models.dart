// To parse this JSON data, do
//
//     final coverdata = coverdataFromJson(jsonString);

import 'dart:convert';

Coverdata coverdataFromJson(String str) => Coverdata.fromJson(json.decode(str));

String coverdataToJson(Coverdata data) => json.encode(data.toJson());

class Coverdata {
    Coverdata({
         this.coverData,
    });

    List<CoverDatum> coverData;

    factory Coverdata.fromJson(Map<String, dynamic> json) => Coverdata(
        coverData: List<CoverDatum>.from(json["cover_data"].map((x) => CoverDatum.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "cover_data": List<dynamic>.from(coverData.map((x) => x.toJson())),
    };
}

class CoverDatum {
    CoverDatum({
       this.noOfData,
       this.type,
       this.courierNo,
       this.companyName,
       this.customerName,
       this.customerCity,
       this.customerId,
       this.comments,
       this.transportName,
       this.createdDate,
    });

    String noOfData;
    String type;
    String courierNo;
    String companyName;
    String customerName;
    String customerCity;
    String customerId;
    String comments;
    String transportName;
    DateTime createdDate;

    factory CoverDatum.fromJson(Map<String, dynamic> json) => CoverDatum(
        noOfData: json["no_of_data"],
        type: json["type"],
        courierNo: json["courier_no"],
        companyName: json["company_name"],
        customerName: json["customer_name"],
        customerCity: json["customer_city"],
        customerId: json["customer_id"],
        comments: json["comments"],
        transportName: json["transport_name"],
        createdDate: DateTime.parse(json["created_date"]),
    );

    Map<String, dynamic> toJson() => {
        "no_of_data": noOfData,
        "type": type,
        "courier_no": courierNo,
        "company_name": companyName,
        "customer_name": customerName,
        "customer_city": customerCity,
        "customer_id": customerId,
        "comments": comments,
        "transport_name": transportName,
        "created_date": "${createdDate.year.toString().padLeft(4, '0')}-${createdDate.month.toString().padLeft(2, '0')}-${createdDate.day.toString().padLeft(2, '0')}",
    };
}
