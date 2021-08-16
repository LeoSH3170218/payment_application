import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:payment_application/main.dart' as main;
import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';

class PaymentConfirmation extends StatefulWidget {
  static const String id = "PAYMENT_CONFIRMATION";
  @override
  _PaymentConfirmationState createState() => _PaymentConfirmationState();
}

class _PaymentConfirmationState extends State<PaymentConfirmation> {
  var day = DateFormat('EEEE').format(DateTime.now());
  String currentTime = DateFormat('kk:mm').format(DateTime.now());
  List<Account> accounts = [
    Account(accountID: "1234 - 5678945 - 44", accountName: "first account", balance: 2600.00),
    Account(accountID: "1234 - 4567891 - 65", accountName: "second account", balance: 1500.00),
    Account(accountID: "1234 - 4567893 - 45", accountName: "third account", balance: 6000.50)
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("$day, $currentTime"),
        centerTitle: true,
        backgroundColor: Color.fromRGBO(36, 62, 110, 0.85),
        actions: [
          Padding(
            padding: EdgeInsets.only(right: 10.0),
            child: GestureDetector(
              onTap: (){},
              child: Icon(
                Icons.clear,
                size: 26.0,
              ),
            ),
          ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(
              height: 20,
            ),
            CircleAvatar(
              child: Text(
                "RQ",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                  fontSize: 25
                ),
              ),
              radius: 40,
              backgroundColor: Color.fromRGBO(36, 62, 110, 0.85),
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              "Arab bank",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Color.fromRGBO(36, 62, 110, 0.85),
                fontSize: 20
              ),
            ),
            Text(
              "sent you a payment request",
              style: TextStyle(
                color: Color.fromRGBO(99, 123, 160, 1),
                fontSize: 15
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              height: 150,
              child: Padding(
                padding: EdgeInsets.only(left: 30, right: 30),
                child: Text(
                    "message from mical something like that in your bank"
                        " account please confirm the payment "
                        "finish everything",
                  style: TextStyle(
                    color: Colors.black54,
                  ),
                ),
              ),
            ),
            //Spacer(),


            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.only(left: 20),
                  child: Text(
                    "Choose an Account",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      color: Color.fromRGBO(36, 62, 110, 0.85),
                    ),
                  ),
                ),
              ],
            ),
            Expanded(
              child: ListView.builder(
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemCount: accounts.length,
                itemBuilder: (BuildContext context, int index){
                  return Container(
                    padding: EdgeInsets.only(left: 25, right: 20),
                    child: Card(
                        shadowColor: Colors.grey,
                        color: Color.fromRGBO(243, 246, 249, 1),
                        semanticContainer: true,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              height: 10,
                            ),
                            Row(
                              children: [
                                SizedBox(
                                  width: 20,
                                ),
                                Text(
                                  accounts[index].accountName,
                                  style: TextStyle(
                                      fontSize: 25,
                                      fontWeight: FontWeight.bold
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                SizedBox(
                                  width: 20,
                                ),
                                Text(
                                  accounts[index].accountID,
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.grey,
                                  ),
                                )
                              ],
                            ),
                            Row(
                              children: [
                                SizedBox(
                                  width: 200,
                                ),
                                Text(
                                  accounts[index].balance.toString() + " JOD",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Color.fromRGBO(36, 62, 110, 1),
                                      fontSize: 20
                                  ),
                                ),
                                SizedBox(
                                  width: 10,
                                )
                              ],
                            ),
                          ],
                        ),
                      ),

                  );
                }
              ),
            ),
            SizedBox(
              height: 50,
            ),
            Row(
              children: [
                Padding(
                  padding: EdgeInsets.only(left: 40),
                ),
                Container(
                  width: 150,
                  height: 50,
                  child: OutlinedButton(
                    onPressed: (){},
                    child: Text(
                      "Decline",
                      style: TextStyle(
                        fontSize: 20,
                        color: Color.fromRGBO(36, 62, 110, 1),
                      ),
                    ),
                    style: OutlinedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                      side: BorderSide(
                        width: 2,
                        color: Color.fromRGBO(36, 62, 110, 1),

                      ),

                    ),
                  ),
                ),
                SizedBox(
                  width: 20,
                ),
                Container(
                  width: 150,
                  height: 50,
                  child: OutlinedButton(
                    onPressed: (){},
                    child: Text(
                      "Confirm",
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.white,
                      ),
                    ),
                    style: OutlinedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                      backgroundColor: Color.fromRGBO(36, 62, 110, 1),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 20,
            )

          ],
        ),
      ),
    );
  }
}

class Account{
  String accountName;
  String accountID;
  double balance;
  Account({
    required this.accountID,
    required this.accountName,
    required this.balance
});

}
