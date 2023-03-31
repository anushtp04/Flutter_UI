import 'package:flutter/material.dart';

import 'drawer_assignment.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          scaffoldBackgroundColor: Colors.black,
          textTheme: Theme.of(context).textTheme.apply(
              displayColor: Colors.white,
              bodyColor: Colors.white
          )

      ),
      home: DrawerExample(),
    );
  }
}