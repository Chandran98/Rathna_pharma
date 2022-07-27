import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:rathna/constants/constants.dart';
import 'package:rathna/provider/auth_provider.dart';
import 'package:rathna/provider/return_provider.dart';
import 'package:rathna/theme/colors/color_palette.dart';
import 'package:rathna/utils/list_title_widget.dart';
import 'package:rathna/utils/process_indicator.dart';

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
          body: data.loading
              ? const Indicator()
              : ListView.builder(
                  itemCount: data.models.length,
                  itemBuilder: (ctx, index) {
                    if (data.models.isNotEmpty) {
                      var jsondata = data.models[index].returnsData[index];
                      load() {
                        // ignore: unrelated_type_equality_checks
                        if (jsondata.returnsType == 1.toString()) {
                          return "Saleable";
                        } else {
                          return "Expired";
                        }
                      }

                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Card(
                            child: ExpansionTile(
                                subtitle: Padding(
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 5),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      const Text("Return Type:"),
                                      Container(
                                          decoration: BoxDecoration(
                                              color: jsondata.returnsType ==
                                                      1.toString()
                                                  ? greenColor
                                                  : redColor,
                                              border: Border.all(
                                                  color: jsondata.returnsType ==
                                                          1.toString()
                                                      ? greenColor
                                                      : redColor,
                                                  width: 1),
                                              borderRadius:
                                                  BorderRadius.circular(5)),
                                          height: 30,
                                          width: 100,
                                          child: Center(
                                              child: Text(
                                            load(),
                                            style: GoogleFonts.poppins(
                                                color: white),
                                          ))),
                                    ],
                                  ),
                                ),
                                title: Listname(
                                  caption: "Courier no.",
                                  name: jsondata.courierNo,
                                ),
                                children: [
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 15.0),
                                child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: [
                                      Listname(
                                        caption: "Company Name",
                                        name: jsondata.companyName,
                                      ),
                                      Listname(
                                        caption: "Customer name",
                                        name: jsondata.customerName,
                                      ),
                                      Listname(
                                        caption: "City Name",
                                        name: jsondata.customerCity,
                                      ),
                                      Listname(
                                        caption: "Created Date",
                                        name: DateFormat("dd-mm-yyyy")
                                            .format(jsondata.createdDate),
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
                                        caption: "Lr Date",
                                        name: DateFormat("dd-mm-yyyy")
                                            .format(jsondata.lrDate),
                                      ),
                                      Listname(
                                        caption: "Transport name",
                                        name: jsondata.transportName,
                                      ),
                                      Listname(
                                        caption: "Customer city",
                                        name: jsondata.customerCity,
                                      ),
                                      spacedh20
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
