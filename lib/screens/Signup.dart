import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:email_validator/email_validator.dart';
import 'package:retirement_app/screens/Investments.dart';
import '../constants.dart' as Constants;

class Signup extends StatefulWidget {
  const Signup({super.key});

  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  final _formkey = GlobalKey<FormState>();
  bool isLoading = false;
  final email = TextEditingController();
  final username = TextEditingController();
  final password = TextEditingController();
  final confirmpassword = TextEditingController();
  @override
  Widget build(BuildContext context) {
    var deviceSize = MediaQuery.of(context).size;
    return Scaffold(
      body: isLoading
          ? const Center(child: CircularProgressIndicator())
          : Form(
              key: _formkey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "Sign Up",
                    style: TextStyle(fontSize: 22),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(deviceSize.width * 0.16,
                        deviceSize.width * 0.05, deviceSize.width * 0.16, 0),
                    child: Column(
                      children: [
                        TextFormField(
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
                          controller: email,
                        ),
                        SizedBox(
                          height: deviceSize.height * 0.02,
                        ),
                        TextFormField(
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
                            hintText: "Username",
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
                            if (value!.isEmpty) {
                              return "Please enter a valid username";
                            }
                            return null;
                          },
                          controller: username,
                        ),
                        SizedBox(
                          height: deviceSize.height * 0.02,
                        ),
                        TextFormField(
                          style: const TextStyle(
                              fontSize: 14, color: Colors.black),
                          obscureText: true,
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
                          controller: password,
                        ),
                        SizedBox(
                          height: deviceSize.height * 0.02,
                        ),
                        TextFormField(
                          style: const TextStyle(
                              fontSize: 14, color: Colors.black),
                          obscureText: true,
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
                            hintText: "Confirm password",
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
                            if (value != password.text) {
                              return "password not matching";
                            }
                            return null;
                          },
                        ),
                        SizedBox(
                          height: deviceSize.height * 0.02,
                        ),
                        InkWell(
                          onTap: () async {
                            if (_formkey.currentState!.validate()) {
                              setState(() {
                                isLoading = true;
                              });
                              await registerUser(
                                  email.text, password.text, context);
                              setState(() {
                                isLoading = false;
                              });
                            }
                          },
                          child: Container(
                            height: 45,
                            width: 360,
                            alignment: Alignment.center,
                            decoration: const BoxDecoration(
                                color: Color(Constants.primary_color),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(15))),
                            child: const Text(
                              "Continue",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w600),
                            ),
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
                              style: TextStyle(fontSize: 12),
                            ),
                            SizedBox(
                              width: deviceSize.width * 0.009,
                            ),
                            InkWell(
                              onTap: () {
                                Navigator.of(context).pushNamed('/login');
                              },
                              child: const Text(
                                "Login",
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

  Future<void> registerUser(
      var email, var password, BuildContext context) async {
    try {
      UserCredential userCredential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      Navigator.of(context)
          .pushNamedAndRemoveUntil("/", (Route<dynamic> route) => false);
      // Navigator.of(context).pushNamed("/investments");
    } on FirebaseAuthException catch (err) {
      if (err.code == 'email-already-in-use') {
        const snackBar = SnackBar(
            content: Text('The account already exists for that email.'));
        ScaffoldMessenger.of(context).showSnackBar(snackBar);
      }
    } catch (e) {
      print(e);
    }
  }
}
