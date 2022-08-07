import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:rathna/models/Cover_models.dart';
import 'package:rathna/utils/app_url.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../utils/hover_message.dart';

class CoverProvider with ChangeNotifier {
  List<Covermodel> _models = [];
  List<Covermodel> get models {
    return _models;
  }

  bool _loading = false;
  get loading => _loading;
  setloading(value) {
    _loading = value;
  }

  // ignore: missing_return
  Future<Covermodel> getApiCall(context) async {
    setloading(true);
    // var userid = Provider.of<Authprovider>(context, listen: false).customerId;
    var prefservice = await SharedPreferences.getInstance();
    var userid = prefservice.getString("userid");
    try {
      List<Covermodel> loadData = [];
      var response = await http.get(Uri.parse(AppURl.coverurl + userid));
      var jsonData = jsonDecode(response.body);
      if (response.statusCode == 200) {
        setloading(false);
        print(jsonData['cover_data'].length);
        var divdata = Covermodel.fromJson(jsonData);
        for (var i = 0; i < divdata.coverData.length; i++) {
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

  onrefresh(context) {
    getApiCall(context);
    notifyListeners();
  }
}
