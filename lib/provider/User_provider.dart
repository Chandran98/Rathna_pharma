import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:rathna/models/User_model.dart';
import 'package:rathna/view/base/Nod_.dart';

class UserProvider with ChangeNotifier {
  Userprofile _models;
  Userprofile get models {
    return _models;
  }
  String _name="";
  get name=>_name;

  Future<CustomerGetById> getApiCall(context) async {
    try {
      var response = await http.get(Uri.parse(
          'https://libsitservices.com/core/api/customer/getById?customer_id=RE1234'));
      var jsonData = jsonDecode(response.body);
      if (response.statusCode == 200) {
        print(jsonData['customer_getById'].length);
        var divdata = CustomerGetById.fromJson(jsonData);
        _name=divdata.customerName;
print(_name);
        // _models = divdata;
        notifyListeners();

        Navigator.push(context, MaterialPageRoute(builder: (_) => Guide()));
      } else {}
    } catch (e) {}
  }
}
