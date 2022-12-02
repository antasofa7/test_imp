import 'package:flutter/material.dart';
import 'package:my_apps/pages/login_page.dart';
import 'package:my_apps/theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: themeData,
      initialRoute: LoginPage.routeName,
      routes: {LoginPage.routeName: (context) => const LoginPage()},
    );
  }
}
