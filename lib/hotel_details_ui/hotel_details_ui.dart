import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main(){
  SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(statusBarColor: Colors.transparent));
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.purple),
      home: HotelDetailsUi(),
    );
  }
}


class HotelDetailsUi extends StatelessWidget {
  const HotelDetailsUi({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.search), label: "Search"),
          BottomNavigationBarItem(
              icon: Icon(Icons.favorite), label: "Favorite"),
          BottomNavigationBarItem(
              icon: Icon(Icons.settings), label: "Settings"),
        ],
      ),
      body: Column(
        children: [
          Container(
            height: MediaQuery.of(context).size.height*.40,
            width: double.infinity,
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("assets/images/other/crowne_plaza.jpg"),
                  fit: BoxFit.cover),
              color: Colors.white,
            ),
            child: Stack(
              children: [
                Positioned(
                    child: Text("Crowne Plaza",
                        style: TextStyle(
                            fontSize: 35,
                            fontWeight: FontWeight.w600,
                            color: Colors.white)),
                    bottom: 100,
                    left: 20),
                Positioned(
                    child: Text("Kochi, Kerala",
                        style: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.w600,
                            color: Colors.white)),
                    bottom: 70,
                    left: 20),
                Positioned(
                  child: Container(
                    height: 30,
                    width: 120,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.grey[600],
                    ),
                    child: Center(
                        child: Text("8.4/85 reviews",
                            style: TextStyle(
                              color: Colors.white,
                            ))),
                  ),
                  left: 20,
                  bottom: 25,
                ),
                Positioned(
                  child: Icon(
                    Icons.favorite_border,
                    size: 30,
                    color: Colors.white,
                  ),
                  right: MediaQuery.of(context).size.width*.07,
                  bottom: 25,
                )
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.only(left: 20, right: 20),
            height: MediaQuery.of(context).size.height*.11,
            color: Colors.white,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Icon(Icons.star, color: Colors.purple, size: 28),
                        Icon(Icons.star, color: Colors.purple, size: 28),
                        Icon(Icons.star, color: Colors.purple, size: 28),
                        Icon(Icons.star, color: Colors.purple, size: 28),
                        Icon(Icons.star, color: Colors.grey[700], size: 28),
                      ],
                    ),
                    SizedBox(
                      height: 3,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Icon(Icons.location_on, color: Colors.grey),
                        Text(" 8 km to LuluMall",
                            style: TextStyle(color: Colors.grey[600]))
                      ],
                    )
                  ],
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "\$200",
                      style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.w600,
                          color: Colors.purple),
                    ),
                    Text(
                      "/per night",
                      style: TextStyle(color: Colors.grey[700]),
                    )
                  ],
                )
              ],
            ),
          ),
          Container(
            height: 50,
            width: 300,
            child: ElevatedButton(
              onPressed: () {},
              // style: ButtonStyle(
              //     shape: MaterialStateProperty.all(RoundedRectangleBorder(
              //         borderRadius: BorderRadius.circular(30)))),
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
              ),
              child: Text(
                "Book Now",
                style: TextStyle(fontWeight: FontWeight.w500, fontSize: 17),
              ),
            ),
          ),
          SizedBox(
            height: 30,
          ),
          Container(
              padding: EdgeInsets.only(left: 10, right: 10),
              height: 40,
              width: double.infinity,
              child: Text(
                "Ramada Plaza Palm Grove",
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.w600,
                ),
                textAlign: TextAlign.left,
              )),
          Expanded(
            child: SingleChildScrollView(
              child: SingleChildScrollView(
                child: Container(
                  margin: EdgeInsets.only(
                    left: 10,
                    right: 10,
                  ),
                  child: Text(
                      "With a fantastic view of the Arabian Sea, Ramada Plaza Palm Grove, Mumbai, poses as a perfect destination for travellers. This hotel at Juhu Beach is located just 6.9 kilometres away from Mumbai airport. Ramada Plaza Palm Grove hotel, one of the best 5-star hotels in Juhu provides easy access to multiple destinations in the city. As you stay in our luxurious hotel rooms in Juhu, enjoy umpteen facilities and enjoy an amazing view of the sea. Just a short drive from Bandra Kurla Complex, the city’s prime business area, our Juhu Beach Hotel in Mumbai lies in close proximity to the Bollywood district, the Bombay Exhibition Centre, as well as the International and Domestic Airports. These factors make Ramada Plaza Palm Grove, Mumbai, one of the top 5-star hotels near Juhu beach. A majority of our accommodation options are sea view suites and hotel rooms near Juhu Beach offering a wonderful view at dusk and dawn. The facilities provided at Ramada Plaza Palm Grove, Mumbai range from private meeting rooms at the 24-hour business centre to state-of-the-art 5-star banquet halls near Juhu Beach. ",
                 ),

                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
