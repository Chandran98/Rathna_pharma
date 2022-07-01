import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rathna/constants/constants.dart';
import 'package:rathna/provider/Lr_provider.dart';
import 'package:rathna/provider/cover_provider.dart';

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

  @override
  Widget build(BuildContext context) {
    final data = Provider.of<CoverProvider>(context);
    return Scaffold(
        appBar: AppBar(
          title: Text("Cover's "),
        ),
        body: ListView.builder(
            itemCount: data.models.length,
            itemBuilder: (ctx, index) {
              return Card(
                  child: ExpansionTile(
                      subtitle: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("Courier No."),
                          Text(data.models[index].coverData[index].courierNo),
                        ],
                      ),
                      title: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("Comments"),
                          Text(data.models[index].coverData[index].comments),
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
                                Text("Company name"),
                                Text(data
                                    .models[index].coverData[index].companyName
                                    .toString()),
                              ],
                            ),
                           spacedh10,
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text("Transport"),
                                Text(data.models[index].coverData[index].transportName),
                              ],
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text(data
                                .models[index].coverData[index].customerCity),
                            SizedBox(
                              height: 10,
                            ),
                            Text(data
                                .models[index].coverData[index].customerId),
                            SizedBox(
                              height: 10,
                            ),
                            Text(data.models[index].coverData[index]
                                .customerName),
                            SizedBox(
                              height: 10,
                            ),
                            Text(data.models[index].coverData[index].createdDate.timeZoneName                            ),
                            SizedBox(
                              height: 10,
                            ),
                          ]),
                    )
                  ]));
            }));
  }
}
