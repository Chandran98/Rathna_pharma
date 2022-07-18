import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rathna/constants/constants.dart';
import 'package:rathna/provider/auth_provider.dart';
import 'package:rathna/provider/return_provider.dart';
import 'package:rathna/utils/list_title_widget.dart';

class Returnspage extends StatefulWidget {
  const Returnspage({Key key}) : super(key: key);

  @override
  State<Returnspage> createState() => _ReturnspageState();
}

class _ReturnspageState extends State<Returnspage> {
  @override
  void initState() {
    super.initState();
    setState(() {});
    Provider.of<ReturnProvider>(context, listen: false).getApiCall(context);

    Provider.of<Authprovider>(context, listen: false).customerId;
  }

  @override
  Widget build(BuildContext context) {
    final data = Provider.of<ReturnProvider>(context);

    var customerid = Provider.of<Authprovider>(context).customerId;
    return SafeArea(
      child: Scaffold(
          appBar: AppBar(
            backgroundColor: kPrimaryColor,
            title: Text("Return's"),
          ),
          body: ListView.builder(
              itemCount: data.models.length,
              itemBuilder: (ctx, index) {
                if (data.models.isNotEmpty) {
                  var jsondata = data.models[index].returnsData[index];
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Card(
                        child: ExpansionTile(
                            subtitle: Listname(
                              caption: "Date.",
                              name: jsondata.createdDate.toIso8601String(),
                            ),
                            title: Listname(
                              caption: "Courier no.",
                              name: jsondata.courierNo,
                            ),
                            children: [
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 15.0),
                            child: Column(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Listname(
                                    caption: "Customer name",
                                    name: jsondata.customerName,
                                  ),
                                  Listname(
                                    caption: "Box no.",
                                    name: jsondata.boxNo,
                                  ),
                                  Listname(
                                    caption: "No. of boxes",
                                    name: jsondata.noOfBoxes,
                                  ),
                                  Listname(
                                    caption: "Company Name",
                                    name: jsondata.companyName,
                                  ),
                                  Listname(
                                    caption: "Transport name",
                                    name: jsondata.transportName,
                                  ),
                                  Listname(
                                    caption: "Customer city",
                                    name: jsondata.customerCity,
                                  ),
                                ]),
                          )
                        ])),
                  );
                } else {
                  return CircularProgressIndicator();
                }
              })),
    );
  }
}
