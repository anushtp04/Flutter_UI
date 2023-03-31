import 'package:flutter/material.dart';

import 'grid_with_card.dart';

void main(){
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: GridWithCard(),
    );
  }
}
