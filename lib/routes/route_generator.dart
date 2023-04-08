import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:retirement_app/models/result.dart';
import 'package:retirement_app/screens/EarningsAndExpenses.dart';
import 'package:retirement_app/screens/HomePage.dart';
import 'package:retirement_app/screens/Investments.dart';
import 'package:retirement_app/screens/Login.dart';
import 'package:retirement_app/screens/Signup.dart';
import '../models/earningsdata.dart';
import '../constants.dart' as Constants;

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    // Getting arguments passed in while calling Navigator.pushNamed
    final args = settings.arguments;
    switch (settings.name) {
      case '/signup':
        return MaterialPageRoute(builder: (_) => Signup());
      case '/login':
        // Validation of correct data type
        return MaterialPageRoute(builder: (_) => Login());
      case '/investments':
        if (args is EarningsData) {
          // print(args);
          return MaterialPageRoute(builder: (_) => Investments(data: args));
        }
        return MaterialPageRoute(
            builder: (_) => Investments(
                  data: EarningsData([[]], [], HashMap()),
                ));
      case '/earningsandexpenses':
        return MaterialPageRoute(builder: (_) => Earnings());
      case '/':
        return MaterialPageRoute(builder: (_) => Homepage());
      default:
        return _errorRoute();
    }
  }

  static Route<dynamic> _errorRoute() {
    return MaterialPageRoute(builder: (_) {
      return Scaffold(
        appBar: AppBar(
          title: const Text('Error'),
        ),
        body: const Center(
          child: Text('ERROR'),
        ),
      );
    });
  }
}
