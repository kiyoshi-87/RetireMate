import 'package:flutter/material.dart';

class Investments extends StatefulWidget {
  const Investments({super.key});

  @override
  State<Investments> createState() => _InvestmentsState();
}

class _InvestmentsState extends State<Investments> {
  @override
  Widget build(BuildContext context) {
    var deviceSize = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
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
                                "Exchange",
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
                                "Location",
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
                                "Metric",
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
                      height: deviceSize.height * 0.03,
                    ),
                    const Text(
                      "Target",
                      style:
                          TextStyle(fontSize: 19, fontWeight: FontWeight.w600),
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
                      height: deviceSize.height * 0.02,
                    ),
                    Container(
                      height: 30,
                      width: 200,
                      color: const Color(0xFF003AB1),
                      alignment: Alignment.center,
                      child: const Text(
                        "Get my plan",
                        style: TextStyle(color: Colors.white, fontSize: 12),
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
    );
  }
}
