import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'profile_ui.dart';

void main(){
  runApp(MyApp1());
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(statusBarColor: Colors.transparent));
}

class MyApp1 extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: Color.fromRGBO(249, 249, 249, 1),
      ),
      home: ProfileUi1(),
    );
  }
}
