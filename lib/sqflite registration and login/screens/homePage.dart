import 'package:assignments/sqflite%20registration%20and%20login/screens/loginPageSql.dart';
import 'package:flutter/material.dart';

class HomePageSQL extends StatefulWidget {
  final data;

  HomePageSQL({required this.data});

  @override
  State<HomePageSQL> createState() => _HomePageSQLState();
}

class _HomePageSQLState extends State<HomePageSQL> {


  @override
  Widget build(BuildContext context) {
    var name = widget.data[0]["name"];
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        elevation: 0,
        title: Text("User's page"),
        actions: [
          TextButton(onPressed: (){
            Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => LoginPageSQL(),));
          }, child: Text("Log out",style: TextStyle(color: Colors.white,fontSize: 16),))
        ],

      ),
      body: Center(child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("Welcome $name",style: TextStyle(fontSize: 34),),
        ],
      ),),
    );
  }
}
