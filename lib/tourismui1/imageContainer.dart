import 'package:flutter/material.dart';

class ImageContainer extends StatelessWidget {

  String image;
  ImageContainer({required this.image});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 90,
      width: 100,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(10)),
          image: DecorationImage(
              image: AssetImage(image),
              fit: BoxFit.fill
          )
      ),
    );
  }
}
