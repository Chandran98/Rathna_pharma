import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';
import 'package:rathna/models/Return_model.dart';
import 'package:rathna/provider/auth_provider.dart';
import 'package:rathna/utils/app_url.dart';
import 'package:rathna/utils/hover_message.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ReturnProvider with ChangeNotifier {
  List<Returnmodel> _models = [];
  List<Returnmodel> get models {
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
      List<Returnmodel> loadData = [];
      var response = await http.get(Uri.parse(AppURl.returnsurl + userid));
      print(userid);
      var jsonData = jsonDecode(response.body);
      if (response.statusCode == 200) {
        setloading(false);
        print(jsonData['returns_data'].length);
        var divdata = Returnmodel.fromJson(jsonData);
        for (var i = 0; i < divdata.returnsData.length; i++) {
          loadData.add(divdata);
        }

        _models = loadData;
        notifyListeners();
      } else {    setloading(false);
        Utils.toastmessage("No data found");
        return Center(child: Text("No data found"),);
        
      }
    } catch (e) {
      Utils.toastmessage("No data found");
      setloading(false);
      print(e.toString());
          notifyListeners();
    }
  }
}
