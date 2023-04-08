import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:email_validator/email_validator.dart';
import '../constants.dart' as Constants;

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final _formkey = GlobalKey<FormState>();
  final email = TextEditingController();
  final password = TextEditingController();
  bool isLoading = false;
  @override
  Widget build(BuildContext context) {
    var deviceSize = MediaQuery.of(context).size;
    return Scaffold(
      body: isLoading
          ? Center(child: CircularProgressIndicator())
          : Form(
              key: _formkey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "Login",
                    style: TextStyle(fontSize: 22),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(deviceSize.width * 0.16,
                        deviceSize.width * 0.05, deviceSize.width * 0.16, 0),
                    child: Column(
                      children: [
                        TextFormField(
                          controller: email,
                          style: const TextStyle(
                              fontSize: 14, color: Colors.black),
                          decoration: const InputDecoration(
                            filled: true,
                            fillColor: Colors.white,
                            border: OutlineInputBorder(
                              borderSide: BorderSide(
                                  width: 1,
                                  color: Color(Constants.primary_color)),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(15)),
                            ),
                            hintText: "Email",
                            hintStyle: TextStyle(
                              color: Color.fromARGB(255, 86, 87, 88),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  width: 1,
                                  color: Color(Constants.primary_color)),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(15)),
                            ),
                          ),
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
                          style: const TextStyle(
                              fontSize: 14, color: Colors.black),
                          decoration: const InputDecoration(
                            filled: true,
                            fillColor: Colors.white,
                            border: OutlineInputBorder(
                              borderSide: BorderSide(
                                  width: 1,
                                  color: Color(Constants.primary_color)),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(15)),
                            ),
                            hintText: "Password",
                            hintStyle: TextStyle(
                              color: Color.fromARGB(255, 86, 87, 88),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  width: 1,
                                  color: Color(Constants.primary_color)),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(15)),
                            ),
                          ),
                          validator: (value) {
                            if (value!.toString().length < 6) {
                              return "password length should be greater than 5";
                            }
                            return null;
                          },
                          obscureText: true,
                        ),
                        SizedBox(
                          height: deviceSize.height * 0.015,
                        ),
                        InkWell(
                          onTap: () async {
                            if (_formkey.currentState!.validate()) {
                              setState(() {
                                isLoading = true;
                              });
                              await signIn(email.text, password.text, context);
                              setState(() {
                                isLoading = false;
                              });
                            }
                          },
                          child: Container(
                            height: 45,
                            width: 360,
                            decoration: const BoxDecoration(
                                color: Color(Constants.primary_color),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(15))),
                            alignment: Alignment.center,
                            child: const Text(
                              "Continue",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w700),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: deviceSize.height * 0.02,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text(
                              "New user?",
                              style: TextStyle(fontSize: 12),
                            ),
                            SizedBox(
                              width: deviceSize.width * 0.009,
                            ),
                            InkWell(
                              onTap: () {
                                Navigator.of(context).pushNamed('/signup');
                              },
                              child: const Text(
                                "Sign up",
                                style: TextStyle(
                                    fontSize: 12,
                                    color: Color.fromARGB(255, 4, 198, 241)),
                              ),
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

  Future signIn(var email, var password, BuildContext context) async {
    try {
      UserCredential? credentials = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
      Navigator.of(context)
          .pushNamedAndRemoveUntil("/", (Route<dynamic> route) => false);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        const snackbar = SnackBar(content: Text("Invalid email"));
        ScaffoldMessenger.of(context).showSnackBar(snackbar);
      } else if (e.code == 'wrong-password') {
        const snackbar = SnackBar(content: Text("Invalid password"));
        ScaffoldMessenger.of(context).showSnackBar(snackbar);
      }
    }
  }
}
