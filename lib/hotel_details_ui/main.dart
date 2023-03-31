import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'hotel_details_ui.dart';

void main(){
  SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(statusBarColor: Colors.transparent));
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.purple),
      home: HotelDetailsUi(),
    );
  }
}
