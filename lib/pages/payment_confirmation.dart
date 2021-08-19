import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:carousel_slider/carousel_slider.dart';

class PaymentConfirmation extends StatefulWidget {
  static const String id = "PAYMENT_CONFIRMATION";

  @override
  _PaymentConfirmationState createState() => _PaymentConfirmationState();
}

class _PaymentConfirmationState extends State<PaymentConfirmation> {
  var _day = DateFormat('EEEE').format(DateTime.now());
  String _currentTime = DateFormat('kk:mm').format(DateTime.now());
  List<Account> _accounts = [
    Account(accountID: "1234 - 5678945 - 44", accountName: "first account", balance: 2600.00),
    Account(accountID: "1234 - 4567891 - 65", accountName: "second account", balance: 1500.00),
    Account(accountID: "1234 - 4567893 - 45", accountName: "third account", balance: 6000.50)
  ];
  int _currentPos = 0;

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        title: Text("$_day, $_currentTime"),
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
      body: ListView(
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
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Color.fromRGBO(36, 62, 110, 0.85),
                    fontSize: 20
                ),
              ),
              Text(
                "sent you a payment request",
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: Color.fromRGBO(99, 123, 160, 1),
                    fontSize: 15
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Padding(
                  padding: EdgeInsets.only(left: 30, right: 30, bottom: 30),
                  child: Wrap(
                    children: [
                      Text(
                        "message from mical something like that in your bank"
                            " account please confirm the payment ",
                        style: TextStyle(
                          color: Colors.black54,
                        ),
                      ),
                    ],
                  ),
                ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Text(
                  "Choose an Account",
                  textAlign: TextAlign.start,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    color: Color.fromRGBO(36, 62, 110, 0.85),
                  ),
                ),
              ),

              CarouselSlider(
                options: CarouselOptions(
                    height: 100.0,
                    enableInfiniteScroll: false,
                    onPageChanged: (i, reason) {
                      setState(() {
                        _currentPos = i;
                      });
                    }
                ),
                items: _accounts.map((account) {
                  return Builder(
                    builder: (BuildContext context) {
                      return Container(
                        width: MediaQuery.of(context).size.width,
                        margin: EdgeInsets.symmetric(horizontal: 5.0),
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
                                    account.accountName,
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
                                    account.accountID,
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.grey,
                                    ),
                                  )
                                ],
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Text(
                                    account.balance.toString() + " JOD",
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
                    },
                  );
                }).toList(),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: _accounts.map((url) {
                  int index = _accounts.indexOf(url);
                  return Container(
                    width: 8.0,
                    height: 8.0,
                    margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 2.0),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: _currentPos == index
                          ? Color.fromRGBO(0, 0, 0, 0.9)
                          : Color.fromRGBO(0, 0, 0, 0.4),
                    ),
                  );
                }).toList(),
              ),

              SizedBox(
                height: 50,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 40),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Container(
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
                    ),
                    SizedBox(
                      width: 40,
                    ),
                    Expanded(
                      child: Container(
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
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              )
            ],
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
