import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';
import 'package:rathna/models/User_model.dart';
import 'package:rathna/provider/auth_provider.dart';
import 'package:rathna/utils/app_url.dart';
import 'package:rathna/utils/hover_message.dart';
import 'package:rathna/view/base/Nod_.dart';

class UserProvider with ChangeNotifier {
  String _name = "";
  get name => _name;
  String _email = "";
  get email => _email;

  String _city = "";
  get city => _city;
  String _customerid = "";
  get customerid => _customerid;
  Future<Userprofilemodel> getApiCall(context) async {
    var userid = Provider.of<Authprovider>(context, listen: false).customerId;

    try {
      var response = await http.get(Uri.parse(AppURl.userprofileurl + userid));
      var jsonData = jsonDecode(response.body);
      if (response.statusCode == 200) {
        var divdata = Userprofilemodel.fromJson(jsonData);
        _name = divdata.customerName;
        _email = divdata.customerEmail;
        _customerid = divdata.customerId;
        _city = divdata.customerCity;

        print(_name);
        notifyListeners();
      } else {
        
        Utils.toastmessage("Update your profile");
      }
    } catch (e) {}
  }
}
