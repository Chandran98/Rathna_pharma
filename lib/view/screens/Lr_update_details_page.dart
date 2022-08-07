import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:rathna/constants/constants.dart';
import 'package:rathna/provider/Lr_provider.dart';
import 'package:rathna/utils/list_title_widget.dart';
import 'package:rathna/utils/process_indicator.dart';

class Lrupdatepage extends StatefulWidget {
  const Lrupdatepage({Key key}) : super(key: key);

  @override
  State<Lrupdatepage> createState() => _LrupdatepageState();
}

class _LrupdatepageState extends State<Lrupdatepage> {
  @override
  void initState() {
    super.initState();
    Provider.of<LrupdateProvider>(context, listen: false).getApiCall(context);
  }

  @override
  Widget build(BuildContext context) {
    final data = Provider.of<LrupdateProvider>(context);
    return Scaffold(
        appBar: AppBar(
          backgroundColor: kPrimaryColor,
          title: Text("Dispatch-report"),
        ),
        body: data.loading
            ? const Indicator()
            : ListView.builder(
                itemCount: data.models.length,
                itemBuilder: (ctx, index) {
                  var jsondata = data.models[index].lrupdateData[index];
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Card(
                        child: ExpansionTile(
                           title: TitleListname(
                              caption: "Lr No.",
                              name: jsondata.lrNo.toString(),
                            ),
                            subtitle: TitleListname(
                               caption: "Invoice no.",
                                    name: jsondata.invoiceNo.toString(),
                            ),
                           
                            children: [
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 15.0),
                            child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  spacedh10,
                                  Listname(
                                      caption: "Created Date",
                                      name: DateFormat("dd-mm-yyyy")
                                          .format(jsondata.createdDate)
                                      // jsondata.lrDate.toString(),
                                      ),
                                  Listname(
                                    caption: "Company Name",
                                    name: jsondata.companyName.toString(),
                                  ),
                                  Listname(
                                    caption: "Customer Name",
                                    name: jsondata.customerName.toString(),
                                  ),
                                  Listname(
                                    caption: "Customer City",
                                    name: jsondata.customerCity.toString(),
                                  ),
                                  Listname(
                                      caption: "Lr Date",
                                      name: DateFormat("dd-mm-yyyy")
                                          .format(jsondata.lrDate)
                                      // jsondata.lrDate.toString(),
                                      ),
                                  Listname(
                                    caption: "No. of Boxes",
                                    name: jsondata.noOfBoxes.toString(),
                                  ),
                                  Listname( caption: "Courier No.",
                              name: jsondata.courierNo.toString(),
                                  ),
                                  Listname(
                                    caption: "Invoice value",
                                    name: jsondata.invoiceValue.toString(),
                                  ),
                                  Listname(
                                    caption: "Invoice Date",
                                    name: DateFormat("dd-mm-yyyy")
                                        .format(jsondata.invoiceDate),
                                  ),
                                  Listname(
                                    caption: "Cheque no.",
                                    name: jsondata.chequeNo.toString(),
                                  ),
                                  Listname(
                                    caption: "Cheque Date.",
                                    name: DateFormat("dd-mm-yyyy")
                                        .format(jsondata.chequeDate),
                                  ),
                                  Listname(
                                    caption: "Transport name.",
                                    name: jsondata.transportName.toString(),
                                  ),
                                  Listname(
                                    caption: "Eway Bill no.",
                                    name: jsondata.ewayBillNo.toString(),
                                  ),
                                  Listname(
                                    caption: "Weight",
                                    name: jsondata.weight.toString(),
                                  ),
                                  Listcolname(
                                      caption: "Comments :",
                                      name: jsondata.comment.toString()),
                                  spacedh20
                                ]),
                          )
                        ])),
                  );
                }));
  }
}
