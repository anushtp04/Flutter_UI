import 'package:flutter/material.dart';

class SmallContainer extends StatelessWidget {

  final text1;
  final text2;

  SmallContainer({required this.text1, required this.text2});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 5,bottom: 5),
      height: 60,
      width: 70,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.grey[400]
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(text1,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15),),
          Container(
            height: 1,
            width: 40,
            color: Colors.black,
          ),
          Text(text2)
        ],
      ),
    );
  }
}
