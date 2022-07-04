import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';
import 'package:rathna/models/Return_model.dart';
import 'package:rathna/provider/auth_provider.dart';
import 'package:rathna/utils/app_url.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ReturnProvider with ChangeNotifier {
  List<Returndata> _models = [];
  List<Returndata> get models {
    return _models;
  }

  Future<void> getApiCall(context) async {
    var prefservice = await SharedPreferences.getInstance();
    var userid = prefservice.getString("userid");
    try {
      List<Returndata> loadData = [];
      var response = await http.get(Uri.parse(AppURl.returnsurl+userid
          ));
      print(userid);
      var jsonData = jsonDecode(response.body);
      if (response.statusCode == 200) {
        print(jsonData['returns_data'].length);
        var divdata = Returndata.fromJson(jsonData);
        for (var i = 0; i < divdata.returnsData.length; i++) {
          loadData.add(divdata);
        }

        _models = loadData;
        notifyListeners();
      } else {}
    } catch (e) {}
  }
}
