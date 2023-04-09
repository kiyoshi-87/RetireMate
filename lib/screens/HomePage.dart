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
    //FIREBASE
    User? user = FirebaseAuth.instance.currentUser!;
    //DATA VALUES
    var value = 20;
    double cr = 10000000.0;
    double totalEarnings = data.totalEarnings.toDouble() / cr;
    double totalExpenses = data.totalExpenses.toDouble() / cr;
    double estimatedNetWorth = data.currentNetworth.toDouble() / cr;
    double targetNetworth =
        (data.investments[Constants.targeted_networth] ?? 0.0) / cr;
    double cashflow =
        (data.investments[Constants.current_cashflow] ?? 0.0) / cr;
    double stocks = (data.investments[Constants.stock_investments] ?? 0.0);
    double realestate = (data.investments[Constants.real_estate_worth] ?? 0.0);
    double gold = (data.investments[Constants.gold] ?? 0.0);
    double fixedDeposits = (data.investments[Constants.fixed_deposits] ?? 0.0);
    //text controllers
    TextEditingController cashflowController = TextEditingController();
    cashflowController.text = cashflow.floor().toString();
    return Scaffold(
        appBar: AppBar(title: const Text(Constants.appname)),
        drawer: Drawer(
          child: ListView(
            // Important: Remove any padding from the ListView.
            padding: EdgeInsets.zero,
            children: [
              DrawerHeader(
                decoration: const BoxDecoration(
                  color: Color.fromARGB(255, 25, 25, 25),
                ),
                child: Padding(
                  padding: EdgeInsets.fromLTRB(deviceSize.width * 0.01,
                      deviceSize.height * 0.005, deviceSize.width * 0.01, 0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding:
                                EdgeInsets.only(left: deviceSize.width * 0.015),
                            child: const Text(
                              "My Profile ",
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                          SizedBox(
                            height: deviceSize.height * 0.01,
                          ),
                          const CircleAvatar(
                            radius: 40,
                            backgroundColor:
                                Color.fromARGB(255, 61, 61, 61), // Image radius
                          ),
                          SizedBox(
                            height: deviceSize.height * 0.01,
                          ),
                          Text(
                            "${user.email}",
                            style: TextStyle(color: Colors.white),
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
                        resultContainer(data: totalEarnings)
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
                        resultContainer(
                          data: totalExpenses,
                        ),
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
                          "Estimated Net worth",
                          style: TextStyle(fontSize: 14),
                        ),
                        SizedBox(
                          height: deviceSize.height * 0.01,
                        ),
                        resultContainer(
                          data: estimatedNetWorth,
                        ),
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const Text(
                          "Targeted Net worth",
                          style: TextStyle(fontSize: 14),
                        ),
                        SizedBox(
                          height: deviceSize.height * 0.01,
                        ),
                        resultContainer(
                          data: targetNetworth,
                        ),
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
                  style: const TextStyle(
                      fontSize: 25,
                      color: Colors.white,
                      fontStyle: FontStyle.italic,
                      fontWeight: FontWeight.w500),
                  readOnly: true,
                  controller: cashflowController,
                  textAlign: TextAlign.center,
                  // initialValue: "",
                  decoration: InputDecoration(
                    isDense: true,
                    contentPadding: EdgeInsets.symmetric(
                        horizontal: 0, vertical: deviceSize.height * 0.012),
                    border: const OutlineInputBorder(
                      borderSide: BorderSide(
                          width: 2, color: Color(Constants.primary_color)),
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                    ),
                    enabledBorder: const OutlineInputBorder(
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
                slider(
                  data: stocks,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: const [
                    Text(
                      "Real Estate",
                      style: TextStyle(fontSize: 14),
                    ),
                  ],
                ),
                slider(
                  data: realestate,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: const [
                    Text(
                      "Gold",
                      style: TextStyle(fontSize: 14),
                    ),
                  ],
                ),
                slider(
                  data: gold,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: const [
                    Text(
                      "Fixed Deposit",
                      style: TextStyle(fontSize: 14),
                    ),
                  ],
                ),
                slider(
                  data: fixedDeposits,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: const [
                    Text(
                      "New Net worth",
                      style: TextStyle(fontSize: 14),
                    ),
                  ],
                ),
                SizedBox(
                  height: deviceSize.height * 0.007,
                ),
                TextFormField(
                  style: const TextStyle(fontSize: 22),
                  readOnly: true,
                  initialValue: "",
                  decoration: InputDecoration(
                    isDense: true,
                    contentPadding: EdgeInsets.symmetric(
                        horizontal: 0, vertical: deviceSize.height * 0.012),
                    border: const OutlineInputBorder(
                      borderSide: BorderSide(
                          width: 2, color: Color(Constants.primary_color)),
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                    ),
                    enabledBorder: const OutlineInputBorder(
                      borderSide: BorderSide(
                          width: 2, color: Color(Constants.primary_color)),
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                    ),
                  ),
                ),
                SizedBox(
                  height: deviceSize.height * 0.05,
                ),
              ],
            ),
          ),
        ));
  }
}

class slider extends StatefulWidget {
  double data;
  slider({super.key, required this.data});

  @override
  State<slider> createState() => _sliderState(data);
}

class _sliderState extends State<slider> {
  double val;
  _sliderState(this.val) {}
  @override
  Widget build(BuildContext context) {
    var deviceSize = MediaQuery.of(context).size;
    return Material(
      child: Column(
        children: [
          SliderTheme(
            data: SliderTheme.of(context).copyWith(
              activeTrackColor: Color(Constants.secondary_color),
              inactiveTrackColor: Color(Constants.secondary_color),
              trackHeight: 20.0,
              thumbColor: const Color(Constants.primary_color),
            ),
            child: Slider(
              value: val,
              max: 100000000,
              divisions: 1000,
              // activeColor: Color(Constants.primary_color),
              // thumbColor: Color(Constants.primary_color),
              label: val.round().toString(),
              onChanged: (double value) {
                setState(() {
                  val = value;
                });
              },
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Padding(
                padding: EdgeInsets.only(right: deviceSize.width * 0.1),
                child: Text(
                  "${val}",
                  style: TextStyle(fontSize: 10),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class resultContainer extends StatefulWidget {
  double data;
  resultContainer({super.key, required this.data});

  @override
  // ignore: no_logic_in_create_state
  State<resultContainer> createState() => _resultContainerState(data);
}

class _resultContainerState extends State<resultContainer> {
  double data;
  _resultContainerState(this.data) {}
  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
        height: 80,
        width: 120,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            border: Border.all(
              color: Color(Constants.primary_color),
              width: 3,
            )),
        alignment: Alignment.center,
        child: Text(
          "${data} cr",
          style: const TextStyle(
              color: Colors.white,
              fontSize: 36,
              fontStyle: FontStyle.italic,
              fontWeight: FontWeight.w600),
        ),
      ),
    );
  }
}
