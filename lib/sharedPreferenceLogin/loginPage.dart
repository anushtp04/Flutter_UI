import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'homePage.dart';
import 'registrationPage.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: SharedPrefLogin(),
  ));
}

class SharedPrefLogin extends StatefulWidget {
  const SharedPrefLogin({Key? key}) : super(key: key);

  @override
  State<SharedPrefLogin> createState() => _ShState();
}

class _ShState extends State<SharedPrefLogin> {

  late SharedPreferences data;
  var _email = TextEditingController();
  var _password = TextEditingController();

  late bool newUser;

  @override
  void initState() {
    checkUser();
    super.initState();
  }

  void checkUser() async{
    data = await SharedPreferences.getInstance();

    newUser = (data.getBool("newUser") ?? true);

    if(newUser == false){
      Navigator.push(context, MaterialPageRoute(builder: (context) => SharedHomePage(),));
    }


  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.lock,
                size: 140,
              ),
              SizedBox(height: 10,),
              Text("Login Page",style: TextStyle(fontSize: 34,fontWeight: FontWeight.w600),)
            ],
          )),
          Expanded(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 22),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Container(
                      padding: EdgeInsets.only(left: 20),
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.black),
                          color: Colors.white60,
                          borderRadius: BorderRadius.circular(20)),
                      child: TextField(
                        controller: _email,
                        decoration: InputDecoration(
                            hintText: "Email", border: InputBorder.none),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                      padding: EdgeInsets.only(left: 20),
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.black),
                          color: Colors.white60,
                          borderRadius: BorderRadius.circular(20)),
                      child: TextField(
                        controller: _password,
                        decoration: InputDecoration(
                            hintText: "Password", border: InputBorder.none),
                      ),
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
                                fontSize: 15, fontWeight: FontWeight.bold),
                          ),
                        ),
                        ElevatedButton(
                            style: ButtonStyle(
                                backgroundColor:
                                    MaterialStatePropertyAll(Color(0xFF0A2E9D)),
                                shape: MaterialStatePropertyAll(
                                    RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(20))),
                                padding: MaterialStatePropertyAll(
                                    EdgeInsets.symmetric(
                                        horizontal: 40, vertical: 12))),
                            onPressed: () {
                              login();
                            },
                            child: Text("Log In"))
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
                                    builder: (context) => SharedPrefRegPage(),
                                  ));
                            },
                            child: Text("Sign Up"))
                      ],
                    ),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  void login() async {
    String loginEmail = _email.text;
    String loginPassword = _password.text;

    String regEmail = data.getString("userEmail")!;
    String regPassword = data.getString("userPassword")!;

    if(loginEmail == regEmail && loginPassword == regPassword){
      data.setBool("newUser", false);
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => SharedHomePage(),));
    }

  }
}
