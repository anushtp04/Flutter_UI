import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class SmallContainer extends StatelessWidget {

  final Color color;
  final IconData icons;
  final String text;
  SmallContainer({required this.color, required this.icons, required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 90,width: 110,
      decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.all(Radius.circular(10))
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          FaIcon(icons,size: 30,color: Colors.white,),
          SizedBox(height: 5,),
          Text(text,style: TextStyle(color: Colors.white,fontSize: 16),)
        ],
      ),
    );
  }
}
