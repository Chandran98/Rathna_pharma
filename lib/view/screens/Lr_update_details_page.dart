import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rathna/constants/constants.dart';
import 'package:rathna/provider/Lr_provider.dart';
import 'package:rathna/utils/list_title_widget.dart';

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
          title: Text("LR-Update"),
        ),
        body: ListView.builder(
            itemCount: data.models.length,
            itemBuilder: (ctx, index) {
              var jsondata = data.models[index].lrupdateData[index];
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: Card(
                    child: ExpansionTile(
                        subtitle: Listname(
                          caption: "ChequeNo.",
                          name: jsondata.chequeNo.toString(),
                        ),
                        title: Listname(
                                caption: "Lr No.",
                                name: jsondata.lrNo.toString(),
                              ),
                        children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 15.0),
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              spacedh10,
                              Listname(
                                caption: "Lr Date",
                                name: jsondata.lrDate.toString(),
                              ),
                              Listname(
                                caption: "Customer Name",
                                name: jsondata.customerName.toString(),
                              ),
                              Listname(
                                caption: "No. of Boxes",
                                name: jsondata.noOfBoxes.toString(),
                              ),
                              Listname(
                                caption: "Invoice no.",
                                name: jsondata.invoiceNumber.toString(),
                              ),
                              Listname(
                                caption: "Invoice value",
                                name: jsondata.invoiceValue.toString(),
                              ),
                              Listname(
                                caption: "Invoice Date",
                                name: jsondata.invoiceDate.toString(),
                              ),
                              Listname(
                                caption: "Courier no.",
                                name: jsondata.courierNo.toString(),
                              ),
                              Listname(
                                caption: "Booking person.",
                                name: jsondata.bookingPerson.toString(),
                              ),
                              Listname(
                                caption: "Eway Bill no.",
                                name: jsondata.ewayBillNo.toString(),
                              ),
                              Listname(
                                caption: "Weight",
                                name: jsondata.weight.toString(),
                              ),
                              Listname(
                                caption: "Comments",
                                name: jsondata.comments.toString(),
                              ),
                            ]),
                      )
                    ])),
              );
            }));
  }
}
