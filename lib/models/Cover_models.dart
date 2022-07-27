// To parse this JSON data, do
//
//     final covermodel = covermodelFromJson(jsonString);

import 'dart:convert';

Covermodel covermodelFromJson(String str) => Covermodel.fromJson(json.decode(str));

String covermodelToJson(Covermodel data) => json.encode(data.toJson());

class Covermodel {
    Covermodel({
        this.coverData,
    });

    List<CoverDatum> coverData;

    factory Covermodel.fromJson(Map<String, dynamic> json) => Covermodel(
        coverData: List<CoverDatum>.from(json["cover_data"].map((x) => CoverDatum.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "cover_data": List<dynamic>.from(coverData.map((x) => x.toJson())),
    };
}

class CoverDatum {
    CoverDatum({
        this.noOfData,
        this.coverType,
        this.courierNo,
        this.companyName,
        this.customerId,
        this.comment,
        this.transportName,
        this.createdDate,
    });

    String noOfData;
    String coverType;
    String courierNo;
    String companyName;
    String customerId;
    String comment;
    String transportName;
    DateTime createdDate;

    factory CoverDatum.fromJson(Map<String, dynamic> json) => CoverDatum(
        noOfData: json["no_of_data"],
        coverType: json["cover_type"],
        courierNo: json["courier_no"],
        companyName: json["company_name"],
        customerId: json["customer_id"],
        comment: json["comment"],
        transportName: json["transport_name"],
        createdDate: DateTime.parse(json["created_date"]),
    );

    Map<String, dynamic> toJson() => {
        "no_of_data": noOfData,
        "cover_type": coverType,
        "courier_no": courierNo,
        "company_name": companyName,
        "customer_id": customerId,
        "comment": comment,
        "transport_name": transportName,
        "created_date": "${createdDate.year.toString().padLeft(4, '0')}-${createdDate.month.toString().padLeft(2, '0')}-${createdDate.day.toString().padLeft(2, '0')}",
    };
}
