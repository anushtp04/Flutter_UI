import 'package:assignments/sharedPreferenceLogin/loginPage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefRegPage extends StatefulWidget {
  const SharedPrefRegPage({Key? key}) : super(key: key);

  @override
  State<SharedPrefRegPage> createState() => _SharedPrefRegPageState();
}

class _SharedPrefRegPageState extends State<SharedPrefRegPage> {

  late SharedPreferences data;
  var name = TextEditingController();
  var phoneNumber = TextEditingController();
  var email = TextEditingController();
  var password = TextEditingController();

  @override
  void dispose() {
    name.dispose();
    phoneNumber.dispose();
    email.dispose();
    password.dispose();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.grey.shade200,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.app_registration,
                    size: 140,
                  ),
                  SizedBox(height: 10,),
                  Text("Registration Page",style: TextStyle(fontSize: 34,fontWeight: FontWeight.w600),)
                ],
              )),
          Expanded(
            flex: 2,
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 22),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    padding: EdgeInsets.only(left: 20),
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.black),
                        color: Colors.white60,
                        borderRadius: BorderRadius.circular(20)),
                    child: TextField(
                      controller: name,
                      decoration: InputDecoration(
                          hintText: "Your Name", border: InputBorder.none),
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
                      controller: phoneNumber,
                      decoration: InputDecoration(
                          hintText: "Phone Number", border: InputBorder.none),
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
                      controller: email,
                      decoration: InputDecoration(
                          hintText: "Email Id", border: InputBorder.none),
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
                      controller: password,
                      decoration: InputDecoration(
                          hintText: "Password", border: InputBorder.none),
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      ElevatedButton(
                          style: ButtonStyle(
                              backgroundColor:
                              MaterialStatePropertyAll(Color(0xFF0A2E9D)),
                              shape: MaterialStatePropertyAll(
                                  RoundedRectangleBorder(
                                      borderRadius:
                                      BorderRadius.circular(20))),
                              padding: MaterialStatePropertyAll(
                                  EdgeInsets.symmetric(
                                      horizontal: 40, vertical: 12))),
                          onPressed: () {
                            signUp();

                          },
                          child: Text("Sign Up"))
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Already Have an account ?"),
                      TextButton(onPressed: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => SharedPrefLogin(),));
                      }, child: Text("Log In"))
                    ],
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  void signUp() async {
    String userName = name.text;
    String phoneNum = phoneNumber.text;
    String userEmail = email.text;
    String userPassword = password.text;
     data = await SharedPreferences.getInstance();

    if(userName != "" && phoneNum != "" && userEmail != "" && userPassword != "") {
      print("clicked");
      data.setString("userName", userName);
      data.setString("userPhone", phoneNum);
      data.setString("userEmail", userEmail);
      data.setString("userPassword", userPassword);

      Navigator.push(context, MaterialPageRoute(builder: (context) => SharedPrefLogin(),));

    }
  }
}
