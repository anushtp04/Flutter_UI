import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(statusBarColor: Colors.transparent));

    var contacts = [
      "Asif Ali",
      "Biju Menon",
      "Dileep",
      "Dulquer",
      "Fahadh Fasil",
      "Jayaram",
      "Kunchacko",
      "Mammootty",
      "Mohanlal",
      "Nivin",
      "Prithviraj",
      "Shane Nigam",
      "Tovino"
    ];

    var phoneNum = [
      9512924248,
      9925990317,
      9265279448,
      9222341004,
      9222351225,
      9226677017,
      9112397294,
      9222351164,
      9941232454,
      9222206681,
      9222267336,
      9922475645,
      9222687907,
      9112323010,
    ];

    return Scaffold(
      appBar: AppBar(
        title: Text(
          "My Contacts",
          style: TextStyle(
              fontWeight: FontWeight.bold, color: Colors.black, fontSize: 19),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        actions: [
          TextButton(
            onPressed: () {},
            child: Icon(
              Icons.exit_to_app,
              color: Colors.black,
            ),
          ),
        ],
      ),
      body: Center(
        child: Container(
          margin: EdgeInsets.only(bottom: 10, left: 10, right: 10),
          // color: Colors.black,
          height: double.infinity,
          width: double.infinity,
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.only(bottom: 3, left: 10, right: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      width: 290,
                      child: TextField(
                        decoration: InputDecoration(
                            contentPadding: EdgeInsets.all(5),
                            hintText: "Search",
                            prefixIcon: Icon(
                              Icons.search_rounded,
                              color: Colors.black,
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderSide: const BorderSide(
                                  width: 1, color: Colors.black),
                              borderRadius: BorderRadius.circular(30),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: const BorderSide(
                                  width: 1, color: Colors.black),
                              borderRadius: BorderRadius.circular(30),
                            )),
                      ),
                    ),
                    CircleAvatar(
                      radius: 25,
                      backgroundColor: Colors.white,
                      child: IconButton(
                        onPressed: () {},
                        icon: Icon(Icons.person_add,
                        size: 30,
                        color: Colors.black,)
                      ),
                    )
                  ],
                ),
              ),
              Divider(
                color: Colors.black,
                thickness: 1,
              ),
              Expanded(
                child: Container(
                  height: double.infinity,
                  width: double.infinity,
                  child: ListView.builder(
                    itemCount: contacts.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Card(
                        child: ListTile(
                          leading: CircleAvatar(
                            backgroundColor: Colors.primaries[
                                Random().nextInt(Colors.primaries.length)],
                            child: Text(
                              contacts[index][0].toUpperCase(),
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500),
                            ),
                          ),
                          title: Text(
                            contacts[index],
                            style: TextStyle(
                                fontWeight: FontWeight.w500, fontSize: 17),
                          ),
                          subtitle: Text("${phoneNum[index]}"),
                          trailing: Wrap(
                            children: [
                              CircleAvatar(
                                radius: 15,
                                backgroundColor: Colors.grey[200],
                                child: IconButton(
                                  onPressed: () {},
                                  icon: Icon(
                                    Icons.call,
                                    size: 15,
                                    color: Colors.black,
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              CircleAvatar(
                                radius: 15,
                                backgroundColor: Colors.grey[200],
                                child: IconButton(
                                  onPressed: () {},
                                  icon: Icon(
                                    Icons.message,
                                    size: 15,
                                    color: Colors.black,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
