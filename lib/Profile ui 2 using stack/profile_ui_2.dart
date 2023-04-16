import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

// void main() {
//   // SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(statusBarColor: Colors.transparent));
//   runApp(
//     DevicePreview(
//       enabled: true,
//       builder: (context) => MyApp(), // Wrap your app
//     ),
//   );
// }

void main(){
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.black,
      ),
      home: ProfileUi2(),
    );
  }
}


class ProfileUi2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 1,
        title: Text("David Beckham"),
        centerTitle: true,
        leading: Icon(Icons.dehaze),
        actions: [
          IconButton(onPressed: (){}, icon: Icon(Icons.more_vert))
        ],
      ),
      body: SafeArea(
        child: Container(
          color: Colors.white,
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height * .56,
          child: Stack(
            children: [
              Container(
                height: MediaQuery.of(context).size.height * .3,
                decoration: BoxDecoration(
                    color: Colors.green,
                    image: DecorationImage(
                        image: AssetImage("assets/images/beckham1.jpg"),fit: BoxFit.fill)),
              ),
              Positioned(
                top: MediaQuery.of(context).size.height*.2,
                left: 0,
                right: 0,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    CircleAvatar(
                      radius: 30,
                      backgroundColor: Colors.red,
                      child: Icon(Icons.message,
                      size: 30,),
                    ), CircleAvatar(
                      radius: 80,
                      backgroundColor: Colors.white,
                      child: CircleAvatar(
                        radius: 76,
                        backgroundColor: Colors.red,
                        backgroundImage: AssetImage("assets/images/beckham.jpg"),

                      ),
                    ), CircleAvatar(
                      radius: 30,
                      backgroundColor: Colors.blue,
                      child: Icon(Icons.add,
                      size: 30,),
                    ),
                  ],
                ),
              ),
              
              Positioned(
                bottom: MediaQuery.of(context).size.height*.1,
                  left: MediaQuery.of(context).size.width*.25,
                  child: Text("David Beckham",style: TextStyle(fontSize: 30,fontWeight: FontWeight.w500),)),
              Positioned(
                bottom: MediaQuery.of(context).size.height*.07,
                  left: MediaQuery.of(context).size.width*.21,
                  child: Text("English former football player",style: TextStyle(fontSize: 18, color: Colors.grey[700],fontWeight: FontWeight.w500),)),
            ],
          ),
        ),
      ),
    );
  }
}
