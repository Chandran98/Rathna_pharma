import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';
import 'package:rathna/provider/auth_provider.dart';
import 'package:rathna/utils/app_url.dart';
import 'package:rathna/utils/hover_message.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../models/LR_update_model.dart';

class LrupdateProvider with ChangeNotifier {
  List<LRupdatemodel> _models = [];
  List<LRupdatemodel> get models {
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
      List<LRupdatemodel> loadData = [];
      var response = await http.get(Uri.parse(AppURl.lrupdateurl + userid));
      var jsonData = jsonDecode(response.body);
      if (response.statusCode == 200) {
        setloading(false);

        print(jsonData['lrupdate_data'].length);
        var divdata = LRupdatemodel.fromJson(jsonData);

        for (var i = 0; i < divdata.lrupdateData.length; i++) {
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
