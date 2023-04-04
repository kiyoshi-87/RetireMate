import 'package:flutter/material.dart';
import 'package:retirement_app/screens/EarningsAndExpenses.dart';
import 'package:retirement_app/screens/Investments.dart';
import 'package:retirement_app/screens/Login.dart';
import 'package:retirement_app/screens/Signup.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Retiremate',
      debugShowCheckedModeBanner: false,
      theme: ThemeData.light(),
      home: const Investments(),
    );
  }
}
