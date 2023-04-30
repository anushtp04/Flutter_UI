import 'package:assignments/hotelBookingUi/bookingData.dart';
import 'package:flutter/material.dart';

class VertListData extends StatelessWidget {
  var _name = bookingData.map((value) => value["name"]).toList();
  var _image = bookingData.map((value) => value["image"]).toList();
  var _description = bookingData.map((value) => value["description"]).toList();
  var _price = bookingData.map((value) => value["price"]).toList();

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.only(top: 10 ),
        child: ListView(
          children: List.generate(
            _name.length,
            (index) => Container(
              height: 130,
              margin: EdgeInsets.only(left: 5,right: 5,bottom: 10),
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey.shade300),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 0,
                      blurRadius: 2,
                      offset: Offset(0, 0),
                    ),
                  ],
                  color: Colors.white,
                  borderRadius:  BorderRadius.circular(20)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Container(
                        width: 110,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(topLeft: Radius.circular(20),bottomLeft: Radius.circular(20)),
                          image: DecorationImage(
                            image: AssetImage("${_image[index]}"),
                            fit: BoxFit.fill
                          )
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.only(left: 8,top: 8),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("${_name[index]}",style: TextStyle(fontSize: 20,fontWeight: FontWeight.w600),),
                            SizedBox(height: 8,),
                            Text("${_description[index]}"),
                            SizedBox(height: 8,),
                            Text("\$${_price[index]}/night",style: TextStyle(color: Colors.blue,fontSize: 15,fontWeight: FontWeight.w500),),
                            SizedBox(height: 10,),
                            Row(
                              children: [
                                Icon(Icons.car_repair_sharp,color: Colors.blue,size: 32,),
                                SizedBox(width: 10,),
                                Icon(Icons.wine_bar_rounded,color: Colors.blue,size: 32),
                                SizedBox(width: 10,),
                                Icon(Icons.wifi,color: Colors.blue,size: 32)
                              ],
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                  ///third
                  Container(
                    height: 45,
                    width: 70,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(30),
                          bottomLeft: Radius.circular(30),
                        ),
                      color: Colors.blue
                    ),
                    child: Center(
                      child: Text("Book",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 15),),
                    ),
                  )

                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
