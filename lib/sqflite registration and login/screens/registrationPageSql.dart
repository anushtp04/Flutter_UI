import 'package:assignments/sqflite%20registration%20and%20login/screens/loginPageSql.dart';
import 'package:flutter/material.dart';

import '../sqlhelper/sqlHelper.dart';

class RegistrationPageSQL extends StatefulWidget {
  RegistrationPageSQL({Key? key}) : super(key: key);

  @override
  State<RegistrationPageSQL> createState() => _RegistrationPageSQLState();

}

class _RegistrationPageSQLState extends State<RegistrationPageSQL> {
  var _name = TextEditingController();

  var _email = TextEditingController();

  var _pass = TextEditingController();

  var _cpass = TextEditingController();

  var formKey2 = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {

    void addUser(String name, String email, String password) async {
      var id = await SQLHelper.addNewUser(name,email,password);

      if(id != null){
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => LoginPageSQL(),));
      }
      else{
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Something went wrong")));
      }
    }


    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      body: SingleChildScrollView(
        child: SafeArea(
          child: Form(
            key: formKey2,
            child: Column(
              children: [
                Container(
                  margin: EdgeInsets.only(top: 20),
                  height: MediaQuery.of(context).size.height * .3,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.app_registration,
                        size: 140,
                      ),
                      Text(
                        "Registration Page",
                        style: TextStyle(
                            fontSize: 34, fontWeight: FontWeight.w600),
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 22),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      TextFormField(
                        controller: _name,
                        validator: (name) {
                          if (name!.isEmpty) {
                            return "Enter your name";
                          } else {
                            return null;
                          }
                        },
                        textInputAction: TextInputAction.next,
                        decoration: InputDecoration(
                          hintText: "Name",
                          prefixIcon: Icon(Icons.person),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
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
                        textInputAction: TextInputAction.next,
                        controller: _email,
                        decoration: InputDecoration(
                            hintText: "Email Id",
                            prefixIcon: Icon(Icons.mail),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20))),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      TextFormField(
                        validator: (pass) {
                          if (pass!.isEmpty || pass.length < 6) {
                            return "Password length should be greater than 6";
                          } else {
                            return null;
                          }
                        },
                        textInputAction: TextInputAction.next,
                        controller: _pass,
                        obscureText: true,
                        decoration: InputDecoration(
                          hintText: "Password",
                          prefixIcon: Icon(Icons.lock),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20)),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      TextFormField(
                        validator: (pass1) {
                          if (pass1!.isEmpty || pass1.length < 6) {
                            return "Password length should be greater than 6";
                          } else if (_pass.text != _cpass.text) {
                            return "Password not matched";
                          } else {
                            return null;
                          }
                        },
                        obscureText: true,
                        textInputAction: TextInputAction.done,
                        controller: _cpass,
                        decoration: InputDecoration(
                            hintText: "Confirm Password",
                            prefixIcon: Icon(Icons.lock),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20))),
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
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
                              onPressed: () async{
                                final valid = formKey2.currentState!.validate();
                                if (valid) {
                                  String name = _name.text;
                                  String email = _email.text;
                                  String password = _pass.text;

                                  var data = await SQLHelper.userFound(name,email);

                                  if(data.isNotEmpty){
                                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("User already exist")));
                                  }
                                  else {
                                    addUser(name,email,password);
                                  }
                                }
                                else {
                                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                                      action:
                                      SnackBarAction(label: 'UNDO', onPressed: () {}),
                                      content: const Text('Invalid username / password')));
                                }
                              },
                              child: Text("Sign Up",style: TextStyle(fontSize: 16),))
                        ],
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("Already Have an account ?"),
                          TextButton(
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => LoginPageSQL(),
                                    ));
                              },
                              child: Text(
                                "Log In",
                                style: TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.w600),
                              ))
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
