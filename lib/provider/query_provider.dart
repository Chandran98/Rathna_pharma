
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:rathna/models/Query_model.dart';
import 'package:rathna/utils/app_url.dart';
import '../utils/hover_message.dart';

class Queryprovider extends ChangeNotifier {
  bool _loading = false;
  get loading => _loading;

  setloading(value) {
    _loading = value;
    notifyListeners();
  }

  Future<Queryresponse> queryupload(querryid, query, customerid, contxt) async {
    setloading(true);
    try {
      final String url = AppURl.queryurl;

 
      var response = await http.post(Uri.parse(url), body: {
        "querry_id": querryid,
        "querry": query,
        "customer_id": customerid,
        // "querry_status": "0"
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
      print(e.toString());
    }
  }
}
