// To parse this JSON data, do
//
//     final returndata = returndataFromJson(jsonString);

import 'dart:convert';

Returndata returndataFromJson(String str) => Returndata.fromJson(json.decode(str));

String returndataToJson(Returndata data) => json.encode(data.toJson());

class Returndata {
    Returndata({
        this.returnsData,
    });

    List<ReturnsDatum> returnsData;

    factory Returndata.fromJson(Map<String, dynamic> json) => Returndata(
        returnsData: List<ReturnsDatum>.from(json["returns_data"].map((x) => ReturnsDatum.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "returns_data": List<dynamic>.from(returnsData.map((x) => x.toJson())),
    };
}

class ReturnsDatum {
    ReturnsDatum({
        this.noOfData,
        this.type,
        this.courierNo,
        this.customerName,
        this.customerId,
        this.noOfBoxes,
        this.lrDate,
        this.companyName,
        this.transportName,
        this.customerCity,
        this.boxNo,
        this.createdDate,
    });

    String noOfData;
    String type;
    String courierNo;
    String customerName;
    String customerId;
    String noOfBoxes;
    DateTime lrDate;
    String companyName;
    String transportName;
    String customerCity;
    String boxNo;
    DateTime createdDate;

    factory ReturnsDatum.fromJson(Map<String, dynamic> json) => ReturnsDatum(
        noOfData: json["no_of_data"],
        type: json["type"],
        courierNo: json["courier_no"],
        customerName: json["customer_name"],
        customerId: json["customer_id"],
        noOfBoxes: json["no_of_boxes"],
        lrDate: DateTime.parse(json["LR_date"]),
        companyName: json["company_name"],
        transportName: json["transport_name"],
        customerCity: json["customer_city"],
        boxNo: json["box_no"],
        createdDate: DateTime.parse(json["created_date"]),
    );

    Map<String, dynamic> toJson() => {
        "no_of_data": noOfData,
        "type": type,
        "courier_no": courierNo,
        "customer_name": customerName,
        "customer_id": customerId,
        "no_of_boxes": noOfBoxes,
        "LR_date": "${lrDate.year.toString().padLeft(4, '0')}-${lrDate.month.toString().padLeft(2, '0')}-${lrDate.day.toString().padLeft(2, '0')}",
        "company_name": companyName,
        "transport_name": transportName,
        "customer_city": customerCity,
        "box_no": boxNo,
        "created_date": "${createdDate.year.toString().padLeft(4, '0')}-${createdDate.month.toString().padLeft(2, '0')}-${createdDate.day.toString().padLeft(2, '0')}",
    };
}
