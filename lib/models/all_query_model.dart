// To parse this JSON data, do
//
//     final querymodel = querymodelFromJson(jsonString);

import 'dart:convert';

Querymodel querymodelFromJson(String str) => Querymodel.fromJson(json.decode(str));

String querymodelToJson(Querymodel data) => json.encode(data.toJson());

class Querymodel {
    Querymodel({
        this.queryData,
    });

    List<QueryDatum> queryData;

    factory Querymodel.fromJson(Map<String, dynamic> json) => Querymodel(
        queryData: List<QueryDatum>.from(json["query_data"].map((x) => QueryDatum.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "query_data": List<dynamic>.from(queryData.map((x) => x.toJson())),
    };
}

class QueryDatum {
    QueryDatum({
        this.noOfData,
        this.query,
        this.queryType,
        this.queryStatus,
        this.customerId,
    });

    String noOfData;
    String query;
    String queryType;
    String queryStatus;
    String customerId;

    factory QueryDatum.fromJson(Map<String, dynamic> json) => QueryDatum(
        noOfData: json["no_of_data"],
        query: json["query"],
        queryType: json["query_type"],
        queryStatus: json["query_status"],
        customerId: json["customer_id"],
    );

    Map<String, dynamic> toJson() => {
        "no_of_data": noOfData,
        "query": query,
        "query_type": queryType,
        "query_status": queryStatus,
        "customer_id": customerId,
    };
}
