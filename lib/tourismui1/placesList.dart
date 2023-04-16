import 'package:assignments/tourismui1/imageContainer.dart';
import 'package:assignments/tourismui1/tourismDatas.dart';
import 'package:flutter/material.dart';

class PlacesList extends StatelessWidget {
  const PlacesList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final id = ModalRoute.of(context)?.settings.arguments;

    final product = popularPlaces.firstWhere((element) => element["id"] == id);

    return Scaffold(
      extendBodyBehindAppBar: true,
      body: Container(
        height: double.infinity,
        width: double.infinity,
        child: Column(
        children: [
          Container(
            height: MediaQuery.of(context).size.height*.4,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(bottomLeft: Radius.circular(10),bottomRight: Radius.circular(10)),
                image: DecorationImage(
                    image: AssetImage("${product["image"]}"),
                    fit: BoxFit.cover)),
          ),
          Container(
            padding: EdgeInsets.only(left: 10,right: 10,top: 20,bottom: 20),
            height: MediaQuery.of(context).size.height*.6,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "${product["name"]}",
                      style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      "${product["text"]}",
                      style: TextStyle(fontSize: 15),
                    ),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Places to Visit",
                      style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 20,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        ImageContainer(image: "${product["image1"]}"),
                        ImageContainer(image: "${product["image2"]}"),
                        ImageContainer(image: "${product["image3"]}"),
                      ],
                    ),
                SizedBox(height: 20,),
                Container(
                    height: 40,
                    width: MediaQuery.of(context).size.width,
                    margin: EdgeInsets.only(left: 20, right: 20),
                    child: ElevatedButton(
                        style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all(Colors.deepPurple[900]),
                            shape: MaterialStateProperty.all(RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ))),
                        onPressed: () {},
                        child: Text(
                          "Press to Explore",
                          style: TextStyle(fontSize: 15),
                        )))
                  ],
                )

        ],
      ),
          ),
      ])));
  }
}
