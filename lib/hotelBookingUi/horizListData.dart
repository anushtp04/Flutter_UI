import 'package:assignments/hotelBookingUi/bookingData.dart';
import 'package:flutter/material.dart';

class HorizListData extends StatelessWidget {
  var _name = bookingData.map((value) => value["name"]).toList();
  var _image = bookingData.map((value) => value["image"]).toList();
  var _description = bookingData.map((value) => value["description"]).toList();
  var _price = bookingData.map((value) => value["price"]).toList();
  var _rating = bookingData.map((value) => value["rating"]).toList();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 10, bottom: 10),
      height: 260,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: List.generate(
          _name.length,
          (index) => Container(
            width: 145,
            margin: EdgeInsets.symmetric(horizontal: 7),
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
            child: Column(
              children: [
                Container(
                  height: 110,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(topLeft: Radius.circular(20),topRight: Radius.circular(20)),
                    image: DecorationImage(
                      image: AssetImage("${_image[index]}"),
                      fit: BoxFit.fill
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(left: 8,top: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("${_name[index]}",style: TextStyle(fontSize: 20,fontWeight: FontWeight.w600),),
                      SizedBox(height: 10,),
                      Text("${_description[index]}"),
                      SizedBox(height: 20,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("\$${_price[index]}/night",style: TextStyle(color: Colors.blue,fontSize: 15,fontWeight: FontWeight.w500)  ,),
                          Row(
                            children: [
                              Text("${_rating[index]}",style: TextStyle(color: Colors.blue,fontWeight: FontWeight.w500),),
                              Icon(Icons.star,color: Colors.blue,)
                            ],
                          )
                        ],
                      )

                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
