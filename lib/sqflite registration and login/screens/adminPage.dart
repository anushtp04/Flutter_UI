import 'package:assignments/sqflite%20registration%20and%20login/screens/loginPageSql.dart';
import 'package:assignments/sqflite%20registration%20and%20login/sqlhelper/sqlHelper.dart';
import 'package:flutter/material.dart';

class AdminPageSQL extends StatefulWidget {
  const AdminPageSQL({Key? key}) : super(key: key);

  @override
  State<AdminPageSQL> createState() => _AdminPageSQLState();
}

class _AdminPageSQLState extends State<AdminPageSQL> {
  var data;

  var _name = TextEditingController();
  var _email = TextEditingController();
  var _password = TextEditingController();

  @override
  void initState() {
    refreshData();
    super.initState();
  }

  void refreshData() async{
    var myData = await SQLHelper.getAll();
    setState(() {
      data = myData;
    });
  }

  void delete(int id) async {
    await SQLHelper.deleteUser(id);
    refreshData();
  }

  void updateUser(int id) async {
    var myData1 = await SQLHelper.getAll();
    var existingUserData = myData1.firstWhere((element) => element["id"] == id);

    _name.text = existingUserData["name"];
    _email.text = existingUserData["email"];
    _password.text = existingUserData["password"];

    showModalBottomSheet(
      elevation: 3,
        isScrollControlled: true,
      context: context, builder: (context) {
      return Container(
        padding: EdgeInsets.only(left: 10,right: 10,top: 10,
        bottom: MediaQuery.of(context).viewInsets.bottom + 120
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            SizedBox(height: 5,),
            TextField(
              controller: _name,
              decoration: InputDecoration(
                labelText: "name",
                border: OutlineInputBorder()
              ),
            ),
            SizedBox(height: 10,),
            TextField(
              controller: _email,
              decoration: InputDecoration(
                labelText: "email",
                border: OutlineInputBorder()
              ),
            ),
            SizedBox(height: 10,),
            TextField(
              controller: _password,
              decoration: InputDecoration(
                labelText: "passwprd",
                border: OutlineInputBorder()
              ),
            ),
            SizedBox(height: 10,),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                ElevatedButton(onPressed: ()async{

                  await SQLHelper.updateUser(id,_name.text,_email.text,_password.text);
                  refreshData();

                  _email.text = "";
                  _name.text = "";
                  _password.text = "";
                  Navigator.pop(context);

                }, child: Text("UPDATE")),
              ],
            )
          ],
        ),
      );
    },);

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Admin Panel'),
        actions: [
          IconButton(onPressed: (){
            Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => LoginPageSQL(),));
          }, icon: Icon(Icons.exit_to_app))
        ],
      ),
      body: ListView.builder(
          itemCount: data.length,
          itemBuilder: (context,int index){
            return Card(
              color: Colors.deepPurple[200],
              child: ListTile(
                title: Text('${data[index]['name']}'),
                trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    IconButton(onPressed: (){
                      updateUser(data[index]["id"]);
                    }, icon: Icon(Icons.edit)),
                    IconButton(onPressed: (){
                      delete(data[index]["id"]);
                    },icon: Icon(Icons.delete),),

                  ],
                ),
              ),
            );
          }),
    );
  }




}
