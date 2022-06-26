// import 'dart:convert';
// import 'package:http/http.dart' as http;
// import 'package:flutter/material.dart';
// import 'package:rathna/dummy/model_dummy.dart';
// import 'package:rathna/models/Cover_models.dart';
// import 'package:rathna/utils/app_url.dart';

// import '../../services/cover_service.dart';

// class CoversDetailspage extends StatefulWidget {
//   const CoversDetailspage({Key key}) : super(key: key);

//   @override
//   State<CoversDetailspage> createState() => _CoversDetailspageState();
// }

// class _CoversDetailspageState extends State<CoversDetailspage> {
//   @override
//   Widget build(BuildContext context) {
//     Future<Lrupmodel> coverprofile;

//     @override
//     void initState() {
//       super.initState();
//       coverprofile = fetchcovermodel();
//     }

//     return Scaffold(
//       body: Center(
//         child: FutureBuilder<Lrupmodel>(
//           future: coverprofile,
//           builder: (context, snapshot) {
//             if (snapshot.hasData) {
//               return Column(
//                 children: [
//                   Text(snapshot.data.courierNo),
//                   Text(snapshot.data.companyName),
//                   Text(snapshot.data.customerCity),
//                   Text(snapshot.data.comments),
//                   Text(snapshot.data.customerName),
//                   Text(snapshot.data.customerCity),
//                 ],
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
