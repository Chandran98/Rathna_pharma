import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class LoginProvider with ChangeNotifier {
  bool _isLoading = false;
  bool get isLoading {
    return _isLoading;
  }

  Future loginApi({String name, String password, BuildContext context}) async {
    try {
      _isLoading = true;
      var response = await http.post(Uri.parse(
          'https://libsitservices.com/core/api/customer/login?customer_email=$name&customer_pass=$password'));
      print(response.body);
      var jsonData = json.decode(response.body);
      if (response.statusCode == 200) {
        print('success0');
        if (jsonData['status'] == true) {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text('Login Successfull'),
          ));
        } else {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text('Login Failed'),
          ));
        }

        _isLoading = false;
        notifyListeners();
      } else {
        print('failed');
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text('Check the username and password'),
        ));
        _isLoading = false;
        notifyListeners();
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text('Failed'),
      ));
      _isLoading = false;
      notifyListeners();
    }
  }
}
