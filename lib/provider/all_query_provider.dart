import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:rathna/models/all_query_model.dart';
import 'package:rathna/utils/app_url.dart';
import 'package:rathna/utils/hover_message.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AllqueryProvider with ChangeNotifier {
  List<Allquerymodel> _models = [];
  List<Allquerymodel> get models {
    return _models;
  }

  Future<void> getApiCall(context) async {
    var prefservice = await SharedPreferences.getInstance();
    var userid = prefservice.getString("userid");
    try {
      List<Allquerymodel> loadData = [];
      var response = await http.get(Uri.parse(AppURl.allqueryurl + userid));
      var jsonData = jsonDecode(response.body);
      if (response.statusCode == 200) {
        var divdata = Allquerymodel.fromJson(jsonData);

        for (var i = 0; i < divdata.queryData.length; i++) {
          loadData.add(divdata);
        }

        _models = loadData;
        notifyListeners();
      } else {}
    } catch (e) {
      Utils.toastmessage("Something went wrong");
    }
  }
}
