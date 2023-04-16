import 'dart:collection';
import 'package:retirement_app/screens/HomePage.dart';

import 'package:flutter_svg/flutter_svg.dart';
import '../constants.dart' as Constants;
import 'package:flutter/material.dart';
import '../models/earningsdata.dart';
import '../utils/calculation.dart';
import '../models/result.dart';

class Investments extends StatefulWidget {
  final EarningsData data;
  const Investments({super.key, required this.data});

  @override
  // ignore: no_logic_in_create_state
  State<Investments> createState() => _InvestmentsState(data);
}

class _InvestmentsState extends State<Investments> {
  //dropdownbutton
  late EarningsData earningsdata;
  _InvestmentsState(EarningsData data) {
    earningsdata = data;
  }
  List<String> stockIndexes = ["sensex", "nifty"];
  var index = "sensex";
  List<String> locations = ["in"];
  var location = "in";
  List<String> metric = ["mg", "g", "kg"];
  var choosenMetric = "mg";
  //form key
  final _formkey = GlobalKey<FormState>();
  //form controllers
  final stockController = TextEditingController();

  final realestateController = TextEditingController();

  final goldController = TextEditingController();

  final fixedDepositsController = TextEditingController();

  final cashflowController = TextEditingController();

  final targetedNetworthController = TextEditingController();

  final retirementimeController = TextEditingController();

  final interestController = TextEditingController();
  //hashmap for controller values
  final Map<String, double> investments = HashMap();
  final Map<String, String> metrics = HashMap();
  // metrics[Constants.index] = "sensex";
  // metrics[Constants.location] = "in";
  // metrics[Constants.metric] = "mg";

  //pop up dialog
  AlertDialog showInfo(String info) {
    return AlertDialog(
      title: Text(
        info,
        style: TextStyle(fontSize: 14.5),
      ),
    );
  }

  var alert = AlertDialog(
    title: const Text('Logout'),
  );
  @override
  Widget build(BuildContext context) {
    var deviceSize = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        title: Padding(
          padding: EdgeInsets.only(left: deviceSize.width * 0.13),
          child: Text("Investments"),
        ),
        leading: BackButton(
          onPressed: () {
            Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(builder: (_) => Homepage(resultData: null)),
                (route) => false);
          },
        ),
      ),
      body: Form(
        key: _formkey,
        child: SingleChildScrollView(
          child: Center(
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.fromLTRB(deviceSize.width * 0.1,
                      deviceSize.width * 0.05, deviceSize.width * 0.1, 0),
                  child: Column(
                    children: [
                      SizedBox(
                        height: deviceSize.height * 0.01,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SizedBox(
                            width: deviceSize.width * 0.55,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    const Text(
                                      "Stock Investments",
                                      style: TextStyle(
                                          fontSize: 11.5,
                                          fontWeight: FontWeight.w500),
                                    ),
                                    InkWell(
                                      onTap: () {
                                        showDialog(
                                            context: context,
                                            builder: (_) {
                                              return showInfo(
                                                  "Total value of stock investments in a respective index");
                                            });
                                      },
                                      child: Padding(
                                        padding: EdgeInsets.only(right: 9.0),
                                        child: SvgPicture.asset(
                                            "assets/info_icon.svg"),
                                      ),
                                    )
                                  ],
                                ),
                                SizedBox(
                                  height: deviceSize.height * 0.008,
                                ),
                                TextFormField(
                                  controller: stockController,
                                  style: const TextStyle(fontSize: 14),
                                  keyboardType: TextInputType.number,
                                  decoration: const InputDecoration(
                                    border: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          width: 1, color: Colors.grey),
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(10)),
                                    ),
                                    enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          width: 1, color: Colors.grey),
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(10)),
                                    ),
                                  ),
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return "invalid field";
                                    }
                                    return null;
                                  },
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            width: deviceSize.width * 0.20,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                  "Index",
                                  style: TextStyle(
                                      fontSize: 11.5,
                                      fontWeight: FontWeight.w500),
                                ),
                                SizedBox(
                                  height: deviceSize.height * 0.008,
                                ),
                                Container(
                                  decoration: BoxDecoration(
                                      border: Border.all(color: Colors.grey),
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(10))),
                                  child: DropdownButton<String>(
                                    isExpanded: true,
                                    value: index,
                                    // icon: const Icon(Icons.arrow_downward),
                                    underline: Container(
                                      color: Colors.white,
                                    ),
                                    onChanged: (String? value) {
                                      // This is called when the user selects an item.
                                      // metrics[Constants.index] = value!;
                                      setState(() {
                                        index = value!;
                                      });
                                    },
                                    items: stockIndexes
                                        .map<DropdownMenuItem<String>>(
                                            (String value) {
                                      return DropdownMenuItem<String>(
                                        value: value,
                                        child: Padding(
                                          padding: EdgeInsets.only(
                                              left: deviceSize.width * 0.03),
                                          child: Text(
                                            value,
                                            style: TextStyle(fontSize: 12),
                                          ),
                                        ),
                                      );
                                    }).toList(),
                                  ),
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
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SizedBox(
                            width: deviceSize.width * 0.55,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    const Text(
                                      "Real Estate Worth",
                                      style: TextStyle(
                                          fontSize: 11.5,
                                          fontWeight: FontWeight.w500),
                                    ),
                                    InkWell(
                                      onTap: () {
                                        showDialog(
                                            context: context,
                                            builder: (_) {
                                              return showInfo(
                                                  "Total value of real estate holdings");
                                            });
                                      },
                                      child: Padding(
                                        padding: EdgeInsets.only(right: 9.0),
                                        child: SvgPicture.asset(
                                            "assets/info_icon.svg"),
                                      ),
                                    )
                                  ],
                                ),
                                SizedBox(
                                  height: deviceSize.height * 0.008,
                                ),
                                TextFormField(
                                    controller: realestateController,
                                    keyboardType: TextInputType.number,
                                    style: const TextStyle(fontSize: 12),
                                    decoration: const InputDecoration(
                                      border: OutlineInputBorder(
                                        borderSide: BorderSide(
                                            width: 1, color: Colors.grey),
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(10)),
                                      ),
                                      enabledBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                            width: 1, color: Colors.grey),
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(10)),
                                      ),
                                    ),
                                    validator: (value) {
                                      if (value!.isEmpty) {
                                        return "invalid field";
                                      }
                                      return null;
                                    }),
                              ],
                            ),
                          ),
                          SizedBox(
                            width: deviceSize.width * 0.20,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                  "Location",
                                  style: TextStyle(
                                      fontSize: 11.5,
                                      fontWeight: FontWeight.w500),
                                ),
                                SizedBox(
                                  height: deviceSize.height * 0.008,
                                ),
                                Container(
                                  decoration: BoxDecoration(
                                      border: Border.all(color: Colors.grey),
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(10))),
                                  child: DropdownButton<String>(
                                    isExpanded: true,
                                    value: location,
                                    // icon: const Icon(Icons.arrow_downward),
                                    underline: Container(
                                      color: Colors.white,
                                    ),
                                    onChanged: (String? value) {
                                      // This is called when the user selects an item.
                                      setState(() {
                                        // metrics[Constants.location] = value!;
                                        location = value!;
                                      });
                                    },
                                    items: locations
                                        .map<DropdownMenuItem<String>>(
                                            (String value) {
                                      return DropdownMenuItem<String>(
                                        value: value,
                                        child: Padding(
                                          padding: EdgeInsets.only(
                                              left: deviceSize.width * 0.07),
                                          child: Text(value),
                                        ),
                                      );
                                    }).toList(),
                                  ),
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
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SizedBox(
                            width: deviceSize.width * 0.55,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    const Text(
                                      "Gold",
                                      style: TextStyle(
                                          fontSize: 11.5,
                                          fontWeight: FontWeight.w500),
                                    ),
                                    InkWell(
                                      onTap: () {
                                        showDialog(
                                            context: context,
                                            builder: (_) {
                                              return showInfo(
                                                  "Total amount of gold owned");
                                            });
                                      },
                                      child: Padding(
                                        padding: EdgeInsets.only(right: 10.0),
                                        child: SvgPicture.asset(
                                            "assets/info_icon.svg"),
                                      ),
                                    )
                                  ],
                                ),
                                SizedBox(
                                  height: deviceSize.height * 0.008,
                                ),
                                TextFormField(
                                    controller: goldController,
                                    keyboardType: TextInputType.number,
                                    style: const TextStyle(fontSize: 12),
                                    decoration: const InputDecoration(
                                      border: OutlineInputBorder(
                                        borderSide: BorderSide(
                                            width: 1, color: Colors.grey),
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(10)),
                                      ),
                                      enabledBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                            width: 1, color: Colors.grey),
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(10)),
                                      ),
                                    ),
                                    validator: (value) {
                                      if (value!.isEmpty) {
                                        return "invalid field";
                                      }
                                      return null;
                                    }),
                              ],
                            ),
                          ),
                          SizedBox(
                            width: deviceSize.width * 0.20,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                  "Metric",
                                  style: TextStyle(
                                      fontSize: 11.5,
                                      fontWeight: FontWeight.w500),
                                ),
                                SizedBox(
                                  height: deviceSize.height * 0.008,
                                ),
                                Container(
                                  decoration: BoxDecoration(
                                      border: Border.all(color: Colors.grey),
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(10))),
                                  child: DropdownButton<String>(
                                    isExpanded: true,
                                    value: choosenMetric,
                                    // icon: const Icon(Icons.arrow_downward),
                                    underline: Container(
                                      color: Colors.white,
                                    ),
                                    onChanged: (String? value) {
                                      // This is called when the user selects an item.
                                      setState(() {
                                        // metrics[Constants.metric] = value!;
                                        choosenMetric = value!;
                                      });
                                    },
                                    items: metric.map<DropdownMenuItem<String>>(
                                        (String value) {
                                      return DropdownMenuItem<String>(
                                        value: value,
                                        child: Padding(
                                          padding: EdgeInsets.only(
                                              left: deviceSize.width * 0.06),
                                          child: Text(value),
                                        ),
                                      );
                                    }).toList(),
                                  ),
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
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SizedBox(
                            width: deviceSize.width * 0.55,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    const Text(
                                      "fixed Deposits",
                                      style: TextStyle(
                                          fontSize: 11.5,
                                          fontWeight: FontWeight.w500),
                                    ),
                                    InkWell(
                                      onTap: () {
                                        showDialog(
                                            context: context,
                                            builder: (_) {
                                              return showInfo(
                                                  "Total fixed deposits amount with respective interest");
                                            });
                                      },
                                      child: Padding(
                                        padding: EdgeInsets.only(right: 10.0),
                                        child: SvgPicture.asset(
                                            "assets/info_icon.svg"),
                                      ),
                                    )
                                  ],
                                ),
                                SizedBox(
                                  height: deviceSize.height * 0.008,
                                ),
                                TextFormField(
                                    controller: fixedDepositsController,
                                    keyboardType: TextInputType.number,
                                    style: const TextStyle(fontSize: 12),
                                    decoration: const InputDecoration(
                                      border: OutlineInputBorder(
                                        borderSide: BorderSide(
                                            width: 1, color: Colors.grey),
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(10)),
                                      ),
                                      enabledBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                            width: 1, color: Colors.grey),
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(10)),
                                      ),
                                    ),
                                    validator: (value) {
                                      if (value!.isEmpty) {
                                        return "invalid field";
                                      }
                                      return null;
                                    }),
                              ],
                            ),
                          ),
                          SizedBox(
                            width: deviceSize.width * 0.20,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                  "Interests(%)",
                                  style: TextStyle(
                                      fontSize: 11.5,
                                      fontWeight: FontWeight.w500),
                                ),
                                SizedBox(
                                  height: deviceSize.height * 0.008,
                                ),
                                TextFormField(
                                    style: const TextStyle(fontSize: 12),
                                    controller: interestController,
                                    keyboardType: TextInputType.number,
                                    textAlign: TextAlign.center,
                                    decoration: const InputDecoration(
                                      border: OutlineInputBorder(
                                        borderSide: BorderSide(
                                            width: 1, color: Colors.grey),
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(10)),
                                      ),
                                      enabledBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                            width: 1, color: Colors.grey),
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(10)),
                                      ),
                                    ),
                                    validator: (value) {
                                      if (value!.isEmpty) {
                                        return "invalid field";
                                      }
                                      return null;
                                    }),
                              ],
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: deviceSize.height * 0.03,
                      ),
                      const Text(
                        "Target",
                        style: TextStyle(
                            fontSize: 19, fontWeight: FontWeight.w600),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text(
                                "Current Cashflow",
                                style: TextStyle(
                                    fontSize: 11.5,
                                    fontWeight: FontWeight.w500),
                              ),
                              InkWell(
                                onTap: () {
                                  showDialog(
                                      context: context,
                                      builder: (_) {
                                        return showInfo(
                                            "Target cashflow per year after retirement");
                                      });
                                },
                                child: Padding(
                                  padding: EdgeInsets.only(right: 10.0),
                                  child:
                                      SvgPicture.asset("assets/info_icon.svg"),
                                ),
                              )
                            ],
                          ),
                          SizedBox(
                            height: deviceSize.height * 0.008,
                          ),
                          TextFormField(
                              style: const TextStyle(fontSize: 12),
                              controller: cashflowController,
                              keyboardType: TextInputType.number,
                              decoration: const InputDecoration(
                                border: OutlineInputBorder(
                                  borderSide:
                                      BorderSide(width: 1, color: Colors.grey),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10)),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderSide:
                                      BorderSide(width: 1, color: Colors.grey),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10)),
                                ),
                              ),
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return "invalid field";
                                }
                                return null;
                              }),
                        ],
                      ),
                      SizedBox(
                        height: deviceSize.height * 0.01,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text(
                                "Targeted networth",
                                style: TextStyle(
                                    fontSize: 11.5,
                                    fontWeight: FontWeight.w500),
                              ),
                              InkWell(
                                onTap: () {
                                  showDialog(
                                      context: context,
                                      builder: (_) {
                                        return showInfo(
                                            "Target net worth after retirement");
                                      });
                                },
                                child: Padding(
                                  padding: EdgeInsets.only(right: 10.0),
                                  child:
                                      SvgPicture.asset("assets/info_icon.svg"),
                                ),
                              )
                            ],
                          ),
                          SizedBox(
                            height: deviceSize.height * 0.008,
                          ),
                          TextFormField(
                              keyboardType: TextInputType.number,
                              controller: targetedNetworthController,
                              style: const TextStyle(fontSize: 12),
                              decoration: const InputDecoration(
                                border: OutlineInputBorder(
                                  borderSide:
                                      BorderSide(width: 1, color: Colors.grey),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10)),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderSide:
                                      BorderSide(width: 1, color: Colors.grey),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10)),
                                ),
                              ),
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return "invalid field";
                                }
                                return null;
                              }),
                        ],
                      ),
                      SizedBox(
                        height: deviceSize.height * 0.01,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text(
                                "Estimated Time For retirement",
                                style: TextStyle(
                                    fontSize: 11.5,
                                    fontWeight: FontWeight.w500),
                              ),
                              InkWell(
                                onTap: () {
                                  showDialog(
                                      context: context,
                                      builder: (_) {
                                        return showInfo(
                                            "Time left for retirement in years");
                                      });
                                },
                                child: Padding(
                                  padding: EdgeInsets.only(right: 10.0),
                                  child:
                                      SvgPicture.asset("assets/info_icon.svg"),
                                ),
                              )
                            ],
                          ),
                          SizedBox(
                            height: deviceSize.height * 0.008,
                          ),
                          TextFormField(
                              style: const TextStyle(fontSize: 12),
                              controller: retirementimeController,
                              keyboardType: TextInputType.number,
                              decoration: const InputDecoration(
                                border: OutlineInputBorder(
                                  borderSide:
                                      BorderSide(width: 1, color: Colors.grey),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10)),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderSide:
                                      BorderSide(width: 1, color: Colors.grey),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10)),
                                ),
                              ),
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return "invalid field";
                                }
                                return null;
                              }),
                        ],
                      ),
                      SizedBox(
                        height: deviceSize.height * 0.02,
                      ),
                      InkWell(
                        onTap: () {
                          if (_formkey.currentState!.validate()) {
                            investments[Constants.stock_investments] =
                                double.parse(stockController.text);

                            investments[Constants.real_estate_worth] =
                                double.parse(realestateController.text);

                            investments[Constants.interest] =
                                double.parse(interestController.text);

                            investments[Constants.gold] =
                                double.parse(goldController.text);

                            investments[Constants.fixed_deposits] =
                                double.parse(fixedDepositsController.text);

                            investments[Constants.current_cashflow] =
                                double.parse(cashflowController.text);

                            investments[Constants.targeted_networth] =
                                double.parse(targetedNetworthController.text);

                            investments[Constants.time_for_retirement] =
                                double.parse(retirementimeController.text);

                            metrics[Constants.index] = index;
                            metrics[Constants.location] = location;
                            metrics[Constants.metric] = choosenMetric;
                            // print(investments[Constants.time_for_retirement]);
                            Calculation(
                                context, metrics, investments, earningsdata);
                          }
                        },
                        child: Container(
                          height: 45,
                          width: 250,
                          decoration: BoxDecoration(
                              color: Color(Constants.secondary_color),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20)),
                              border: Border.all(
                                  color: Color(Constants.primary_color),
                                  width: 1.7)),
                          alignment: Alignment.center,
                          child: const Text(
                            "Get my plan",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 14,
                                fontWeight: FontWeight.w700),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: deviceSize.height * 0.05,
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
