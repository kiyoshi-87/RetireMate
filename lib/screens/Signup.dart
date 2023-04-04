import 'package:flutter/material.dart';

class Signup extends StatefulWidget {
  const Signup({super.key});

  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  @override
  Widget build(BuildContext context) {
    var deviceSize = MediaQuery.of(context).size;
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              "Sign Up",
              style: TextStyle(fontSize: 22),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(deviceSize.width * 0.1,
                  deviceSize.width * 0.1, deviceSize.width * 0.1, 0),
              child: Column(
                children: [
                  TextFormField(
                    style: const TextStyle(fontSize: 12),
                    decoration: const InputDecoration(
                        labelText: "Email",
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(width: 1, color: Colors.grey),
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                        ),
                        labelStyle: TextStyle(
                            fontSize: 10,
                            color: Color(0xFF383c3e),
                            fontWeight: FontWeight.w500)),
                  ),
                  SizedBox(
                    height: deviceSize.height * 0.02,
                  ),
                  TextFormField(
                    style: const TextStyle(fontSize: 12),
                    decoration: const InputDecoration(
                        labelText: "Username",
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(width: 1, color: Colors.grey),
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                        ),
                        labelStyle: TextStyle(
                            fontSize: 10,
                            color: Color(0xFF383c3e),
                            fontWeight: FontWeight.w500)),
                  ),
                  SizedBox(
                    height: deviceSize.height * 0.02,
                  ),
                  TextFormField(
                    style: const TextStyle(fontSize: 12),
                    decoration: const InputDecoration(
                        labelText: "password",
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(width: 1, color: Colors.grey),
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                        ),
                        labelStyle: TextStyle(
                            fontSize: 10,
                            color: Color(0xFF383c3e),
                            fontWeight: FontWeight.w500)),
                  ),
                  SizedBox(
                    height: deviceSize.height * 0.02,
                  ),
                  TextFormField(
                    style: const TextStyle(fontSize: 12),
                    decoration: const InputDecoration(
                        labelText: "Confirm password",
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(width: 1, color: Colors.grey),
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                        ),
                        labelStyle: TextStyle(
                            fontSize: 10,
                            color: Color(0xFF383c3e),
                            fontWeight: FontWeight.w500)),
                  ),
                  SizedBox(
                    height: deviceSize.height * 0.02,
                  ),
                  Container(
                    height: 30,
                    width: 360,
                    color: const Color(0xFF003AB1),
                    alignment: Alignment.center,
                    child: const Text(
                      "Continue",
                      style: TextStyle(color: Colors.white, fontSize: 12),
                    ),
                  ),
                  SizedBox(
                    height: deviceSize.height * 0.015,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        "Already an user?",
                        style: TextStyle(fontSize: 10),
                      ),
                      SizedBox(
                        width: deviceSize.width * 0.009,
                      ),
                      const Text(
                        "Login",
                        style: TextStyle(
                            fontSize: 10,
                            color: Color.fromARGB(255, 4, 198, 241)),
                      ),
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
