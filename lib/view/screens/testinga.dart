// import 'dart:convert';
// import 'package:http/http.dart' as http;
// import 'package:flutter/material.dart';
// import 'package:rathna/dummy/model_dummy.dart';

// class Testingno extends StatefulWidget {
//   const Testingno({Key key}) : super(key: key);

//   @override
//   _TestingnoState createState() => _TestingnoState();
// }

// class _TestingnoState extends State<Testingno> {
//   Future<CoverDatum> userdata;

//   @override
//   void initState() {
//     super.initState();
//     userdata = fetchUsermodel() as Future<CoverDatum>;
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(),
//       body: Center(
//         child: FutureBuilder<CoverDatum>(
//           future: userdata,
//           builder: (context, snapshot) {
//             if (snapshot.hasData) {
//               return Column(
//                 children: [
//                   Text(snapshot.data.companyName.toString() ?? "Daata"),
//                 ] 
//               );
//             } else if (snapshot.hasError) {
//               return Text('${snapshot.error}');
//             }

//             // By default, show a loading spinner.
//             return const CircularProgressIndicator();
//           },
//         ),
//       ),
//     );
//   }
// }

// Future<List<CoverDatum>> fetchUsermodel() async {
//   // final Prefservice prefservice = Prefservice();
//   // var sutomid=prefservice.getcredits("customerID");

//   var url = Uri.parse(
//       "https://libsitservices.com/core/api/cover/getById?customer_id=RE1234"
//       );
//   final response = await http.get(url);

//   if (response.statusCode == 200) {
//     final parsed= json.decode(response.body).cast<Map<String,dynamic>>();
//     return parsed.map<CoverDatum>((json)=>CoverDatum.fromJson(json)).toList();
//     // return Coverdata.fromJson(jsonDecode(response.body));
//   } else {
//     throw Exception('Server Error');
//   }
// }
