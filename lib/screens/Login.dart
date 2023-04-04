import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    var deviceSize = MediaQuery.of(context).size;
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              "Login",
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
                        labelText: "Password",
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
                    height: deviceSize.height * 0.015,
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
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
