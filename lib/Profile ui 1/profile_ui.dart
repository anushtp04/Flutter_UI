import 'package:assignments/Profile%20ui%201/profileUi_contents.dart';
import 'package:flutter/material.dart';

class ProfileUi1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          iconTheme: IconThemeData(color: Colors.black),
          backgroundColor: Color.fromRGBO(249, 249, 249, 1),
          elevation: 0,
          title: Icon(Icons.arrow_back, size: 25),
          actions: [
            Padding(
                padding: EdgeInsets.only(right: 10),
                child: Icon(Icons.filter_list))
          ]),
      body: Container(
        padding: EdgeInsets.all(10),
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Column(
          children: [
            //First container
            Container(
              height: MediaQuery.of(context).size.height*.4,
              child: Column(
                children: [
                  //Circle Avatar
                  CircleAvatar(
                      radius: 55,
                      backgroundImage:
                          AssetImage("assets/images/profile_ui/pic1.jpg")),
                  SizedBox(height: 20),
                  //social media facebook, twitter, linkedin, github

                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CircleAvatar(
                          backgroundImage: AssetImage(
                              "assets/images/profile_ui/facebook.png"),
                          radius: 18),
                      SizedBox(width: 10),
                      CircleAvatar(
                          backgroundImage: AssetImage(
                              "assets/images/profile_ui/twitter.png"),
                          radius: 18),
                      SizedBox(width: 10),
                      CircleAvatar(
                          backgroundColor: Colors.white,
                          backgroundImage: AssetImage(
                              "assets/images/profile_ui/linkedln.png"),
                          radius: 18),
                      SizedBox(
                        width: 10,
                      ),
                      CircleAvatar(
                          backgroundColor: Colors.white,
                          backgroundImage:
                              AssetImage("assets/images/profile_ui/github.png"),
                          radius: 18),
                    ],
                  ),
                  SizedBox(height: 30),

                  //Name
                  Text("Anush T P",
                      style:
                          TextStyle(fontSize: 32, fontWeight: FontWeight.bold)),

                  //nick name
                  Text("@anushtp04",
                      style: TextStyle(fontSize: 16, color: Colors.grey[800])),
                  SizedBox(height: 10),

                  //career discription mobile app developer
                  Text("Mobile App Developer",
                      style: TextStyle(fontSize: 22, color: Colors.grey[800],fontWeight: FontWeight.w500))
                ],
              ),
            ),

            ///second container

            Expanded(child: Container(
              padding: EdgeInsets.all(15),
              child: ListView.separated(
                itemCount: profileUiNames.length,
                itemBuilder: (context, index) {
                return Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    color: Colors.grey[300],

                  ),
                  child: ListTile(
                    leading: Icon(profileUiIcons[index],color: Colors.grey[800]),
                    title: Text(profileUiNames[index],style: TextStyle(fontSize: 18,fontWeight: FontWeight.w500, color: Colors.grey[800]),),
                    trailing: Icon(Icons.arrow_forward_ios,color: Colors.grey[800],size: 20,),
                  ),
                );
              }, separatorBuilder: (BuildContext context, int index) {
                  return SizedBox(height: 15,);
              },),
            ))

            //circle avatar
          ],
        ),
      ),
    );
  }
}
