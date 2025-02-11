import 'package:flutter/material.dart';
import 'package:itravel_sa/HomePage.dart';
import 'package:itravel_sa/src/features/authentication/screens/on_boarding/on_boarding_screens.dart';
import 'CurrencyConverter.dart';
import 'package:itravel_sa/src/utils/theme/theme.dart';

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
      theme: TAppTheme.lightTheme,
      darkTheme: TAppTheme.darkTheme,
      themeMode: ThemeMode.system,
      //home:CurrencyConverter(), // Set Currency Converter Screen as Home
      //home: HomePage(),
      home: WelcomeScreen(),
    );
  }
}
