import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rathna/dummy/fdaafsdsadffsd.dart';
import 'package:rathna/dummy/new_page.dart';
import 'package:rathna/provider/Lr_provider.dart';
import 'package:rathna/provider/User_provider.dart';
import 'package:rathna/provider/cover_provider.dart';
import 'package:rathna/provider/return_provider.dart';
import 'package:rathna/provider/theme_provider.dart';
import 'package:rathna/theme/dark_theme.dart';
import 'package:rathna/theme/light_theme.dart';
import 'package:rathna/utils/app_constants.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(create: (context) => Themeprovider()),
    // ChangeNotifierProvider<Authprovider>(create: (context) => Authprovider()),
    ChangeNotifierProvider<CoverProvider>(create: (context) => CoverProvider()),

    ChangeNotifierProvider<ReturnProvider>(
        create: (context) => ReturnProvider()),

    ChangeNotifierProvider<LrupdateProvider>(
        create: (context) => LrupdateProvider()),
    // ChangeNotifierProvider<UserProvider>(create: (context) => UserProvider()),
  ], child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: Appconstants.app_name,
      debugShowCheckedModeBanner: false,
      theme: Provider.of<Themeprovider>(context).darktheme ? dark : light,
      home: COverdatapage(),
    );
  }
}
