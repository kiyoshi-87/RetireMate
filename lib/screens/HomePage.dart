import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../constants.dart' as Constants;

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  User? user = FirebaseAuth.instance.currentUser;
  @override
  Widget build(BuildContext context) {
    var deviceSize = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(title: Text(Constants.appname)),
      body: const Center(
        child: Text('My Page!'),
      ),
      drawer: Drawer(
        child: ListView(
          // Important: Remove any padding from the ListView.
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: const BoxDecoration(
                color: Colors.blue,
              ),
              child: Padding(
                padding: EdgeInsets.fromLTRB(deviceSize.width * 0.01,
                    deviceSize.height * 0.01, deviceSize.width * 0.01, 0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const Text(
                          'My Profile',
                          style: TextStyle(color: Colors.white),
                        ),
                        SizedBox(
                          height: deviceSize.height * 0.01,
                        ),
                        const CircleAvatar(
                          radius: 40, // Image radius
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            ListTile(
              title: const Text('Investments'),
              onTap: () {
                Navigator.of(context).pushNamed("/investments");
              },
            ),
            ListTile(
              title: const Text('Earnings & Expenses'),
              onTap: () {
                Navigator.of(context).pushNamed("/earningsandexpenses");
              },
            ),
            ListTile(
              title: const Text('Logout'),
              onTap: () {
                FirebaseAuth.instance.signOut();
                Navigator.of(context).pushNamedAndRemoveUntil(
                    "/login", (Route<dynamic> route) => false);
              },
            ),
          ],
        ),
      ),
    );
  }
}
