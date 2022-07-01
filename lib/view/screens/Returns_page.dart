import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rathna/constants/constants.dart';
import 'package:rathna/provider/Lr_provider.dart';
import 'package:rathna/provider/return_provider.dart';

class Returnspage extends StatefulWidget {
  const Returnspage({Key key}) : super(key: key);

  @override
  State<Returnspage> createState() => _ReturnspageState();
}

class _ReturnspageState extends State<Returnspage> {
  @override
  void initState() {
    super.initState();
    Provider.of<ReturnProvider>(context, listen: false).getApiCall();
  }

  @override
  Widget build(BuildContext context) {
    final data = Provider.of<ReturnProvider>(context);
    return Scaffold(
        appBar: AppBar(
          title: Text("Return's"),
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
                          Text(data.models[index].returnsData[index].noOfBoxes),
                        ],
                      ),
                      title: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("LR - No."),
                          Text(data.models[index].returnsData[index].noOfBoxes),
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
                                    .models[index].returnsData[index].lrDate
                                    .toString()),
                              ],
                            ),
                            spacedh10,
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text("cheque No"),
                                Text(data.models[index].returnsData[index]
                                    .customerId),
                              ],
                            ),
                            spacedh10,
                            Text(data
                                .models[index].returnsData[index].customerCity),
                            spacedh10,
                            Text(data
                                .models[index].returnsData[index].customerId),
                            spacedh10,
                            Text(data
                                .models[index].returnsData[index].customerName),
                            spacedh10,
                            Text(data
                                .models[index].returnsData[index].customerName),
                            spacedh10,
                            Text(data
                                .models[index].returnsData[index].customerCity),
                            spacedh10,
                          ]),
                    )
                  ]));
            }));
  }
}
