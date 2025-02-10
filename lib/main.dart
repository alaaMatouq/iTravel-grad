import 'package:flutter/material.dart';
import 'package:itravel_sa/welcomeScreens.dart';

import 'CurrencyConverter.dart';

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
      title: 'Trip Guide App',
      theme: ThemeData(
        primarySwatch: Colors.teal,
      ),
      home:CurrencyConverter(), // Set Currency Converter Screen as Home
    );
  }
}
