import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:rathna/models/all_query_model.dart';
import 'package:rathna/utils/app_url.dart';
import 'package:rathna/utils/hover_message.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AllqueryProvider with ChangeNotifier {
  List<Querymodel> _models = [];
  List<Querymodel> get models {
    return _models;
  }

  bool _loading = false;
  get loading => _loading;
  setloading(value) {
    _loading = value;
  }

  Future<void> getApiCall(context) async {
    setloading(true);
    var prefservice = await SharedPreferences.getInstance();
    var userid = prefservice.getString("userid");
    try {
      List<Querymodel> loadData = [];
      var response = await http.get(Uri.parse(AppURl.allqueryurl + userid));
      var jsonData = jsonDecode(response.body);
      if (response.statusCode == 200) {
        setloading(false);
        var divdata = Querymodel.fromJson(jsonData);

        for (var i = 0; i < divdata.queryData.length; i++) {
          loadData.add(divdata);
        }

        _models = loadData;
        notifyListeners();
      } else {
        Utils.toastmessage("Something went wrong");
      }
    } catch (e) {
      Utils.toastmessage("No data found");
      setloading(false);
      print(e.toString());
      notifyListeners();
    }
  }
}
