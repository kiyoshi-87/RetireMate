import 'package:flutter/material.dart';
import 'package:email_validator/email_validator.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final _formkey = GlobalKey<FormState>();
  final email = TextEditingController();
  final password = TextEditingController();
  @override
  Widget build(BuildContext context) {
    var deviceSize = MediaQuery.of(context).size;
    return Scaffold(
      body: Form(
        key: _formkey,
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
                    controller: email,
                    style: const TextStyle(fontSize: 12),
                    decoration: const InputDecoration(
                        border: OutlineInputBorder(
                          borderSide: BorderSide(width: 1, color: Colors.grey),
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                        ),
                        labelText: "Email",
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(width: 1, color: Colors.grey),
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                        ),
                        labelStyle: TextStyle(
                            fontSize: 10,
                            color: Color(0xFF383c3e),
                            fontWeight: FontWeight.w500)),
                    validator: (value) {
                      return EmailValidator.validate(value!)
                          ? null
                          : "please enter a valid email";
                    },
                  ),
                  SizedBox(
                    height: deviceSize.height * 0.02,
                  ),
                  TextFormField(
                    controller: password,
                    style: const TextStyle(fontSize: 12),
                    decoration: const InputDecoration(
                        border: OutlineInputBorder(
                          borderSide: BorderSide(width: 1, color: Colors.grey),
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                        ),
                        labelText: "Password",
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(width: 1, color: Colors.grey),
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                        ),
                        labelStyle: TextStyle(
                            fontSize: 10,
                            color: Color(0xFF383c3e),
                            fontWeight: FontWeight.w500)),
                    validator: (value) {
                      if (value!.toString().length < 6) {
                        return "password length should be greater than 5";
                      }
                      return null;
                    },
                  ),
                  SizedBox(
                    height: deviceSize.height * 0.015,
                  ),
                  InkWell(
                    onTap: () {
                      if (_formkey.currentState!.validate()) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text('Processing Data')),
                        );
                      }
                    },
                    child: Container(
                      height: 30,
                      width: 360,
                      color: const Color(0xFF003AB1),
                      alignment: Alignment.center,
                      child: const Text(
                        "Continue",
                        style: TextStyle(color: Colors.white, fontSize: 12),
                      ),
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
