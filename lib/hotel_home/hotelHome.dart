import 'package:assignments/hotel_home/util/container_smaill.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialApp(
    debugShowCheckedModeBanner: false,
    home: HotelHomeUi(),
  ));
}

class HotelHomeUi extends StatelessWidget {
  const HotelHomeUi({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: CustomScrollView(slivers: [
      SliverAppBar(
        expandedHeight: 160,
        leading: const Icon(Icons.menu),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.favorite_border),
          )
        ],
        bottom: AppBar(
          elevation: 0,
          toolbarHeight: 160,
          title: Container(
            height: 100,
            child: Column(
              children: [
                const Text(
                  "Type Your Location",
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 10,
                ),
                Container(
                  height: 60,
                  decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(30))),
                  child: TextField(
                      decoration: InputDecoration(
                    hintText: "Buddha, Kathmandu",
                    hintStyle: const TextStyle(
                      fontSize: 18,
                    ),
                    prefixIcon: const Padding(
                      padding: EdgeInsets.only(left: 20, right: 30),
                      child: Icon(
                        Icons.search,
                        size: 25,
                      ),
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  )),
                ),
              ],
            ),
          ),
        ),
      ),
      SliverList(
          delegate: SliverChildListDelegate([
        SizedBox(
          height: 150,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SmallContainer(
                  color: Colors.pink, icons: Icons.hotel, text: "Hotel"),
              const SizedBox(
                width: 10,
              ),
              SmallContainer(
                  color: Colors.blue,
                  icons: Icons.restaurant,
                  text: "Restaurant"),
              const SizedBox(
                width: 10,
              ),
              SmallContainer(
                  color: Colors.orange, icons: Icons.local_cafe, text: "Cafe"),
            ],
          ),
        ),
        Container(
            margin: const EdgeInsets.only(left: 10, right: 10),
            height: 390,
            decoration: BoxDecoration(
              border: Border.all(color: Colors.black12),
              borderRadius: BorderRadius.all(Radius.circular(10))
            ),
            child: LayoutBuilder(
              builder: (BuildContext context , BoxConstraints constraints ) {
                return Stack(children: [
                  Container(
                    height: 240,
                    decoration: const BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage("assets/images/other/hotelUi.jpg"),
                            fit: BoxFit.fill
                        )
                    ),

                  ),
                  Positioned(
                    top:  constraints.maxHeight * 0.47,
                    right:  constraints.maxWidth * 0.04,
                    child: Container(
                      padding: const EdgeInsets.all(10),
                      color: Colors.white,
                      child: const Text("\$40",style: TextStyle(fontSize: 15,fontWeight: FontWeight.w500),),
                    ),
                  ),
                  Positioned(
                    top:  constraints.maxHeight * 0.65,
                    left:  constraints.maxWidth * 0.04,
                    child: Container(
                      padding: EdgeInsets.only(left: 5),
                      height: 100,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text("Awesome room near Bouddha",style: TextStyle(
                            fontSize: 21,fontWeight: FontWeight.bold
                          ),),
                          SizedBox(height: 5,),
                          const Text("Bouddha, Kathmandu"),
                          SizedBox(height: 10,),

                          Row(
                            children: [
                              Row(
                                children: const [
                                  Icon(Icons.star,color: Colors.green,),
                                  Icon(Icons.star,color: Colors.green,),
                                  Icon(Icons.star,color: Colors.green,),
                                  Icon(Icons.star,color: Colors.green,),
                                  Icon(Icons.star,color: Colors.green,),
                                ],
                              ),
                              SizedBox(width: 10,),
                               Text("(220 reviews)",style: TextStyle(color: Colors.grey[600]),)
                            ],
                          )
                        ],
                      ),
                    ),

                  )
                ]);
              },
            )),



    ])),

    ]));
  }
}
