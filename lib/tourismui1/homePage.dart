import 'package:assignments/tourismui1/tourismDatas.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'placesList.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: TourismUi(),
    routes: {
      "secondpage": (context) => PlacesList(),
    },
  ));
}

class TourismUi extends StatefulWidget {
  @override
  State<TourismUi> createState() => _TourismUiState();
}

class _TourismUiState extends State<TourismUi> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.deepPurple[900],
        ),
        body: Column(
          children: [
            Container(
              padding: EdgeInsets.only(left: 15, bottom: 5),
              height: 40,
              alignment: Alignment.bottomLeft,
              child: Text(
                "Popular",
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
            ),
            Expanded(
              child: ListView(
                children: popularPlaces.map((value) {
                  return Padding(
                    padding: EdgeInsets.all(8.0),
                    child: GestureDetector(
                      onTap: () {
                        return gotoNext(context, value["id"]);
                      },
                      child: SizedBox(
                        height: 180,
                        child: Stack(
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10)),
                                  border: Border.all(color: Colors.black12),
                                  image: DecorationImage(
                                      image: AssetImage("${value["image"]}"),
                                      fit: BoxFit.cover)),
                            ),
                            Positioned(
                                left: 20,
                                bottom: 30,
                                child: Text(
                                  "${value["name"]}",
                                  style: TextStyle(
                                      fontSize: 24,
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold),
                                ))
                          ],
                        ),
                      ),
                    ),
                  );
                }).toList(),
              ),
            ),
          ],
        ));
  }

  void gotoNext(BuildContext context, value) {
    Navigator.pushNamed(context, "secondpage", arguments: value);
  }
}
