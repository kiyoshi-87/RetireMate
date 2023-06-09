import 'dart:collection';
import 'package:flutter/material.dart';
import '../constants.dart' as Constants;
import '../models/earningsdata.dart';
import 'HomePage.dart';

class Earnings extends StatefulWidget {
  const Earnings({super.key});

  @override
  State<Earnings> createState() => _EarningsState();
}

class _EarningsState extends State<Earnings> {
  List<Emidetails> emidetailsList = [Emidetails()];
  List<LoanDetails> loanDetailsList = [LoanDetails()];
  addDynamicEmi() {
    emidetailsList.add(new Emidetails());
    setState(() {});
  }

  delDynamicEmi() {
    if (emidetailsList.length == 1) return;
    emidetailsList.removeLast();
    setState(() {});
  }

  addDynamicLoan() {
    loanDetailsList.add(new LoanDetails());
    setState(() {});
  }

  delDynamicLoan() {
    if (loanDetailsList.length == 1) return;
    loanDetailsList.removeLast();
    setState(() {});
  }

  //form key
  final _formkey = GlobalKey<FormState>();
  //textfield controllers
  final currentEarning = TextEditingController();
  final yearlyIncrement = TextEditingController();
  final inflation = TextEditingController();
  final monthlyExpenses = TextEditingController();

  // datastructures to store and send the data
  final Map<String, double> earnings = HashMap();
  List<List<double>> emi = [];
  List<List<double>> loan = [];

  //submit the data
  submitEmiDetails() {
    emi.clear();
    emidetailsList.forEach((element) {
      double amount = double.parse(element.amountController.text);
      double months = double.parse(element.monthscontroller.text);
      emi.add([amount, months]);
    });
  }

  submitLoanDetails() {
    loan.clear();
    loanDetailsList.forEach((element) {
      double amount = double.parse(element.amountController.text);
      double years = double.parse(element.yearscontroller.text);
      double interest = double.parse(element.interestcontroller.text);
      loan.add([amount, years, interest]);
    });
  }

  @override
  Widget build(BuildContext context) {
    var deviceSize = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Padding(
          padding: EdgeInsets.only(left: deviceSize.width * 0.07),
          child: const Text("Earnings and Expenses"),
        ),
        leading: BackButton(onPressed: () {
          Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(builder: (_) => Homepage(resultData: null)),
              (route) => false);
        }),
      ),
      body: Form(
        key: _formkey,
        child: ListView(
          children: [
            Padding(
              padding: EdgeInsets.fromLTRB(deviceSize.width * 0.1,
                  deviceSize.width * 0.05, deviceSize.width * 0.1, 0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "Annual Income",
                        style: TextStyle(
                            fontSize: 13, fontWeight: FontWeight.w500),
                      ),
                      SizedBox(
                        height: deviceSize.height * 0.008,
                      ),
                      TextFormField(
                        style: const TextStyle(fontSize: 14),
                        keyboardType: TextInputType.number,
                        controller: currentEarning,
                        // initialValue: "0.0",
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(
                            borderSide:
                                BorderSide(width: 1, color: Colors.grey),
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(width: 1, color: Colors.grey),
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                          ),
                        ),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "please fill this field";
                          }
                          return null;
                        },
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
                        width: deviceSize.width * 0.37,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              "Yearly Increment(%)",
                              style: TextStyle(
                                  fontSize: 13, fontWeight: FontWeight.w500),
                            ),
                            SizedBox(
                              height: deviceSize.height * 0.008,
                            ),
                            TextFormField(
                              style: const TextStyle(fontSize: 14),
                              // initialValue: "0.0",
                              controller: yearlyIncrement,
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
                                  return "please fill this field";
                                }
                                return null;
                              },
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        width: deviceSize.width * 0.37,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              "Inflation(%)",
                              style: TextStyle(
                                  fontSize: 13, fontWeight: FontWeight.w500),
                            ),
                            SizedBox(
                              height: deviceSize.height * 0.008,
                            ),
                            TextFormField(
                                style: const TextStyle(fontSize: 14),
                                // initialValue: "0.0",
                                controller: inflation,
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
                                    return "please fill this field";
                                  }
                                  return null;
                                }),
                          ],
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: deviceSize.height * 0.01,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "Monthly Expenses",
                        style: TextStyle(
                            fontSize: 13, fontWeight: FontWeight.w500),
                      ),
                      SizedBox(
                        height: deviceSize.height * 0.008,
                      ),
                      TextFormField(
                          style: const TextStyle(fontSize: 14),
                          // initialValue: "0.0",
                          controller: monthlyExpenses,
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
                              return "please fill this field";
                            }
                            return null;
                          }),
                    ],
                  ),
                  SizedBox(
                    height: deviceSize.height * 0.01,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: const [
                      Text(
                        "EMIs",
                        style: TextStyle(
                            fontSize: 13, fontWeight: FontWeight.w600),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: deviceSize.height * 0.015,
                  ),
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ListView.builder(
                          shrinkWrap: true,
                          itemCount: emidetailsList.length,
                          itemBuilder: (_, index) => emidetailsList[index]),
                      SizedBox(
                        height: deviceSize.height * 0.01,
                      ),
                      Row(
                        children: [
                          InkWell(
                            onTap: addDynamicEmi,
                            child: Container(
                              height: 25,
                              width: 30,
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                  color: Color(Constants.secondary_color),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10)),
                                  border: Border.all(
                                      color: Color(Constants.primary_color),
                                      width: 1.7)),
                              child: const Text(
                                "+",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 16),
                              ),
                            ),
                          ),
                          SizedBox(
                            width: deviceSize.width * 0.01,
                          ),
                          InkWell(
                            onTap: delDynamicEmi,
                            child: Container(
                              height: 25,
                              width: 30,
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                  color: Color(Constants.secondary_color),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10)),
                                  border: Border.all(
                                      color: Color(Constants.primary_color),
                                      width: 1.7)),
                              child: const Text(
                                "-",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 16),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(
                    height: deviceSize.height * 0.015,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: const [
                      Text(
                        "Loans",
                        style: TextStyle(
                            fontSize: 13, fontWeight: FontWeight.w600),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: deviceSize.height * 0.01,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      ListView.builder(
                          shrinkWrap: true,
                          itemCount: loanDetailsList.length,
                          itemBuilder: (_, index) => loanDetailsList[index]),
                      SizedBox(
                        height: deviceSize.height * 0.015,
                      ),
                      Row(
                        children: [
                          InkWell(
                            onTap: addDynamicLoan,
                            child: Container(
                              height: 25,
                              width: 30,
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                  color: Color(Constants.secondary_color),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10)),
                                  border: Border.all(
                                      color: Color(Constants.primary_color),
                                      width: 1.7)),
                              child: const Text(
                                "+",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 16),
                              ),
                            ),
                          ),
                          SizedBox(
                            width: deviceSize.width * 0.01,
                          ),
                          InkWell(
                            onTap: delDynamicLoan,
                            child: Container(
                              height: 25,
                              width: 30,
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                  color: Color(Constants.secondary_color),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10)),
                                  border: Border.all(
                                      color: Color(Constants.primary_color),
                                      width: 1.7)),
                              child: const Text(
                                "-",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 16),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(
                    height: deviceSize.height * 0.03,
                  ),
                  InkWell(
                    onTap: () {
                      if (_formkey.currentState!.validate()) {
                        //inserting the form values in map
                        earnings[Constants.current_earnings] =
                            double.parse(currentEarning.text);
                        earnings[Constants.yearly_increment] =
                            double.parse(yearlyIncrement.text);
                        earnings[Constants.monthly_expenses] =
                            double.parse(monthlyExpenses.text);
                        earnings[Constants.inflation] =
                            double.parse(inflation.text);

                        submitEmiDetails();
                        submitLoanDetails();
                        final obj = EarningsData(emi, loan, earnings);
                        // print(obj.emi);
                        Navigator.of(context)
                            .pushNamed("/investments", arguments: obj);
                      }
                    },
                    child: Container(
                      height: 45,
                      width: 300,
                      decoration: BoxDecoration(
                          color: Color(Constants.secondary_color),
                          borderRadius: BorderRadius.all(Radius.circular(20)),
                          border: Border.all(
                              color: Color(Constants.primary_color),
                              width: 1.7)),
                      alignment: Alignment.center,
                      child: const Text(
                        "Continue",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 14,
                            fontWeight: FontWeight.w700),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: deviceSize.height * 0.03,
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class Emidetails extends StatelessWidget {
  Emidetails({super.key});
  TextEditingController amountController = TextEditingController();
  TextEditingController monthscontroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var deviceSize = MediaQuery.of(context).size;
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        SizedBox(
          width: deviceSize.width * 0.55,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Amount",
                style: TextStyle(fontSize: 10, fontWeight: FontWeight.w300),
              ),
              SizedBox(
                height: deviceSize.height * 0.008,
              ),
              TextFormField(
                  controller: amountController,
                  style: const TextStyle(fontSize: 14),
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(
                      borderSide: BorderSide(width: 1, color: Colors.grey),
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(width: 1, color: Colors.grey),
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                    ),
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "invalid";
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
                "Months",
                style: TextStyle(fontSize: 10, fontWeight: FontWeight.w300),
              ),
              SizedBox(
                height: deviceSize.height * 0.008,
              ),
              TextFormField(
                  controller: monthscontroller,
                  style: const TextStyle(fontSize: 14),
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(
                      borderSide: BorderSide(width: 1, color: Colors.grey),
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(width: 1, color: Colors.grey),
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                    ),
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "invalid";
                    }
                    return null;
                  }),
            ],
          ),
        ),
      ],
    );
  }
}

class LoanDetails extends StatelessWidget {
  LoanDetails({super.key});
  TextEditingController amountController = TextEditingController();
  TextEditingController yearscontroller = TextEditingController();
  TextEditingController interestcontroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var deviceSize = MediaQuery.of(context).size;
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        SizedBox(
          width: deviceSize.width * 0.35,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Amount",
                style: TextStyle(fontSize: 10, fontWeight: FontWeight.w300),
              ),
              SizedBox(
                height: deviceSize.height * 0.008,
              ),
              TextFormField(
                  style: const TextStyle(fontSize: 14),
                  controller: amountController,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(
                      borderSide: BorderSide(width: 1, color: Colors.grey),
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(width: 1, color: Colors.grey),
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                    ),
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "invalid";
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
                "Years",
                style: TextStyle(fontSize: 10, fontWeight: FontWeight.w300),
              ),
              SizedBox(
                height: deviceSize.height * 0.008,
              ),
              TextFormField(
                  style: const TextStyle(fontSize: 14),
                  controller: yearscontroller,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(
                      borderSide: BorderSide(width: 1, color: Colors.grey),
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(width: 1, color: Colors.grey),
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                    ),
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "invalid";
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
                "Interest",
                style: TextStyle(fontSize: 10, fontWeight: FontWeight.w300),
              ),
              SizedBox(
                height: deviceSize.height * 0.008,
              ),
              TextFormField(
                  style: const TextStyle(fontSize: 14),
                  controller: interestcontroller,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(
                      borderSide: BorderSide(width: 1, color: Colors.grey),
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(width: 1, color: Colors.grey),
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                    ),
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "invalid";
                    }
                    return null;
                  }),
            ],
          ),
        ),
      ],
    );
  }
}
