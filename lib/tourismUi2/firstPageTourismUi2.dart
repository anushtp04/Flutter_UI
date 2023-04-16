import 'package:assignments/tourismUi2/secondPageTourismUi2.dart';
import 'package:assignments/tourismUi2/thirdPage.dart';
import 'package:assignments/tourismUi2/util/loginpageContainer.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

void main(){

  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(statusBarColor: Colors.transparent));
  runApp(
      MaterialApp(
        home:  LoginPage(),
        routes: {
          "secondpage" : (context) => HotelPage()
        },
        debugShowCheckedModeBanner: false,
      ));
}

class LoginPage extends StatefulWidget {

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {

    final TextStyle style = TextStyle(
      color: Colors.white,
      fontSize: 16,fontWeight: FontWeight.bold);

    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        height: double.infinity,
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: 150,
              width: 150,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("assets/images/tourism2/logo.jpg"),
                  fit: BoxFit.fill
                )
              ),
            ),
            GestureDetector(
              onTap: () => Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => HomePageUi2(),)),
              child: Container(
                margin: EdgeInsets.only(top: 100),
                height: 50,
                  width: 150,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.circular(20)
                  ),
                  child:  Text("Log In",style: style),),
            ),

            Padding(
              padding: EdgeInsets.only(top: 20,bottom: 20),
              child: Text("-Or-",style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold),),
            ),

            GestureDetector(
              onTap: () => Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => HomePageUi2(),)),
                child: LoginPageContainer(text: "Login with Facebook", icons: FontAwesomeIcons.facebook,color: (Colors.blue[900])!)),
            GestureDetector(
                onTap: () => Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => HomePageUi2(),)),
                child: LoginPageContainer(text: "Login with Twitter", icons: FontAwesomeIcons.twitter,color: (Colors.blue[400])!,)),
            GestureDetector(
                onTap: () => Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => HomePageUi2(),)),
                child: LoginPageContainer(text: "Login with Gmail", icons: FontAwesomeIcons.google, color: Colors.red,)),




          ],

        ),
      ),
    );
  }


}
