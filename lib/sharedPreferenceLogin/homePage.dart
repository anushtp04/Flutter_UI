import 'package:assignments/sharedPreferenceLogin/loginPage.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedHomePage extends StatefulWidget {

  @override
  State<SharedHomePage> createState() => _SharedHomePageState();
}

class _SharedHomePageState extends State<SharedHomePage> {
  late SharedPreferences data;

  late String username;

  @override
  void initState() {
    fetchData();
    super.initState();
  }

  void fetchData() async{
    data = await SharedPreferences.getInstance();
    setState(() {
      username = data.getString("userName")!;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Welcome $username",style: TextStyle(fontSize: 32,fontWeight: FontWeight.bold,),
            ),
            SizedBox(height: 20,),
            ElevatedButton(onPressed: (){
              data.setBool("newUser", true);
              Navigator.push(context, MaterialPageRoute(builder: (context) => SharedPrefLogin(),));
            }, child: Text("Log Out"))
          ],
        ),
      ),
    );
  }
}
