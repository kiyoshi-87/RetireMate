import 'dart:collection';
import 'dart:math';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../models/result.dart';
import '../constants.dart' as Constants;
import '../provider/base_client.dart';
import 'dart:convert' as convert;
import '../models/userinfo.dart';

class Homepage extends StatefulWidget {
  final ResultData? resultData;
  const Homepage({super.key, required this.resultData});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  //FIREBASE
  User? user = FirebaseAuth.instance.currentUser;
  //DATA VALUES
  double lakhs = 100000.0;
  double totalEarnings = 0;
  double totalExpenses = 0;
  double estimatedNetWorth = 0;
  double targetNetworth = 0;
  double cashflow = 0;
  double stocks = 0;
  double realestate = 0;
  double gold = 0;
  double fixedDeposits = 0;
  double newNetworth = 0;
  double timetoRetire = 0;
  double fd_interest = 0;

  var totalEarnings_rounded = "0.0";
  var totalExpenses_rounded = "0.0";
  var estimatedNetWorth_rounded = "0.0";
  var cashflow_rounded = "0.0";
  var targetednetworth_rounded = "0.0";
  //state of the variable
  bool isLoading = true;
  late final data;
  Future<void> solve() async {
    data = widget.resultData;
    var email = user?.email;
    if (data == null) {
      try {
        var response = await BaseClient().get(email!);
        var userData = convert.jsonDecode(response) as Map<String, dynamic>;
        cashflow_rounded = userData["cashflow"];
        totalEarnings_rounded = userData["total_earnings"];
        totalExpenses_rounded = userData["total_expenses"];
        estimatedNetWorth_rounded = userData["estimated_networth"];
        stocks = double.parse(userData["stocks"]);
        realestate = double.parse(userData["real_estate"]);
        gold = double.parse(userData["gold"]);
        fixedDeposits = double.parse(userData["fd"]);
        targetednetworth_rounded = userData["targeted_networth"];
        fd_interest = double.parse(userData["fd_interests"]);
        timetoRetire = double.parse(userData["time_to_retire"]);

        cashflow = double.parse(cashflow_rounded) * lakhs;
        totalEarnings = double.parse(totalEarnings_rounded) * lakhs;
        totalExpenses = double.parse(totalExpenses_rounded) * lakhs;
        estimatedNetWorth = double.parse(estimatedNetWorth_rounded) * lakhs;
        targetNetworth = double.parse(targetednetworth_rounded) * lakhs;

        setState(() {
          isLoading = false;
        });
      } catch (e) {
        print("error from get request:${e}");
        setState(() {
          isLoading = false;
        });
      }
    } else {
      totalEarnings = data.totalEarnings;
      totalExpenses = data.totalExpenses;
      estimatedNetWorth = data.estimatedNetworth;
      cashflow = data.cashflow;
      stocks = (data.investments[Constants.stock_investments] ?? 0.0);
      gold = (data.investments[Constants.gold] ?? 0.0);
      realestate = (data.investments[Constants.real_estate_worth] ?? 0.0);
      targetNetworth = data.investments[Constants.targeted_networth] ?? 0.0;
      fixedDeposits = data.investments[Constants.fixed_deposits] ?? 0.0;
      timetoRetire = data.investments[Constants.time_for_retirement];
      fd_interest = data.investments[Constants.interest];

      //converting the doubles to string and rounding the numbers to 2 decimal places
      totalEarnings_rounded = (totalEarnings / lakhs).toStringAsFixed(2);
      totalExpenses_rounded = (totalExpenses / lakhs).toStringAsFixed(2);
      estimatedNetWorth_rounded =
          (estimatedNetWorth / lakhs).toStringAsFixed(2);
      cashflow_rounded = (cashflow / lakhs).toStringAsFixed(2);
      targetednetworth_rounded = (targetNetworth / lakhs).toStringAsFixed(2);
      //adjusting the gold metric
      if (data.metrics[Constants.metric] == "mg") {
        gold = (gold / 1000.0);
      } else if (data.metrics[Constants.metric] == "kg") {
        gold = (gold * 1000.0);
      }

      var bodydata = {
        "email": email,
        "total_earnings": totalEarnings_rounded,
        "total_expenses": totalExpenses_rounded,
        "estimated_networth": estimatedNetWorth_rounded,
        "targeted_networth": targetednetworth_rounded,
        "cashflow": cashflow_rounded,
        "stocks": stocks.toString(),
        "real_estate": realestate.toString(),
        "gold": gold.toString(),
        "fd": fixedDeposits.toString(),
        "fd_interests": fd_interest.toString(),
        "time_to_retire": timetoRetire.toString()
      };
      // print(bodydata);
      try {
        var response = await BaseClient().post(email!, bodydata);
        setState(() {
          isLoading = false;
        });
      } catch (e) {
        print("error from post request ${e}");
        setState(() {
          isLoading = false;
        });
      }
    }
  }

  @override
  void initState() {
    super.initState();
    solve();
  }

  Widget build(BuildContext context) {
    var deviceSize = MediaQuery.of(context).size;
    //FIREBASE
    String? email = "";
    if (user != null) {
      email = user?.email!;
    }
    //alert dialog
    var alert = AlertDialog(
      title: const Text('Logout'),
      content: SingleChildScrollView(
        child: ListBody(
          children: const <Widget>[
            Text('Are you sure you want to logout?'),
          ],
        ),
      ),
      actions: <Widget>[
        TextButton(
          child: const Text('Yes'),
          onPressed: () {
            FirebaseAuth.instance.signOut();
            Navigator.of(context).pushNamedAndRemoveUntil(
                "/login", (Route<dynamic> route) => false);
          },
        ),
      ],
    );

    //text controllers
    TextEditingController cashflowController = TextEditingController();
    cashflowController.text = "${cashflow_rounded} lacs";
    TextEditingController newNetworthController = TextEditingController();
    newNetworth = calculateNewNetworth(totalEarnings, totalExpenses, stocks,
        realestate, gold, fixedDeposits, timetoRetire, fd_interest);
    var newNetworth_rounded = (newNetworth / lakhs).toStringAsFixed(2);
    newNetworthController.text = "${newNetworth_rounded} lacs";
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
                        radius: 30,
                        backgroundColor:
                            Color.fromARGB(255, 61, 61, 61), // Image radius
                      ),
                      SizedBox(
                        height: deviceSize.height * 0.014,
                      ),
                      Text(
                        "${email}",
                        style: TextStyle(color: Colors.white),
                      ),
                    ],
                  ),
                ),
              ),
              ListTile(
                title: const Text(
                  'Investments',
                ),
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
                  showDialog(
                      context: context,
                      builder: (_) {
                        return alert;
                      });
                },
              ),
            ],
          ),
        ),
        body: isLoading
            ? const Center(child: CircularProgressIndicator())
            : Padding(
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
                                style: TextStyle(fontSize: 12),
                              ),
                              SizedBox(
                                height: deviceSize.height * 0.01,
                              ),
                              resultContainer(data: totalEarnings_rounded)
                            ],
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              const Text(
                                "Total Expenses",
                                style: TextStyle(fontSize: 12),
                              ),
                              SizedBox(
                                height: deviceSize.height * 0.01,
                              ),
                              resultContainer(
                                data: totalExpenses_rounded,
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
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                const Text(
                                  "Estimated Net worth",
                                  style: TextStyle(fontSize: 12),
                                ),
                                SizedBox(
                                  height: deviceSize.height * 0.01,
                                ),
                                resultContainer(
                                  data: estimatedNetWorth_rounded,
                                ),
                              ],
                            ),
                          ),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                const Text(
                                  "Targeted Net worth",
                                  style: TextStyle(fontSize: 12),
                                ),
                                SizedBox(
                                  height: deviceSize.height * 0.01,
                                ),
                                resultContainer(
                                  data: targetednetworth_rounded,
                                ),
                              ],
                            ),
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
                            fontSize: 18,
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
                              horizontal: 0,
                              vertical: deviceSize.height * 0.012),
                          border: const OutlineInputBorder(
                            borderSide: BorderSide(
                                width: 2,
                                color: Color(Constants.primary_color)),
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                          ),
                          enabledBorder: const OutlineInputBorder(
                            borderSide: BorderSide(
                                width: 2,
                                color: Color(Constants.primary_color)),
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
                      SliderTheme(
                        data: SliderTheme.of(context).copyWith(
                          activeTrackColor: Color(Constants.secondary_color),
                          inactiveTrackColor: Color(Constants.secondary_color),
                          trackHeight: 20.0,
                          thumbColor: const Color(Constants.primary_color),
                        ),
                        child: Slider(
                          value: stocks,
                          max: 10000000,
                          divisions: 1000,
                          // activeColor: Color(Constants.primary_color),
                          // thumbColor: Color(Constants.primary_color),
                          label: stocks.round().toString(),
                          onChanged: (double value) {
                            setState(() {
                              stocks = value;
                            });
                          },
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Padding(
                            padding:
                                EdgeInsets.only(right: deviceSize.width * 0.1),
                            child: Text(
                              "${stocks}",
                              style: TextStyle(fontSize: 10),
                            ),
                          ),
                        ],
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
                      SliderTheme(
                        data: SliderTheme.of(context).copyWith(
                          activeTrackColor: Color(Constants.secondary_color),
                          inactiveTrackColor: Color(Constants.secondary_color),
                          trackHeight: 20.0,
                          thumbColor: const Color(Constants.primary_color),
                        ),
                        child: Slider(
                          value: realestate,
                          max: 10000000,
                          divisions: 1000,
                          // activeColor: Color(Constants.primary_color),
                          // thumbColor: Color(Constants.primary_color),
                          label: realestate.round().toString(),
                          onChanged: (double value) {
                            setState(() {
                              realestate = value;
                            });
                          },
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Padding(
                            padding:
                                EdgeInsets.only(right: deviceSize.width * 0.1),
                            child: Text(
                              "${realestate}",
                              style: TextStyle(fontSize: 10),
                            ),
                          ),
                        ],
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
                      SliderTheme(
                        data: SliderTheme.of(context).copyWith(
                          activeTrackColor: Color(Constants.secondary_color),
                          inactiveTrackColor: Color(Constants.secondary_color),
                          trackHeight: 20.0,
                          thumbColor: const Color(Constants.primary_color),
                        ),
                        child: Slider(
                          value: gold,
                          max: 1000,
                          divisions: 200,
                          label: gold.round().toString(),
                          onChanged: (double value) {
                            setState(() {
                              gold = value;
                            });
                          },
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Padding(
                            padding:
                                EdgeInsets.only(right: deviceSize.width * 0.1),
                            child: Text(
                              "${gold}",
                              style: TextStyle(fontSize: 10),
                            ),
                          ),
                        ],
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
                      SliderTheme(
                        data: SliderTheme.of(context).copyWith(
                          activeTrackColor: Color(Constants.secondary_color),
                          inactiveTrackColor: Color(Constants.secondary_color),
                          trackHeight: 20.0,
                          thumbColor: const Color(Constants.primary_color),
                        ),
                        child: Slider(
                          value: fixedDeposits,
                          max: 10000000,
                          divisions: 1000,
                          label: fixedDeposits.round().toString(),
                          onChanged: (double value) {
                            setState(() {
                              fixedDeposits = value;
                            });
                          },
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Padding(
                            padding:
                                EdgeInsets.only(right: deviceSize.width * 0.1),
                            child: Text(
                              "${fixedDeposits}",
                              style: TextStyle(fontSize: 10),
                            ),
                          ),
                        ],
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
                        style: const TextStyle(
                            fontSize: 18,
                            fontStyle: FontStyle.italic,
                            fontWeight: FontWeight.w600),
                        readOnly: true,
                        controller: newNetworthController,
                        textAlign: TextAlign.center,
                        decoration: InputDecoration(
                          isDense: true,
                          contentPadding: EdgeInsets.symmetric(
                              horizontal: 0,
                              vertical: deviceSize.height * 0.012),
                          border: const OutlineInputBorder(
                            borderSide: BorderSide(
                                width: 2,
                                color: Color(Constants.primary_color)),
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                          ),
                          enabledBorder: const OutlineInputBorder(
                            borderSide: BorderSide(
                                width: 2,
                                color: Color(Constants.primary_color)),
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
              max: 10000000,
              divisions: 1000,
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

class slidergold extends StatefulWidget {
  double data;
  slidergold({super.key, required this.data});

  @override
  State<slidergold> createState() => _slidergoldState(data);
}

class _slidergoldState extends State<slidergold> {
  double val;
  _slidergoldState(this.val) {}
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
              max: 1000,
              divisions: 200,
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
  var data;
  resultContainer({super.key, required this.data});

  @override
  // ignore: no_logic_in_create_state
  State<resultContainer> createState() => _resultContainerState(data);
}

class _resultContainerState extends State<resultContainer> {
  var data;
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
          "${data} lakhs",
          textAlign: TextAlign.center,
          style: const TextStyle(
              color: Colors.white,
              fontSize: 18,
              fontStyle: FontStyle.italic,
              fontWeight: FontWeight.w600),
        ),
      ),
    );
  }
}

// function to calculate the new Net worth
double calculateNewNetworth(
    double totalEarnings,
    double totalExpenses,
    double stocks,
    double realestate,
    double gold,
    double fd,
    double R,
    double fdReturns) {
  double ans = 0.0;
  //api call to get the stock index returns(YOY)
  var stockReturns = 12.0;

  //api call to get the real estate returns based on location
  var realestateReturns = 10.0;

  // api call to get the gold returns
  var goldReturns = 8.0;

  //api call to get gold per gram rate
  var goldPerGram = 6062.0;

  //conversion of gold to gm
  var totalGold = gold * goldPerGram;

  var totalinvestments = stocks * pow((1 + (stockReturns / 100)), R) +
      realestate * pow((1 + (realestateReturns / 100)), R) +
      totalGold * pow((1 + (goldReturns / 100)), R) +
      fd * pow((1 + (fdReturns / 100)), R);
  print("R" + R.toString());
  print("investments ${totalinvestments}");
  print("earnings" + totalEarnings.toString());
  print("expenses" + totalExpenses.toString());
  ans = totalEarnings - totalExpenses + totalinvestments;
  return ans;
}
