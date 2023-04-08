import 'dart:collection';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../models/result.dart';
import '../constants.dart' as Constants;

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  @override
  Widget build(BuildContext context) {
    var deviceSize = MediaQuery.of(context).size;
    //get the resultant data;
    final data = (ModalRoute.of(context)!.settings.arguments ??
        ResultData(0, 0, 0, 0, HashMap())) as ResultData;
    // print(data.investments[Constants.stock_investments]);

    return Scaffold(
        appBar: AppBar(title: const Text(Constants.appname)),
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
                            "My Profile ",
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
        body: Padding(
          padding: EdgeInsets.fromLTRB(
              deviceSize.height * 0.08, 0, deviceSize.height * 0.08, 0),
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: deviceSize.height * 0.02,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const Text(
                          "Total Earnings",
                          style: TextStyle(fontSize: 14),
                        ),
                        SizedBox(
                          height: deviceSize.height * 0.01,
                        ),
                        resultContainer(),
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const Text(
                          "Total Expenses",
                          style: TextStyle(fontSize: 14),
                        ),
                        SizedBox(
                          height: deviceSize.height * 0.01,
                        ),
                        resultContainer(),
                      ],
                    ),
                  ],
                ),
                SizedBox(
                  height: deviceSize.height * 0.015,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const Text(
                          "Current Networth",
                          style: TextStyle(fontSize: 14),
                        ),
                        SizedBox(
                          height: deviceSize.height * 0.01,
                        ),
                        resultContainer(),
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const Text(
                          "Targeted Networth",
                          style: TextStyle(fontSize: 14),
                        ),
                        SizedBox(
                          height: deviceSize.height * 0.01,
                        ),
                        resultContainer(),
                      ],
                    ),
                  ],
                ),
                SizedBox(
                  height: deviceSize.height * 0.01,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: const [
                    Text(
                      "Cash Flow",
                      style: TextStyle(fontSize: 14),
                    ),
                  ],
                ),
                SizedBox(
                  height: deviceSize.height * 0.007,
                ),
                TextFormField(
                  style: const TextStyle(fontSize: 14),
                  readOnly: true,
                  initialValue: "",
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(
                      borderSide: BorderSide(
                          width: 2, color: Color(Constants.primary_color)),
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                          width: 2, color: Color(Constants.primary_color)),
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                    ),
                  ),
                ),
                SizedBox(
                  height: deviceSize.height * 0.007,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: const [
                    Text(
                      "Stocks",
                      style: TextStyle(fontSize: 14),
                    ),
                  ],
                ),
                slider(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: const [
                    Text(
                      "Real Estate",
                      style: TextStyle(fontSize: 14),
                    ),
                  ],
                ),
                slider(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: const [
                    Text(
                      "Gold",
                      style: TextStyle(fontSize: 14),
                    ),
                  ],
                ),
                slider(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: const [
                    Text(
                      "Fixed Deposit",
                      style: TextStyle(fontSize: 14),
                    ),
                  ],
                ),
                slider(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: const [
                    Text(
                      "New Networth",
                      style: TextStyle(fontSize: 14),
                    ),
                  ],
                ),
                SizedBox(
                  height: deviceSize.height * 0.007,
                ),
                TextFormField(
                  style: const TextStyle(fontSize: 14),
                  readOnly: true,
                  initialValue: "",
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(
                      borderSide: BorderSide(
                          width: 2, color: Color(Constants.primary_color)),
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                          width: 2, color: Color(Constants.primary_color)),
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}

class slider extends StatefulWidget {
  const slider({super.key});

  @override
  State<slider> createState() => _sliderState();
}

class _sliderState extends State<slider> {
  @override
  Widget build(BuildContext context) {
    var value = 0.0;
    var deviceSize = MediaQuery.of(context).size;
    return Material(
      child: SliderTheme(
        data: SliderTheme.of(context).copyWith(
          activeTrackColor: Colors.blue,
          inactiveTrackColor: Colors.blue,
          trackHeight: 8.0,
          thumbColor: const Color(Constants.primary_color),
        ),
        child: Container(
          width: deviceSize.width * 0.7,
          child: Slider(
            value: value,
            max: 200,
            divisions: 10,
            // activeColor: Color(Constants.primary_color),
            // thumbColor: Color(Constants.primary_color),
            label: value.round().toString(),
            onChanged: (double value) {
              setState(() {
                value = value;
              });
            },
          ),
        ),
      ),
    );
  }
}

class resultContainer extends StatefulWidget {
  const resultContainer({super.key});

  @override
  State<resultContainer> createState() => _resultContainerState();
}

class _resultContainerState extends State<resultContainer> {
  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
        height: 90,
        width: 120,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            border: Border.all(
              color: Color(Constants.primary_color),
              width: 3,
            )),
        alignment: Alignment.center,
        child: const Text(
          "Continue",
          style: TextStyle(color: Colors.white, fontSize: 12),
        ),
      ),
    );
  }
}
