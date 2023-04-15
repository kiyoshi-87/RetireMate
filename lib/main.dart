import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:retirement_app/routes/route_generator.dart';
import 'package:retirement_app/screens/EarningsAndExpenses.dart';
import 'package:retirement_app/screens/HomePage.dart';
import 'package:retirement_app/screens/Investments.dart';
import 'package:retirement_app/screens/Login.dart';
import 'package:retirement_app/screens/Signup.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import './models/result.dart';
import './utils/Splashscreen.dart';
import './constants.dart' as Constants;

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
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
      theme: ThemeData(
        brightness: Brightness.dark,
        primaryColor: Color(Constants.secondary_color),
      ),
      home: Splashscreen(),
      onGenerateRoute: RouteGenerator.generateRoute,
    );
  }
}

// class MainPage extends StatelessWidget {
//   const MainPage({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: StreamBuilder<User?>(
//         stream: FirebaseAuth.instance.authStateChanges(),
//         builder: (context, snapshot) {
//           if (snapshot.connectionState == ConnectionState.waiting) {
//             return const Center(
//               child: CircularProgressIndicator(),
//             );
//           } else if (snapshot.hasError) {
//             return const Center(
//               child: Text("Something went wrong"),
//             );
//           } else if (snapshot.hasData) {
//             return Homepage(
//               resultData: null,
//             );
//           } else {
//             return Signup();
//           }
//         },
//       ),
//     );
//   }
// }
