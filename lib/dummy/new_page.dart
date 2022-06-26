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
    Provider.of<LrupdateProvider>(context, listen: false).getApiCall();
  }

  @override
  Widget build(BuildContext context) {
    final data = Provider.of<LrupdateProvider>(context);
    return Scaffold(
        appBar: AppBar(
          title: Text("LR-Update"),
        ),
        body: ListView.builder(
            itemCount: data.models.length,
            itemBuilder: (ctx, index) {
              return Card(
                  child: ExpansionTile(
                    subtitle: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [ Text("ChequeNo."),
                          Text(
                              data.models[index].lrupdateData[index].chequeNo),
                        ],
                      ), 
                      title: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [ Text("LR - No."),
                          Text(
                              data.models[index].lrupdateData[index].lrNo),
                        ],
                      ),
                      children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 30.0),
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            SizedBox(
                              height: 10,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                
                                Text("LR - Date"),
                                Text(data
                                    .models[index].lrupdateData[index].lrDate
                                    .toString()),
                              ],
                            ),
                            SizedBox(
                              height: 10,
                            ),Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                
                                Text("cheque No"),
                            Text(data
                                .models[index].lrupdateData[index].chequeNo),
                              ],
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text(data
                                .models[index].lrupdateData[index].ewayBillNo),
                            SizedBox(
                              height: 10,
                            ),
                            Text(data
                                .models[index].lrupdateData[index].customerId),
                            SizedBox(
                              height: 10,
                            ),
                            Text(data.models[index].lrupdateData[index]
                                .customerName),
                            SizedBox(
                              height: 10,
                            ),
                            Text(data.models[index].lrupdateData[index]
                                .bookingPerson),
                            SizedBox(
                              height: 10,
                            ),
                            Text(data.models[index].lrupdateData[index]
                                .invoiceNumber),
                            SizedBox(
                              height: 10,
                            ),
                          ]),
                    )
                  ]));
            }));
  }
}
