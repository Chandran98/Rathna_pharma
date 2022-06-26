// import 'dart:convert';

// import 'package:flutter/material.dart';
// import 'package:rathna/dummy/model_dummy.dart';
// import '../services/auth_services.dart';
// import '../utils/app_url.dart';
// import 'package:http/http.dart' as http;

// class CoverDetailsPage extends StatefulWidget {
//   CoverDetailsPage({Key key}) : super(key: key);

//   @override
//   State<CoverDetailsPage> createState() => _CoverDetailsPageState();
// }

// class _CoverDetailsPageState extends State<CoverDetailsPage> {
//   Future<Lrupmodel> fetchuserprofile() async {
//     try {
//       var url = Uri.parse(AppURl.userprofileurl + customeroTD);
//       final response = await http.get(url);
//       if (response.statusCode == 200) {
//         Lrupmodel res = Lrupmodel.fromJson(jsonDecode(response.body));
//         return res;
//       } else {
//         throw Exception('Server Error');
//       }
//     } catch (e) {
//       print(e.toString());
//     }
//   }

//   @override
//   void initState() {
//     prefservice.getcredits("customerId").then((value) {
//       setState(() {
//         customeroTD = value;
//       });
//       print(customeroTD);
//     });
//     super.initState();
//   }

//   String customeroTD = 0.toString();
//   Prefservice prefservice = Prefservice();
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         appBar: AppBar(
//           title: const Text(
//             "Inward Cover's ",
//             style: TextStyle(fontSize: 18),
//           ),
//           centerTitle: true,
//           backgroundColor: Colors.green.shade400,
//         ),
//         body: Center(
//           child: FutureBuilder(
//             future: fetchuserprofile(),
//             builder: (context, snapshot) {
//               if (snapshot.hasData) {
//                 return ListView.builder(
//                   itemCount: snapshot.data.,
//                   itemBuilder: (BuildContext context, int index) {
//                     return Card(
//                   child: Container(
//                     height: 100,
//                     width: 250,
//                     color: Colors.white60,
//                     child: Column(
//                       children: [
//                         Text(snapshot.data.the1.customerCity),
//                         Text(snapshot.data.the1.customerEmail),
//                         Text(snapshot.data.the1.customerPass)
//                       ],
//                     ),
//                   ),
//                 );
//                   },
//                 );
//               } else if (snapshot.hasError) {
//                 return Text('${snapshot.error}');
//               }

//               // By default, show a loading spinner.
//               return const CircularProgressIndicator();
//             },
//           ),
//         ));
//   }
// }
