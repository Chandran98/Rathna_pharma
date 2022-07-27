// ignore_for_file: missing_return
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:rathna/models/Query_model.dart';
import 'package:rathna/utils/app_url.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../utils/hover_message.dart';

class Queryprovider extends ChangeNotifier {
  bool _loading = false;
  get loading => _loading;

  setloading(value) {
    _loading = value;
  }

  Future<Queryresponse> queryupload(querryid, query, contxt) async {
    setloading(true);
    try {
      final String url = AppURl.queryurl;
      final time = DateTime.now().toString();

      var prefservice = await SharedPreferences.getInstance();
      var userid = prefservice.getString("userid");
      print(userid);
      var response = await http.post(Uri.parse(url), body: {
        "query_type": querryid,
        "query": query,
        "customer_id": userid,
        "query_status": "0",
        "created_date": time
      });
      print(response.body);
      if (response.statusCode == 200) {
        setloading(false);
        //  Queryresponse.fromJson(response.body);

        Utils.toastmessage("Submitted successfully");
        Navigator.of(contxt).pop();
        notifyListeners();
      } else {
        Utils.toastmessage("failed");
      }
      notifyListeners();
    } catch (e) {
      setloading(false);
        Utils.toastmessage("failed");
      print(e.toString());
    }
  }
}
