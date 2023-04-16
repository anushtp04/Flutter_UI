import 'package:assignments/tourismUi2/util/categories.dart';
import 'package:flutter/material.dart';

class HomePageUi2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    Future<bool> showAlert() async {
      return await showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text("Exit"),
            content: Text("Do You Want to Exit from the App"),
            actions: [
              ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).pop(true);
                  },
                  child: Text("Yes")),
              ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).pop(false);
                  },
                  child: Text("No")),
            ],
          );
        },
      );
    }

    return WillPopScope(
        onWillPop: showAlert,
        child: Scaffold(
          body: CustomScrollView(slivers: [
            SliverAppBar(
              backgroundColor: Colors.white,
              toolbarHeight: 90,
              title: RichText(

                text: TextSpan(
                  children:[
                    TextSpan(text: "Go", style: TextStyle(color: Colors.blue,fontSize: 23,fontWeight: FontWeight.bold) ),
                    TextSpan(text: "Fast", style: TextStyle(color: Colors.black,fontSize: 23,fontWeight: FontWeight.bold) ),
                  ]
                ),
              ),
              centerTitle: true,
              leading: Icon(Icons.menu,color: Colors.black,size: 30,),
              actions: [
                Padding(
                  padding: EdgeInsets.only(right: 10),
                  child: CircleAvatar(
                    backgroundImage: AssetImage("assets/images/profileui2/beckham.jpg"),
                    radius: 22,
                  ),
                ),
              ],
              bottom: AppBar(
                backgroundColor: Colors.white,
                elevation: 0,
                centerTitle: true,
                title: Container(
                  padding: EdgeInsets.only(left: 10,right: 10),
                  color: Colors.grey[300],
                  height: 60,
                  width: 350,
                  child: TextField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderSide: BorderSide.none
                      ),
                      hintText: "search here",
                      hintStyle: TextStyle(color: Colors.grey[500],fontSize: 18),
                      suffixIcon: Icon(Icons.search,color: Colors.grey[500],),
                    ),
                  ),
                ),
              ),
            ),
            SliverList(
              delegate: SliverChildListDelegate(
                [
                  Padding(
                    padding: EdgeInsets.only(
                        left: 13, right: 13, top: 20, bottom: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Popular Places",
                          style: TextStyle(
                              fontSize: 22, fontWeight: FontWeight.bold),
                        ),
                        TextButton(
                          onPressed: () {},
                          child: Text(
                            "View All",
                            style: TextStyle(
                                fontSize: 20, color: Colors.blue),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            SliverGrid.count(
              crossAxisCount: 2,
              mainAxisSpacing: 20,
              children: categories
                  .map((value) => GestureDetector(
                onTap: () {
                  return gotoNext(context,value["id"]);
                },
                    child: Container(
                          margin: EdgeInsets.only(left: 10,right: 10, ),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              image: DecorationImage(
                                  image: AssetImage("${value["image"]}"),
                                  fit: BoxFit.fill)),
                          child: Stack(
                            children: [
                              Positioned(
                                left: 10,
                                  top: 10,
                                  child: Container(
                                padding: EdgeInsets.only(left: 12,right: 12,top: 3,bottom: 3),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5),
                                  color: Colors.blue
                                ),
                                child: Text("\$${value["price"]}",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),
                              )),
                              Positioned(
                                  bottom: 12,
                                  left: 12,
                                  child: Text(
                                    "${value["categoryName"]}",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                      shadows: [
                                        Shadow(
                                          blurRadius: 3,
                                          color: Colors.black,
                                          offset: Offset(1, 1)
                                        ),
                                      ],
                                    ),
                                  ))
                            ],
                          ),
                        ),
                  ))
                  .toList(),
            ),

            SliverToBoxAdapter(
              child: Container(
                margin: EdgeInsets.only(top: 30,left: 20,right: 20),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: Color.fromRGBO(12, 29, 65, 1.0)
                ),
                height: 50,
                alignment: Alignment.center,
                child: Text("Explore Now",style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold,color: Colors.white),),

              ),
            )
          ]),
        ));
  }

  void gotoNext(BuildContext context, value) {
    Navigator.of(context).pushNamed("secondpage",arguments: value);
  }
}
