import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: HomePageBankUi(),
  ));
}

class HomePageBankUi extends StatelessWidget {
  const HomePageBankUi({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var gridList = [
      ["My Account", "assets/images/bankui/account.png"],
      ["Load eSeva", "assets/images/bankui/e.png"],
      ["Payment", "assets/images/bankui/payment.png"],
      ["Fund Transfer", "assets/images/bankui/transfer.png"],
      ["Schedule Payment", "assets/images/bankui/schedule.png"],
      ["Scan to Pay", "assets/images/bankui/qr.png"]
    ];

    var transactions = [
      ["92453672819", "10-04-2023", "10,000"],
      ["92453672818", "07-04-2023", "16,000"],
      ["92453672817", "17-03-2023", "12,000"],
      ["92453672816", "11-03-2023", "18,000"],
      ["92453672815", "05-03-2023", "28,000"],
    ];

    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      appBar: AppBar(
        elevation: 0,
        leading: Icon(Icons.menu),
        title: Text("Welcome Beckham"),
        centerTitle: true,
        actions: [
          Icon(
            Icons.qr_code_scanner,
            size: 35,
          ),
          SizedBox(
            width: 10,
          )
        ],
      ),
      body: Center(
        child: Column(
          children: [
            Stack(children: [
              Column(
                children: [
                  Container(
                    height: 80,
                    width: double.infinity,
                    color: Colors.red,
                  ),
                  Container(
                    height: 120,
                    width: double.infinity,
                  )
                ],
              ),
              Positioned(
                right: MediaQuery.of(context).viewInsets.right + 10,
                left: MediaQuery.of(context).viewInsets.left + 10,
                top: MediaQuery.of(context).viewInsets.top + 20,
                bottom: MediaQuery.of(context).viewInsets.bottom + 20,
                child: Card(
                  child: Container(
                    height: 150,
                    width: 330,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CircleAvatar(
                          backgroundColor: Colors.red,
                          radius: 50,
                          child: CircleAvatar(
                            backgroundImage: AssetImage(
                                "assets/images/profileui2/beckham.jpg"),
                            radius: 47,
                          ),
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Available Balance",
                              style: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.w500),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Text(
                              "\$ 23065738984",
                              style: TextStyle(
                                  fontSize: 17,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.blue.shade900),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Text(
                              "Acc No : 573925416739261",
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.w500),
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              )
            ]),
            Padding(
              padding: EdgeInsets.only(left: 10),
              child: Row(
                children: [
                  Icon(
                    Icons.ac_unit,
                    color: Colors.orange.shade600,
                    size: 28,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    "WOULD YOU LIKE TO ?",
                    style: TextStyle(fontSize: 19, fontWeight: FontWeight.w600),
                  )
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.only(
                left: 10,
                right: 10,
                top: 10,
              ),
              height: 280,
              child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  crossAxisSpacing: 5,
                  mainAxisSpacing: 5,
                ),
                itemCount: gridList.length,
                itemBuilder: (context, index) {
                  return Card(
                      color: Colors.white,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            height: 50,
                            width: 40,
                            decoration: BoxDecoration(
                                image: DecorationImage(
                              image: AssetImage(gridList[index][1]),
                              // fit: BoxFit.fill,
                            )),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            gridList[index][0],
                            style: TextStyle(fontWeight: FontWeight.w500),
                            textAlign: TextAlign.center,
                          )
                        ],
                      ));
                },
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 10),
              child: Row(
                children: [
                  Icon(
                    Icons.ac_unit,
                    color: Colors.orange.shade600,
                    size: 28,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    "LAST TRANSACTIONS",
                    style: TextStyle(fontSize: 19, fontWeight: FontWeight.w600),
                  )
                ],
              ),
            ),
            Expanded(
              child: Padding(
                padding: EdgeInsets.only(left: 10,right: 10,top: 10),
                child: ListView.separated(
                  itemCount: transactions.length,
                  itemBuilder: (context, index) {
                    return Card(
                      child: Container(
                        height: 70,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Row(
                          children: [
                            Container(
                              width: 10,
                              height: double.infinity,
                              decoration: BoxDecoration(
                                color: Colors.red.shade600,
                                borderRadius: BorderRadius.only(bottomLeft: Radius.circular(10),topLeft: Radius .circular(10))
                              ),
                            ),
                            Expanded(
                              child: ListTile(
                              title: Text("CWDR/974884/${transactions[index][0]}",style: TextStyle(fontWeight: FontWeight.bold,),),
                              subtitle: Text("${transactions[index][1]}",style: TextStyle(fontWeight: FontWeight.w500,color: Colors.black87),),
                              trailing: Text("\$${transactions[index][2]}",style: TextStyle(fontSize: 15,fontWeight: FontWeight.w500),),
                                ),
                            ),
                          ],
                        ),
                      ),
                    );
                  }, separatorBuilder: (BuildContext context, int index) {
                    return SizedBox(height: 5,);
                },
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
