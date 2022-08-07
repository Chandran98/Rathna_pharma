// To parse this JSON data, do
//
//     final companylistmodel = companylistmodelFromJson(jsonString);

import 'dart:convert';

Companylistmodel companylistmodelFromJson(String str) => Companylistmodel.fromJson(json.decode(str));

String companylistmodelToJson(Companylistmodel data) => json.encode(data.toJson());

class Companylistmodel {
    Companylistmodel({
        this.success,
        this.companies,
    });

    int success;
    List<Company> companies;

    factory Companylistmodel.fromJson(Map<String, dynamic> json) => Companylistmodel(
        success: json["success"],
        companies: List<Company>.from(json["companies"].map((x) => Company.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "success": success,
        "companies": List<dynamic>.from(companies.map((x) => x.toJson())),
    };
}

class Company {
    Company({
        this.companyName,
    });

    String companyName;

    factory Company.fromJson(Map<String, dynamic> json) => Company(
        companyName: json["company_name"],
    );

    Map<String, dynamic> toJson() => {
        "company_name": companyName,
    };
}
