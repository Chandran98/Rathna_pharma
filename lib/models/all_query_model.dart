// To parse this JSON data, do
//
//     final allquerymodel = allquerymodelFromJson(jsonString);

import 'dart:convert';

Allquerymodel allquerymodelFromJson(String str) =>
    Allquerymodel.fromJson(json.decode(str));

String allquerymodelToJson(Allquerymodel data) => json.encode(data.toJson());

class Allquerymodel {
  Allquerymodel({
    this.queryData,
  });

  List<QueryDatum> queryData;

  factory Allquerymodel.fromJson(Map<String, dynamic> json) => Allquerymodel(
        queryData: List<QueryDatum>.from(
            json["query_data"].map((x) => QueryDatum.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "query_data": List<dynamic>.from(queryData.map((x) => x.toJson())),
      };
}

class QueryDatum {
  QueryDatum({
    this.noOfData,
    this.querryId,
    this.querry,
    this.querryStatus,
    this.customerId,
  });

  String noOfData;
  String querryId;
  String querry;
  String querryStatus;
  String customerId;

  factory QueryDatum.fromJson(Map<String, dynamic> json) => QueryDatum(
        noOfData: json["no_of_data"],
        querryId: json["querry_id"],
        querry: json["querry"],
        querryStatus: json["querry_status"],
        customerId: json["customer_id"],
      );

  Map<String, dynamic> toJson() => {
        "no_of_data": noOfData,
        "querry_id": querryId,
        "querry": querry,
        "querry_status": querryStatus,
        "customer_id": customerId,
      };
}
