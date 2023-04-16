import 'package:assignments/tourismUi2/util/categories.dart';
import 'package:assignments/tourismUi2/util/smallContainer.dart';
import 'package:flutter/material.dart';

class HotelPage extends StatelessWidget {
  const HotelPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final id = ModalRoute.of(context)?.settings.arguments;

    final hotel = categories.firstWhere((element) => element["id"] == id);

    TextStyle style = TextStyle(fontWeight: FontWeight.bold, fontSize: 20);

    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.only(left: 20, right: 20, top: 10),
          height: double.infinity,
          width: double.infinity,
          child: Column(
            children: [
              ///first container
              Container(
                height: 70,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                            width: 210,
                            child: Text(
                          "${hotel["hotelName"]}",
                          style: style,
                        )),
                        Row(
                          children: [
                            Padding(
                              padding: EdgeInsets.only(right: 10),
                              child: Row(
                                children: [
                                  Icon(
                                    Icons.star,
                                    color: Colors.orangeAccent,
                                    size: 22,
                                  ),
                                  Icon(
                                    Icons.star,
                                    color: Colors.orangeAccent,
                                    size: 22,
                                  ),
                                  Icon(
                                    Icons.star,
                                    color: Colors.orangeAccent,
                                    size: 22,
                                  ),
                                  Icon(
                                    Icons.star,
                                    color: Colors.orangeAccent,
                                    size: 22,
                                  ),
                                  Icon(
                                    Icons.star,
                                    color: Colors.orangeAccent,
                                    size: 22,
                                  ),
                                ],
                              ),
                            ),
                            Text(
                              "4.7 Ratings",
                              style: TextStyle(color: Colors.grey[600]),
                            )
                          ],
                        )
                      ],
                    ),
                    Container(
                      height: 40,
                      width: 1,
                      color: Colors.black,
                    ),
                    Container(
                      height: 70,
                      width: 80,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          image: DecorationImage(
                              image: AssetImage("${hotel["hotelImage1"]}"),
                              fit: BoxFit.fill)),
                    )
                  ],
                ),
              ),

              ///2nd Container
              Container(
                margin: EdgeInsets.only(top: 30, bottom: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "About Places",
                      style: style,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      "${hotel["aboutPlace"]}",
                      style: TextStyle(color: Colors.grey[600]),
                    )
                  ],
                ),
              ),

              ///3rd Container
              Container(
                margin: EdgeInsets.only(top: 10, bottom: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Special Facilities",
                      style: style,
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Icon(
                              Icons.local_parking_sharp,
                              color: Colors.blue,
                              size: 22,
                            ),
                            SizedBox(
                              width: 3,
                            ),
                            Text("Free Parking")
                          ],
                        ),
                        Row(
                          children: [
                            Icon(
                              Icons.recycling,
                              color: Colors.blue,
                              size: 23,
                            ),
                            SizedBox(
                              width: 3,
                            ),
                            Text("24 h Support")
                          ],
                        ),
                        Row(
                          children: [
                            Icon(
                              Icons.wifi,
                              color: Colors.blue,
                              size: 24,
                            ),
                            SizedBox(
                              width: 3,
                            ),
                            Text("Free WiFi")
                          ],
                        ),
                      ],
                    )
                  ],
                ),
              ),

              ///4th container
              Container(
                height: 200,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    image: DecorationImage(
                        image: AssetImage("${hotel["hotelImage2"]}"),
                        fit: BoxFit.fill)),
              ),

              ///5th container
              Container(
                margin: EdgeInsets.only(
                  top: 30,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Our Packages",
                      style: style,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SmallContainer(text1: "Adult", text2: "02"),
                        SmallContainer(text1: "child", text2: "00"),
                        SmallContainer(text1: "Night", text2: "02"),
                        SmallContainer(text1: "Room", text2: "01"),
                      ],
                    )
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 30),
                padding: EdgeInsets.only(left: 20, right: 20),
                height: 50,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.blue),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("\$860.00",style: TextStyle(fontSize: 20,fontWeight: FontWeight.w500,color: Colors.white),),
                    Row(
                      children: [
                        Text("Booking",style: TextStyle(fontSize: 20,fontWeight: FontWeight.w500,color: Colors.white),),
                        SizedBox(
                          width: 15,
                        ),
                        Icon(Icons.arrow_forward,color: Colors.white,)
                      ],
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
