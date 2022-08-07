import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:rathna/models/company_list_models.dart';
import 'package:rathna/utils/app_url.dart';
import 'package:rathna/utils/hover_message.dart';

class CompanylistProvider with ChangeNotifier {
  List<Companylistmodel> _models = [];
  List<Companylistmodel> get models {
    return _models;
  }

  bool _loading = false;
  get loading => _loading;
  setloading(value) {
    _loading = value;
  }

  Future<void> getApiCall(context) async {
    setloading(true);
    // var prefservice = await SharedPreferences.getInstance();
    // var userid = prefservice.getString("userid");
    try {
      List<Companylistmodel> loadData = [];
      var response = await http.get(Uri.parse(AppURl.companylisturl));

      var jsonData = jsonDecode(response.body);
      if (response.statusCode == 200) {
        setloading(false);
        print(jsonData['companies'].length);

        var divdata = Companylistmodel.fromJson(jsonData);
        for (var i = 0; i < divdata.companies.length; i++) {
          loadData.add(divdata);
        }

        _models = loadData;
        notifyListeners();
      } else {
        setloading(false);
        Utils.toastmessage("No data found");
        return const Center(
          child: Text("No data found"),
        );
      }
    } catch (e) {
      Utils.toastmessage("No data found");
      setloading(false);
      print(e.toString());
      notifyListeners();
    }
  }
}
