import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rathna/constants/constants.dart';
import 'package:rathna/provider/Lr_provider.dart';

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
          title: Text("LR-Update"),
        ),
        body: ListView.builder(
            itemCount: data.models.length,
            itemBuilder: (ctx, index) {
              return Card(
                  child: ExpansionTile(
                      subtitle: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("ChequeNo."),
                          Text(data.models[index].lrupdateData[index].chequeNo),
                        ],
                      ),
                      title: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("LR - No."),
                          Text(data.models[index].lrupdateData[index].lrNo),
                        ],
                      ),
                      children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 30.0),
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                           spacedh10,
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text("LR - Date"),
                                Text(data
                                    .models[index].lrupdateData[index].lrDate.isUtc.toString()),
                              ],
                            ),
                           spacedh10,
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text("cheque No"),
                                Text(data.models[index].lrupdateData[index]
                                    .chequeNo),
                              ],
                            ),spacedh10,
                            Text(data
                                .models[index].lrupdateData[index].ewayBillNo),
                          spacedh10,
                            Text(data
                                .models[index].lrupdateData[index].customerId),
                            spacedh10,
                            Text(data.models[index].lrupdateData[index]
                                .customerName),
                         spacedh10,
                            Text(data.models[index].lrupdateData[index]
                                .bookingPerson),
                           spacedh10,
                            Text(data.models[index].lrupdateData[index]
                                .invoiceNumber),
                            spacedh10,
                          ]),
                    )
                  ]));
            }));
  }
}
