// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:rathna/constants/constants.dart';
import 'package:rathna/helper/Internet%20connectivity/Network_status.dart';
import 'package:rathna/provider/all_query_provider.dart';
import 'package:rathna/theme/colors/color_palette.dart';
import 'package:rathna/utils/list_title_widget.dart';
import 'package:rathna/view/screens/Main_home_screen.dart';

class QueryDetailscreen extends StatefulWidget {
  const QueryDetailscreen({Key key}) : super(key: key);

  @override
  State<QueryDetailscreen> createState() => _QueryDetailscreenState();
}

class _QueryDetailscreenState extends State<QueryDetailscreen> {
  @override
  void initState() {
    super.initState();
    Provider.of<AllqueryProvider>(context, listen: false).getApiCall(context);
  }

  @override
  Widget build(BuildContext context) {
    void onback() {
      // ignore: prefer_const_constructors
      Navigator.push(context, MaterialPageRoute(builder: (_) => BaseScreen()));
    }

    final data = Provider.of<AllqueryProvider>(context);
    return NetworkSensitive(
      child: WillPopScope(
        onWillPop: () {
          onback();
          return Future.value(false);
        },
        child: SafeArea(
          child: Scaffold(
              appBar: AppBar(
                backgroundColor: kPrimaryColor,
                leading: IconButton(
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (_) => BaseScreen()));
                    },
                    icon: const Icon(
                      Icons.arrow_back,
                      color: white,
                    )),
                title: const Text("Queries"),
                elevation: 0,
              ),
              body: ListView.builder(
                  itemCount: data.models.length,
                  itemBuilder: (ctx, index) {
                    var jsondata = data.models[index].queryData[index];
                    load() {
                      // ignore: unrelated_type_equality_checks
                      if (jsondata.querryStatus == 0.toString()) {
                        return "Resolved";
                      } else {
                        return "Pending";
                      }
                    }

                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Card(
                          child: ExpansionTile(
                              title: Listname(
                                caption: "Querry Type:",
                                name: jsondata.querryId.toString(),
                              ),
                              subtitle: Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 5),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    const Text("Querry Status:"),
                                    Container(
                                        decoration: BoxDecoration(
                                            color: jsondata.querryStatus ==
                                                    0.toString()
                                                ? greenColor
                                                : redColor,
                                            border: Border.all(
                                                color: jsondata.querryStatus ==
                                                        0.toString()
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
                                          style:
                                              GoogleFonts.poppins(color: white),
                                        ))),
                                  ],
                                ),
                              ),
                              children: [
                            Padding(
                              padding: const EdgeInsets.only(
                                  top: 10, bottom: 10, left: 20, right: 20),
                              child: SizedBox(
                                width: double.infinity,
                                child: Text(
                                  jsondata.querry,
                                  textAlign: TextAlign.start,
                                  style: GoogleFonts.poppins(fontSize: 14),
                                ),
                              ),
                            )
                          ])),
                    );
                  })),
        ),
      ),
    );
  }
}
