import 'package:assignments/hotelBookingUi/horizListData.dart';
import 'package:assignments/hotelBookingUi/vertListData.dart';
import 'package:flutter/material.dart';

void main(){
  runApp(MaterialApp(
    home: HotelBookingHomePage(),
  debugShowCheckedModeBanner: false,));
}

class HotelBookingHomePage extends StatelessWidget {
  const HotelBookingHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    TextStyle heading1 = TextStyle(color: Colors.black,fontWeight: FontWeight.w700,fontSize: 20);

    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.purple,
        iconSize: 27,

        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home),label: "Home",),
          BottomNavigationBarItem(icon: Icon(Icons.search),label: "Search"),
          BottomNavigationBarItem(icon: Icon(Icons.person),label: "Account"),
        ],
      ),
      appBar: AppBar(
        toolbarHeight: 60,
        elevation: 0,
        backgroundColor: Colors.white,
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Hello @Beckham",style: TextStyle(fontSize: 15,color: Colors.grey[600]),),
            Text("Find your favourite Hotel",style: heading1,)
          ],
        ),
        actions: [
          Container(
            margin: EdgeInsets.only(top: 10,bottom: 10,right: 10),
            width: 50,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              image: DecorationImage(
                image: AssetImage("assets/images/profileui2/beckham1.jpg"),
                fit: BoxFit.fill
              )
            ),
          )
        ],
      ),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        padding: EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: EdgeInsets.symmetric(horizontal: 15,vertical: 25),
              padding: EdgeInsets.only(top: 5,bottom: 5),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 2,
                    blurRadius: 5,
                    offset: Offset(0, 3),
                  ),
                ]
              ),
              child: TextField(
                decoration: InputDecoration(
                  border: InputBorder.none,
                  prefixIcon: Icon(Icons.search,size: 28,),
                  hintText: "Search for Hotels",
                  hintStyle: TextStyle(fontSize: 18)
                ),
              ),
            ),
            ///second
            Text("Popular Hotel",style: heading1,),
           HorizListData(),
            SizedBox(height: 10,),

            ///third
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Hotel Packages",style: heading1,),
                Text("View more",style: TextStyle(color: Colors.black,fontSize: 16),)
              ],
            ),
            VertListData()


          ],
        ),
      ),
    );
  }
}
