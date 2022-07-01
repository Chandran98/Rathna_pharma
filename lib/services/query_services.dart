import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:rathna/models/Query_model.dart';

import '../utils/hover_message.dart';

class Queryrepo {
  Future<Queryresponse> queryupload(querryid, query, customerid, contxt) async {
    // setloading(true);
    try {
      final String url = "https://libsitservices.com/core/api/query/querry";

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
        // setloading(false);
        //  Queryresponse.fromJson(response.body);

        Utils.toastmessage("Submitted successfully");
        Navigator.of(contxt).pop();
        // notifyListeners();
      } else {
        Utils.toastmessage("failed");
      }
      // notifyListeners();
    } catch (e) {
      // setloading(false);
      print(e.toString());
    }
  }
}
