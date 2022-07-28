import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:rathna/constants/constants.dart';
import 'package:rathna/provider/cover_provider.dart';
import 'package:rathna/utils/list_title_widget.dart';
import 'package:lottie/lottie.dart';
import 'package:rathna/utils/process_indicator.dart';

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
    Provider.of<CoverProvider>(context);
  }

  @override
  Widget build(BuildContext context) {
    final data = Provider.of<CoverProvider>(context);
    return SafeArea(
      child: RefreshIndicator(
        onRefresh: () async => onrefresh(),
        child: Scaffold(
            appBar: AppBar(
              title: const Text("Cover's "),
              backgroundColor: kPrimaryColor,
            ),
            body: data.loading
                ? const Indicator()
                : ListView.builder(
                    physics: const BouncingScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: data.models.length,
                    itemBuilder: (ctx, index) {
                      var jsondata = data.models[index].coverData[index];
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Card(
                            child: ExpansionTile(
                                title: Listname(
                                    caption: "Courier No.",
                                    name: jsondata.courierNo),
                                subtitle: Listname(
                                  caption: "Created-Date",
                                  name: DateFormat("dd-mm-yyyy")
                                      .format(jsondata.createdDate),
                                ),
                                children: [
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 15.0),
                                child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Listname(
                                        caption: "Company name",
                                        name: data.models[index]
                                            .coverData[index].companyName
                                            .toString(),
                                      ),
                                      Listname(
                                        caption: "Transport Name",
                                        name: data.models[index]
                                            .coverData[index].transportName
                                            .toString(),
                                      ),
                                      Listname(
                                        caption: "Company Id",
                                        name: data.models[index]
                                            .coverData[index].customerId
                                            .toString(),
                                      ),
                                      Listcolname(
                                          caption: "Comments :",
                                          name: data.models[index]
                                              .coverData[index].comment
                                              .toString()),
                                      spacedh20
                                    ]),
                              )
                            ])),
                      );
                    })),
      ),
    );
  }
}
