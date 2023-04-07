import 'dart:collection';
import '../constants.dart' as Constants;
import 'package:flutter/material.dart';
import '../utils/earningsdata.dart';

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
  @override
  Widget build(BuildContext context) {
    var deviceSize = MediaQuery.of(context).size;

    return Scaffold(
      body: Form(
        key: _formkey,
        child: SingleChildScrollView(
          child: Center(
            child: Column(
              children: [
                SizedBox(
                  height: deviceSize.height * 0.03,
                ),
                const Text(
                  "Investments",
                  style: TextStyle(fontSize: 19, fontWeight: FontWeight.w600),
                ),
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
                                const Text(
                                  "Stock Investments",
                                  style: TextStyle(
                                      fontSize: 11.5,
                                      fontWeight: FontWeight.w500),
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
                                      metrics[Constants.index] = value!;
                                      setState(() {
                                        index = value;
                                      });
                                    },
                                    items: stockIndexes
                                        .map<DropdownMenuItem<String>>(
                                            (String value) {
                                      return DropdownMenuItem<String>(
                                        value: value,
                                        child: Text(value),
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
                                const Text(
                                  "Real Estate Worth",
                                  style: TextStyle(
                                      fontSize: 11.5,
                                      fontWeight: FontWeight.w500),
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
                                        metrics[Constants.location] = value!;
                                        location = value;
                                      });
                                    },
                                    items: locations
                                        .map<DropdownMenuItem<String>>(
                                            (String value) {
                                      return DropdownMenuItem<String>(
                                        value: value,
                                        child: Text(value),
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
                                const Text(
                                  "Gold",
                                  style: TextStyle(
                                      fontSize: 11.5,
                                      fontWeight: FontWeight.w500),
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
                                        metrics[Constants.metric] = value!;
                                        choosenMetric = value;
                                      });
                                    },
                                    items: metric.map<DropdownMenuItem<String>>(
                                        (String value) {
                                      return DropdownMenuItem<String>(
                                        value: value,
                                        child: Text(value),
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
                                const Text(
                                  "fixed Deposits",
                                  style: TextStyle(
                                      fontSize: 11.5,
                                      fontWeight: FontWeight.w500),
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
                                  "Interests",
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
                          const Text(
                            "Current Cashflow",
                            style: TextStyle(
                                fontSize: 11.5, fontWeight: FontWeight.w500),
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
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            "Targeted networth",
                            style: TextStyle(
                                fontSize: 11.5, fontWeight: FontWeight.w500),
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
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            "Estimated Time For retirement",
                            style: TextStyle(
                                fontSize: 11.5, fontWeight: FontWeight.w500),
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
                          }
                          // investments.forEach((key, value) {
                          //   print("${key} ${value}");
                          // });
                          print(earningsdata.earnings);
                        },
                        child: Container(
                          height: 30,
                          width: 200,
                          color: const Color(0xFF003AB1),
                          alignment: Alignment.center,
                          child: const Text(
                            "Get my plan",
                            style: TextStyle(color: Colors.white, fontSize: 12),
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
