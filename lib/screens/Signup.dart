import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:email_validator/email_validator.dart';
import 'package:retirement_app/screens/Investments.dart';

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
                    padding: EdgeInsets.fromLTRB(deviceSize.width * 0.1,
                        deviceSize.width * 0.1, deviceSize.width * 0.1, 0),
                    child: Column(
                      children: [
                        TextFormField(
                          style: const TextStyle(fontSize: 12),
                          decoration: const InputDecoration(
                              border: OutlineInputBorder(
                                borderSide:
                                    BorderSide(width: 1, color: Colors.grey),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10)),
                              ),
                              labelText: "Email",
                              enabledBorder: OutlineInputBorder(
                                borderSide:
                                    BorderSide(width: 1, color: Colors.grey),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10)),
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
                          controller: email,
                        ),
                        SizedBox(
                          height: deviceSize.height * 0.02,
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
                              labelText: "Username",
                              enabledBorder: OutlineInputBorder(
                                borderSide:
                                    BorderSide(width: 1, color: Colors.grey),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10)),
                              ),
                              labelStyle: TextStyle(
                                  fontSize: 10,
                                  color: Color(0xFF383c3e),
                                  fontWeight: FontWeight.w500)),
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
                          style: const TextStyle(fontSize: 12),
                          obscureText: true,
                          decoration: const InputDecoration(
                              border: OutlineInputBorder(
                                borderSide:
                                    BorderSide(width: 1, color: Colors.grey),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10)),
                              ),
                              labelText: "password",
                              enabledBorder: OutlineInputBorder(
                                borderSide:
                                    BorderSide(width: 1, color: Colors.grey),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10)),
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
                          controller: password,
                        ),
                        SizedBox(
                          height: deviceSize.height * 0.02,
                        ),
                        TextFormField(
                          style: const TextStyle(fontSize: 12),
                          obscureText: true,
                          decoration: const InputDecoration(
                              border: OutlineInputBorder(
                                borderSide:
                                    BorderSide(width: 1, color: Colors.grey),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10)),
                              ),
                              labelText: "Confirm password",
                              enabledBorder: OutlineInputBorder(
                                borderSide:
                                    BorderSide(width: 1, color: Colors.grey),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10)),
                              ),
                              labelStyle: TextStyle(
                                  fontSize: 10,
                                  color: Color(0xFF383c3e),
                                  fontWeight: FontWeight.w500)),
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
                            height: 30,
                            width: 360,
                            color: const Color(0xFF003AB1),
                            alignment: Alignment.center,
                            child: const Text(
                              "Continue",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 12),
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
                              style: TextStyle(fontSize: 10),
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
                                    fontSize: 10,
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
