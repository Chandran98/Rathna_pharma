// To parse this JSON data, do
//
//     final lRupdatemodel = lRupdatemodelFromJson(jsonString);

import 'dart:convert';

LRupdatemodel lRupdatemodelFromJson(String str) => LRupdatemodel.fromJson(json.decode(str));

String lRupdatemodelToJson(LRupdatemodel data) => json.encode(data.toJson());

class LRupdatemodel {
    LRupdatemodel({
        this.lrupdateData,
    });

    List<LrupdateDatum> lrupdateData;

    factory LRupdatemodel.fromJson(Map<String, dynamic> json) => LRupdatemodel(
        lrupdateData: List<LrupdateDatum>.from(json["lrupdate_data"].map((x) => LrupdateDatum.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "lrupdate_data": List<dynamic>.from(lrupdateData.map((x) => x.toJson())),
    };
}

class LrupdateDatum {
    LrupdateDatum({
        this.noOfData,
        this.companyName,
        this.noOfBoxes,
        this.transportName,
        this.courierNo,
        this.customerId,
        this.customerName,
        this.invoiceNo,
        this.customerCity,
        this.invoiceDate,
        this.invoiceValue,
        this.lrNo,
        this.lrDate,
        this.chequeNo,
        this.chequeDate,
        this.ewayBillNo,
        this.weight,
        this.comment,
        this.createdDate,
    });

    String noOfData;
    String companyName;
    String noOfBoxes;
    String transportName;
    String courierNo;
    String customerId;
    String customerName;
    String invoiceNo;
    String customerCity;
    DateTime invoiceDate;
    String invoiceValue;
    String lrNo;
    DateTime lrDate;
    String chequeNo;
    DateTime chequeDate;
    String ewayBillNo;
    String weight;
    String comment;
    DateTime createdDate;

    factory LrupdateDatum.fromJson(Map<String, dynamic> json) => LrupdateDatum(
        noOfData: json["no_of_data"],
        companyName: json["company_name"],
        noOfBoxes: json["no_of_boxes"],
        transportName: json["transport_name"],
        courierNo: json["courier_no"],
        customerId: json["customer_id"],
        customerName: json["customer_name"],
        invoiceNo: json["invoice_no"],
        customerCity: json["customer_city"],
        invoiceDate: DateTime.parse(json["invoice_date"]),
        invoiceValue: json["invoice_value"],
        lrNo: json["lr_no"],
        lrDate: DateTime.parse(json["lr_date"]),
        chequeNo: json["cheque_no"],
        chequeDate: DateTime.parse(json["cheque_date"]),
        ewayBillNo: json["eway_bill_no"],
        weight: json["weight"],
        comment: json["comment"],
        createdDate: DateTime.parse(json["created_date"]),
    );

    Map<String, dynamic> toJson() => {
        "no_of_data": noOfData,
        "company_name": companyName,
        "no_of_boxes": noOfBoxes,
        "transport_name": transportName,
        "courier_no": courierNo,
        "customer_id": customerId,
        "customer_name": customerName,
        "invoice_no": invoiceNo,
        "customer_city": customerCity,
        "invoice_date": "${invoiceDate.year.toString().padLeft(4, '0')}-${invoiceDate.month.toString().padLeft(2, '0')}-${invoiceDate.day.toString().padLeft(2, '0')}",
        "invoice_value": invoiceValue,
        "lr_no": lrNo,
        "lr_date": "${lrDate.year.toString().padLeft(4, '0')}-${lrDate.month.toString().padLeft(2, '0')}-${lrDate.day.toString().padLeft(2, '0')}",
        "cheque_no": chequeNo,
        "cheque_date": "${chequeDate.year.toString().padLeft(4, '0')}-${chequeDate.month.toString().padLeft(2, '0')}-${chequeDate.day.toString().padLeft(2, '0')}",
        "eway_bill_no": ewayBillNo,
        "weight": weight,
        "comment": comment,
        "created_date": "${createdDate.year.toString().padLeft(4, '0')}-${createdDate.month.toString().padLeft(2, '0')}-${createdDate.day.toString().padLeft(2, '0')}",
    };
}
