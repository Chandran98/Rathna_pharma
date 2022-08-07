import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rathna/provider/Lr_provider.dart';
import 'package:rathna/provider/User_provider.dart';
import 'package:rathna/provider/all_query_provider.dart';
import 'package:rathna/provider/auth_provider.dart';
import 'package:rathna/provider/cover_provider.dart';
import 'package:rathna/provider/forgot_pass_provider.dart';
import 'package:rathna/provider/query_provider.dart';
import 'package:rathna/provider/return_provider.dart';
import 'package:rathna/provider/theme_provider.dart';
import 'package:rathna/theme/dark_theme.dart';
import 'package:rathna/theme/light_theme.dart';
import 'package:rathna/utils/app_constants.dart';
import 'package:rathna/view/screens/splash.dart';

import 'helper/Internet connectivity/connectivity.dart';
import 'provider/company_list_provider.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(create: (context) => Themeprovider()),
    ChangeNotifierProvider<Authprovider>(create: (context) => Authprovider()),
    ChangeNotifierProvider<AllqueryProvider>(
        create: (context) => AllqueryProvider()),
    ChangeNotifierProvider<CoverProvider>(create: (context) => CoverProvider()),
    ChangeNotifierProvider<ReturnProvider>(
        create: (context) => ReturnProvider()),
    ChangeNotifierProvider<CompanylistProvider>(
        create: (context) => CompanylistProvider()),
    ChangeNotifierProvider<LrupdateProvider>(
        create: (context) => LrupdateProvider()),
    ChangeNotifierProvider<Queryprovider>(create: (context) => Queryprovider()),
    ChangeNotifierProvider<UserProvider>(create: (context) => UserProvider()),
    ChangeNotifierProvider<Forgotpassprovider>(
        create: (context) => Forgotpassprovider()),
    StreamProvider<ConnectivityStatus>(
        create: (_) => ConnectivityService().streamController.stream,
        initialData: ConnectivityStatus.Offline)
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
      home: Splashscreen(),
    );
  }
}
