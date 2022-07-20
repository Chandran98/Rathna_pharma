import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rathna/constants/constants.dart';
import 'package:rathna/provider/cover_provider.dart';
import 'package:rathna/utils/list_title_widget.dart';

class Coverpage extends StatefulWidget {
  const Coverpage({Key key}) : super(key: key);

  @override
  State<Coverpage> createState() => _CoverpageState();
}

class _CoverpageState extends State<Coverpage> {
  @override
  void initState() {
    super.initState();
    Provider.of<CoverProvider>(context, listen: false).getApiCall(context);
  }

  onrefresh() {
    Provider.of<CoverProvider>(context, listen: false).getApiCall(context);
  }

  @override
  Widget build(BuildContext context) {
    final data = Provider.of<CoverProvider>(context);
    return SafeArea(
      child: RefreshIndicator(
        onRefresh: () async => onrefresh(),
        child: Scaffold(
            appBar: AppBar(
              title: Text("Cover's "),
              backgroundColor: kPrimaryColor,
            ),
            body: ListView.builder(
                physics: BouncingScrollPhysics(),
                shrinkWrap: true,
                itemCount: data.models.length,
                itemBuilder: (ctx, index) {
                  var jsondata = data.models[index].coverData[index];
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Card(
                        child: ExpansionTile(
                            title: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text("Courier No."),
                                Text(
                                  jsondata.courierNo,
                                ),
                              ],
                            ),
                            subtitle: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text("Created-Date"),
                                Text(jsondata.createdDate.toIso8601String()),
                              ],
                            ),
                            children: [
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 15.0),
                            child: Column(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Listname(
                                    caption: "Company name",
                                    name: data.models[index].coverData[index]
                                        .companyName
                                        .toString(),
                                  ),
                                  Listname(
                                    caption: "Transport Name",
                                    name: data.models[index].coverData[index]
                                        .transportName
                                        .toString(),
                                  ),
                                  Listname(
                                    caption: "Company Id",
                                    name: data.models[index].coverData[index]
                                        .customerId
                                        .toString(),
                                  ),
                                  Listname(
                                    caption: "Company city",
                                    name: data.models[index].coverData[index]
                                        .customerCity
                                        .toString(),
                                  ),
                                  Listname(
                                    caption: "Comments",
                                    name: data
                                        .models[index].coverData[index].comments
                                        .toString(),
                                  ),
                                  Listname(
                                    caption: "Type",
                                    name: data
                                        .models[index].coverData[index].type
                                        .toString(),
                                  ),
                                ]),
                          )
                        ])),
                  );
                })),
      ),
    );
  }
}
