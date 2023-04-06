import 'package:flutter/material.dart';

class Earnings extends StatefulWidget {
  const Earnings({super.key});

  @override
  State<Earnings> createState() => _EarningsState();
}

class _EarningsState extends State<Earnings> {
  @override
  Widget build(BuildContext context) {
    var deviceSize = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              SizedBox(
                height: deviceSize.height * 0.07,
              ),
              const Text(
                "Earnings and Expenses",
                style: TextStyle(fontSize: 19, fontWeight: FontWeight.w600),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(deviceSize.width * 0.1,
                    deviceSize.width * 0.05, deviceSize.width * 0.1, 0),
                child: Column(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "Current Earning",
                          style: TextStyle(
                              fontSize: 11.5, fontWeight: FontWeight.w500),
                        ),
                        SizedBox(
                          height: deviceSize.height * 0.008,
                        ),
                        TextFormField(
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
                                "Yearly Increment",
                                style: TextStyle(
                                    fontSize: 11.5,
                                    fontWeight: FontWeight.w500),
                              ),
                              SizedBox(
                                height: deviceSize.height * 0.008,
                              ),
                              TextFormField(
                                style: const TextStyle(fontSize: 12),
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
                                "Inflation",
                                style: TextStyle(
                                    fontSize: 11.5,
                                    fontWeight: FontWeight.w500),
                              ),
                              SizedBox(
                                height: deviceSize.height * 0.008,
                              ),
                              TextFormField(
                                style: const TextStyle(fontSize: 12),
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
                              ),
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
                              fontSize: 11.5, fontWeight: FontWeight.w500),
                        ),
                        SizedBox(
                          height: deviceSize.height * 0.008,
                        ),
                        TextFormField(
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
                          "EMIs",
                          style: TextStyle(
                              fontSize: 11.5, fontWeight: FontWeight.w600),
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
                                "%",
                                style: TextStyle(
                                    fontSize: 11.5,
                                    fontWeight: FontWeight.w500),
                              ),
                              SizedBox(
                                height: deviceSize.height * 0.008,
                              ),
                              TextFormField(
                                style: const TextStyle(fontSize: 12),
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
                                "Months",
                                style: TextStyle(
                                    fontSize: 11.5,
                                    fontWeight: FontWeight.w500),
                              ),
                              SizedBox(
                                height: deviceSize.height * 0.008,
                              ),
                              TextFormField(
                                style: const TextStyle(fontSize: 12),
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
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: deviceSize.height * 0.01,
                    ),
                    // Row(
                    //   mainAxisAlignment: MainAxisAlignment.start,
                    //   children: [
                    //     Container(
                    //       height: 30,
                    //       width: 60,
                    //       color: const Color(0xFF003AB1),
                    //       alignment: Alignment.center,
                    //       child: const Text(
                    //         "Add",
                    //         style: TextStyle(color: Colors.white, fontSize: 12),
                    //       ),
                    //     ),
                    //   ],
                    // ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: const [
                        Text(
                          "Loans",
                          style: TextStyle(
                              fontSize: 11.5, fontWeight: FontWeight.w600),
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
                                "%",
                                style: TextStyle(
                                    fontSize: 11.5,
                                    fontWeight: FontWeight.w500),
                              ),
                              SizedBox(
                                height: deviceSize.height * 0.008,
                              ),
                              TextFormField(
                                style: const TextStyle(fontSize: 12),
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
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          width: deviceSize.width * 0.10,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                "Years",
                                style: TextStyle(
                                    fontSize: 9, fontWeight: FontWeight.w500),
                              ),
                              SizedBox(
                                height: deviceSize.height * 0.008,
                              ),
                              TextFormField(
                                style: const TextStyle(fontSize: 12),
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
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          width: deviceSize.width * 0.10,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                "Interest",
                                style: TextStyle(
                                    fontSize: 9, fontWeight: FontWeight.w500),
                              ),
                              SizedBox(
                                height: deviceSize.height * 0.008,
                              ),
                              TextFormField(
                                style: const TextStyle(fontSize: 12),
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
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
