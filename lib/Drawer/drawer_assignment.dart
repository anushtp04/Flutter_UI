import 'package:flutter/material.dart';


class DrawerExample extends StatelessWidget {
  var lists = [
    "Dashboard",
    "Leads",
    "Clients",
    "Projects",
    "Parterns",
    "Subscription",
    "Payments",
    "Users",
    "Library"
  ];
  var icons = [
    Icons.dashboard,
    Icons.leaderboard,
    Icons.people,
    Icons.paragliding_rounded,
    Icons.handshake_outlined,
    Icons.subscriptions_outlined,
    Icons.payment,
    Icons.supervised_user_circle_sharp,
    Icons.library_books_rounded
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Drawers"),
        ),
        drawer:
        SafeArea(
          child: Drawer(
            child: Container(
              padding: EdgeInsets.only(top: 20,bottom: 20),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                    colors: [
                      Colors.orange,
                      Colors.red,
                    ],
                    begin: AlignmentDirectional.topCenter,
                    end: Alignment.bottomCenter),
              ),
              child: Column(children: [
                ListTile(
                    leading: CircleAvatar(
                        radius: 30,
                        backgroundImage:
                            AssetImage("assets/icons/logingirl.png")),
                    title: Text("Terra Crowail",
                        style: TextStyle(fontSize: 22)),
                    subtitle: Text("Administrator")),
                SizedBox(height: 30,),
                Expanded(
                  child: ListView.builder(
                      itemCount: lists.length,
                      itemBuilder: (BuildContext context, int index) {
                        return ListTile(
                          leading: Icon(icons[index], color: Colors.white,size: 30),
                          title: Text(lists[index],style: TextStyle(fontSize: 16)),
                        );
                      }),
                ),
                SizedBox(height: 20,),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                    backgroundColor: Colors.orange[900]
                  ),
                  onPressed: () { }, child: Padding(
                    padding: EdgeInsets.only(left: 90,right: 90,top: 20,bottom: 20),
                    child: Text("LOG OUT"),
                  ),),
              ]),
            ),
          ),
        ),
      body: Center(
        child: Text("Hiii"),
      ),
    );
  }
}
