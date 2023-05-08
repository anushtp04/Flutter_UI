import 'package:assignments/sqflite%20registration%20and%20login/screens/adminPage.dart';
import 'package:assignments/sqflite%20registration%20and%20login/screens/homePage.dart';
import 'package:assignments/sqflite%20registration%20and%20login/screens/registrationPageSql.dart';
import 'package:flutter/material.dart';

import '../sqlhelper/sqlHelper.dart';

class LoginPageSQL extends StatefulWidget {
  LoginPageSQL({Key? key}) : super(key: key);

  @override
  State<LoginPageSQL> createState() => _LoginPageSQLState();
}

class _LoginPageSQLState extends State<LoginPageSQL> {
  var _email = TextEditingController();
  var _password = TextEditingController();
  bool securetext = true;
  var formKey1 = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    void loginCheck(String email, String password) async {
      var data = await SQLHelper.checkLogin(email, password);
      if (email == "admin@gmail.com" && password == "12345678") {
        Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => AdminPageSQL(),
            ));
      } else if (data.isNotEmpty) {
        Navigator.pushReplacement(
            context,MaterialPageRoute(
              builder: (context) => HomePageSQL(data: data),
            ));
      } else {
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text("something went wrong")));
      }
    }

    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      body: SingleChildScrollView(
        child: SafeArea(
          child: Form(
            key: formKey1,
            child: Column(
              children: [
                Container(
                    margin: EdgeInsets.only(top: 20),
                    height: MediaQuery.of(context).size.height * .35,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.lock,
                          size: 140,
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          "Login Page",
                          style: TextStyle(
                              fontSize: 34, fontWeight: FontWeight.w600),
                        )
                      ],
                    )),
                SizedBox(
                  height: 10,
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 22),
                  child: Column(
                    children: [
                      TextFormField(
                        validator: (email) {
                          if (email!.isEmpty ||
                              !email.contains("@") ||
                              !email.contains(".")) {
                            return "enter valid email id";
                          } else {
                            return null;
                          }
                        },
                        controller: _email,
                        decoration: InputDecoration(
                            hintText: "Email",
                            prefixIcon: Icon(Icons.person),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20))),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      TextFormField(
                        validator: (pass) {
                          if (pass!.isEmpty || pass.length < 6) {
                            return "Password should be greater than 6";
                          }
                        },
                        controller: _password,
                        obscureText: securetext,
                        decoration: InputDecoration(
                            hintText: "Password",
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20)),
                            prefixIcon: Icon(Icons.lock),
                            suffixIcon: IconButton(
                              onPressed: () {
                                setState(() {
                                  if (securetext) {
                                    securetext = false;
                                  } else {
                                    securetext = true;
                                  }
                                });
                              },
                              icon: Icon(
                                securetext
                                    ? Icons.visibility_off
                                    : Icons.visibility,
                                color: Colors.grey,
                              ),
                            )),
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          TextButton(
                            onPressed: () {},
                            child: Text(
                              "Forgot Password?",
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.bold),
                            ),
                          ),
                          ElevatedButton(
                              style: ButtonStyle(
                                  backgroundColor: MaterialStatePropertyAll(
                                      Color(0xFF0A2E9D)),
                                  shape: MaterialStatePropertyAll(
                                      RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(20))),
                                  padding: MaterialStatePropertyAll(
                                      EdgeInsets.symmetric(
                                          horizontal: 40, vertical: 13))),
                              onPressed: () {
                                final valid1 =
                                    formKey1.currentState!.validate();

                                if (valid1) {
                                  loginCheck(_email.text, _password.text);
                                }
                              },
                              child: Text(
                                "Log In",
                                style: TextStyle(fontSize: 16),
                              ))
                        ],
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("Don't You Have an account ?"),
                          TextButton(
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          RegistrationPageSQL(),
                                    ));
                              },
                              child: Text("Sign Up",
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w600)))
                        ],
                      ),
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
