import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:rathna/models/Cover_models.dart';
import 'package:rathna/utils/app_url.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CoverProvider with ChangeNotifier {
  List<Coverdata> _models = [];
  List<Coverdata> get models {
    return _models;
  }

  Future<void> getApiCall(context) async {
    // var userid = Provider.of<Authprovider>(context, listen: false).customerId;
    var prefservice = await SharedPreferences.getInstance();
    var userid = prefservice.getString("userid");
    try {
      List<Coverdata> loadData = [];
      var response = await http.get(Uri.parse(AppURl.coverurl + userid));
      var jsonData = jsonDecode(response.body);
      if (response.statusCode == 200) {
        print(jsonData['cover_data'].length);
        var divdata = Coverdata.fromJson(jsonData);
        for (var i = 0; i < divdata.coverData.length; i++) {
          loadData.add(divdata);
        }

        _models = loadData;
        notifyListeners();
      } else {}
    } catch (e) {}
  }
}
