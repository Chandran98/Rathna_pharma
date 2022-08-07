import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rathna/provider/company_list_provider.dart';

class Companylist extends StatefulWidget {
  const Companylist({Key key}) : super(key: key);

  @override
  State<Companylist> createState() => _CompanylistState();
}

class _CompanylistState extends State<Companylist> {
  @override
  void initState() {
    Provider.of<CompanylistProvider>(context, listen: false).getApiCall(context);
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    final data = Provider.of<CompanylistProvider>(context);
    return Scaffold(
      body: ListView.builder(
        itemCount: data.models.length,
        itemBuilder: (BuildContext context, int index) {
          var jsondata = data.models[index].companies[index];
          return ListTile(
            title: Text(jsondata.companyName.toString()),
          );
        },
      ),
    );
  }
}
