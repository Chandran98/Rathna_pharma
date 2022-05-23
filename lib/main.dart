import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rathna/provider/theme_provider.dart';
import 'package:rathna/theme/dark_theme.dart';
import 'package:rathna/theme/light_theme.dart';
import 'package:rathna/utils/app_constants.dart';
import 'package:rathna/view/screens/home_screen.dart';

void main() {
  runApp(MultiProvider(
      providers: [ChangeNotifierProvider(create: (context) => Themeprovider())],
      child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: Appconstants.app_name,
      debugShowCheckedModeBanner: false,
      theme: Provider.of<Themeprovider>(context).darktheme ? dark : light,
      home: Homescreen(),
    );
  }
}
