import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class LoginPageContainer extends StatelessWidget {
  final String text;
  final IconData icons;
  final Color color;

  LoginPageContainer({required this.text, required this.icons, required this.color});

  @override
  Widget build(BuildContext context) {

    final TextStyle style = TextStyle(
        color: Colors.white,
        fontSize: 16,fontWeight: FontWeight.bold);

    return Container(
      margin: EdgeInsets.only(bottom: 20),
      height: 50,
      width: 300,
      padding: EdgeInsets.only(left: 20,right: 20),
      alignment: Alignment.center,
      decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(20)
      ),
      child:  Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(text,style: style,),
          FaIcon(icons,color: Colors.white,)
        ],),);
  }
}
