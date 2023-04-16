import 'dart:math';
import 'package:flutter/material.dart';
import 'card_contents.dart';

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


class GridWithCard extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Grid With Card"),
      ),
      body: Container(
        padding: EdgeInsets.all(10),
        child: GridView.builder(
          itemCount: cardName.length,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing:8,
              mainAxisSpacing: 13,
              mainAxisExtent: 110

            ),
            itemBuilder: (context, index) {
              return Card(
                elevation: 20,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(20))),
                color: Colors.primaries[Random().nextInt(Colors.primaries.length)],
                child: Align(
                   alignment: Alignment.center,
                  child: ListTile(
                    leading: Icon(cardIcon[index],size: 40),
                    title: Text(cardName[index],style: TextStyle(fontSize: 20,fontWeight: FontWeight.w500),),
                  ),
                )
                // child: Row(
                //   mainAxisSize: MainAxisSize.min,
                //   crossAxisAlignment: CrossAxisAlignment.center,
                //   mainAxisAlignment: MainAxisAlignment.center,
                //   children: [
                //     Icon(cardIcon[index],size: 40,),
                //     SizedBox(width: 20,),
                //     Text(cardName[index],style: TextStyle(fontSize: 20,fontWeight: FontWeight.w500))
                //   ],
                // ),
              );
            },),
      ),
    );
  }
}
