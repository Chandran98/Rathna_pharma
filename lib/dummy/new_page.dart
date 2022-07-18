import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rathna/provider/Lr_provider.dart';

class COverdatapage extends StatefulWidget {
  const COverdatapage({Key key}) : super(key: key);

  @override
  State<COverdatapage> createState() => _COverdatapageState();
}

class _COverdatapageState extends State<COverdatapage> {
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
          title: const Text("LR-Update"),
        ),
        body: ListView.builder(
            itemCount: data.models.length,
            itemBuilder: (ctx, index) {
              return Card(
                  child: ExpansionTile(
                      subtitle: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text("ChequeNo."),
                          Text(data.models[index].lrupdateData[index].chequeNo),
                        ],
                      ),
                      title: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text("LR - No."),
                          Text(data.models[index].lrupdateData[index].lrNo),
                        ],
                      ),
                      children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 30.0),
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            const SizedBox(
                              height: 10,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Text("LR - Date"),
                                Text(data
                                    .models[index].lrupdateData[index].lrDate
                                    .toString()),
                              ],
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Text("cheque No"),
                                Text(data.models[index].lrupdateData[index]
                                    .chequeNo),
                              ],
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Text(data
                                .models[index].lrupdateData[index].ewayBillNo),
                            const SizedBox(
                              height: 10,
                            ),
                            Text(data
                                .models[index].lrupdateData[index].customerId),
                            const SizedBox(
                              height: 10,
                            ),
                            Text(data.models[index].lrupdateData[index]
                                .customerName),
                            const SizedBox(
                              height: 10,
                            ),
                            Text(data.models[index].lrupdateData[index]
                                .bookingPerson),
                            const SizedBox(
                              height: 10,
                            ),
                            Text(data.models[index].lrupdateData[index]
                                .invoiceNumber),
                            const SizedBox(
                              height: 10,
                            ),
                          ]),
                    )
                  ]));
            }));
  }
}
