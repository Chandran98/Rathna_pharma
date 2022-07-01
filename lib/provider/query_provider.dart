import 'package:dio/dio.dart';
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

  // Future<Queryresponse> queryupload(querryid, query, customerid, contxt) async {
  //   setloading(true);
  //   try {
  //     String url = "https://libsitservices.com/core/api/query/querry";
  //     var response;
  //     var data = {
  //       "querry_id": querryid,
  //       "querry": query,
  //       "customer_id": customerid,
  //     };
  //     response = await http.post(Uri.parse(url), body: data);
  //     if (response.s == 200) {
  //       setloading(false);
  //       Utils.toastmessage("Submitted successfully");
  //       notifyListeners();
  //     } else {
  //       Utils.toastmessage("failed");
  //     }
  //     notifyListeners();
  //   } catch (e) {
  //     setloading(false);
  //     print(e.toString());
  //   }
  // }
  Future<Queryresponse> queryupload(querryid, query, customerid, contxt) async {
    setloading(true);
    try {
      final String url = AppURl.queryurl;

      // dynamic data =
      // print(querry);
      // print(querryid);
      // print(querry);
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
