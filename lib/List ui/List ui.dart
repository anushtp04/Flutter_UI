import 'package:flutter/material.dart';

import 'list_contents.dart';

void main() {
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ListUi(),
    );
  }
}


class ListUi extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Cities Around World",
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.yellow,
      ),
      body: Container(
        margin: EdgeInsets.all(10),
        height: double.infinity,
        width: double.infinity,
        child: ListView.builder(
            itemCount: cityNames.length,
            itemBuilder: (BuildContext context, int index) {
              return Card(
                elevation: 1,
                child: Padding(

                  padding: EdgeInsets.only(bottom: 12, top: 12),
                  child: ListTile(
                    leading: Container(
                      height: 200,
                      width: 100,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          fit: BoxFit.fill,
                            image: AssetImage(images[index]))
                      ),
                    ),
                    title: Text(cityNames[index],
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 18
                    ),),
                    subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(country[index]),
                          Text("Population ${population[index]} mill")
                        ]),
                  ),
                ),
              );
            }),
      ),
    );
  }
}
