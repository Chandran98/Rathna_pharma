import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:rathna/utils/app_url.dart';

import '../models/LR_update_model.dart';

class LrupdateProvider with ChangeNotifier {
  List<Lrupdate> _models = [];
  List<Lrupdate> get models {
    return _models;
  }

  Future<void> getApiCall() async {
    try {
      List<Lrupdate> loadData = [];
      var response = await http.get(Uri.parse(AppURl.lrupdateurl));
      var jsonData = jsonDecode(response.body);
      if (response.statusCode == 200) {
        print(jsonData['lrupdate_data'].length);
        var divdata = Lrupdate.fromJson(jsonData);
        
        for (var i = 0; i < divdata.lrupdateData.length; i++) {
          loadData.add(divdata);
        }

        _models = loadData;
        notifyListeners();
      } else {}
    } catch (e) {}
  }
}
