import 'package:cafe_wikusama/presentation/notifier/auth/auth_notifier.dart';
import 'package:cafe_wikusama/presentation/notifier/menu/menu_notifier.dart';
import 'package:cafe_wikusama/presentation/notifier/transaksi/transaksi_notifier.dart';
import 'package:cafe_wikusama/presentation/pages/login/login_page.dart';
import 'package:flutter/material.dart';
import 'common/app_shared_preferences.dart';
import 'dependecy_injection.dart';
import 'package:cafe_wikusama/common/bottom_nav.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:provider/provider.dart';
import 'package:cafe_wikusama/dependecy_injection.dart' as di;


class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final token = locator.get<AppSharedPreferences>().getToken();
  // initState() {

  //   super.initState();
  //   checkToken(context);
  // }
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => di.locator<AuthNotifier>()),
        ChangeNotifierProvider(create: (_) => di.locator<MenuNotifier>()),
        ChangeNotifierProvider(create: (_) => di.locator<TransaksiNotifier>()),  
      ],
      child: Builder(
        builder: (context) {
          return MaterialApp(
            title: 'Flutter Demo',
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
              primarySwatch: Colors.blue,
            ),
            home: (token == null || token == "") ? LoginScreen() : KasirBottomNav(),
            //Change AdminBottomNav() to display admin List features without login
          );
        }
      ),
    );
  }

  
}
