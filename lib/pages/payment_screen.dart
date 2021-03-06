import 'package:flutter/material.dart';
import 'package:payment_application/main.dart';

class PaymentScreen extends StatefulWidget {
  static const String id = "PAYMENT_SCREEN";

  @override
  _PaymentScreenState createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {
  double billNum1 = 120.00;
  double billNum2 = 50.85;
  late final List<Widget> entries;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        centerTitle: true,
        title: Text("Outstanding Bills"),
        backgroundColor: Color.fromRGBO(36, 62, 110, 0.85),
      ),
      body: Container(
          height: MediaQuery.of(context).size.height,
          child: Column(
            children: [
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                child: TextField(
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Color.fromRGBO(220, 224, 234, 1),
                    border: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.black)),
                    prefixIcon: const Icon(
                      Icons.search,
                      color: Colors.black,
                    ),
                    suffixIcon: Icon(
                      Icons.clear,
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
              _createListTile("Water", "Irbid Water Company", this.billNum1, 1234567891),


              SizedBox(
                height: 16,
              ),

              _createListTile("Internet", "Zain Fiber", this.billNum2, 1234567891),

              Spacer(),

              Container(
                height: 120,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  color: Color.fromRGBO(220, 224, 234, 1),
                ),
                child: Row(
                  //crossAxisAlignment: CrossAxisAlignment.center, // not working
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 50, top: 30),
                            child: Text(
                              "Outstanding bills total:",
                              style: TextStyle(
                                color: Color.fromRGBO(99, 123, 160, 1),
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 55),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Column(
                                  children: [
                                    Text(
                                      _calc(this.billNum1, this.billNum2)
                                          .toString(),
                                      style: TextStyle(
                                          color: Color.fromRGBO(36, 62, 110, 1),
                                          fontWeight: FontWeight.bold,
                                          fontSize: 28),
                                    ),
                                  ],
                                ),
                                Column(
                                  children: [
                                    Text(" JOD",
                                        style: TextStyle(
                                            color:
                                                Color.fromRGBO(36, 62, 110, 1),
                                            fontWeight: FontWeight.bold,
                                            fontSize: 15))
                                  ],
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Container(
                        child: Padding(
                          padding: const EdgeInsets.only(right: 20, left: 20),
                          child: CustomButton(
                              callback: (){},
                              text: "Pay",
                              color: Color.fromRGBO(36, 62, 110, 1)
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              )
            ],
          )),
    );
  }

  double _calc(double billNum1, double billNum2) {
    return billNum2 + billNum1;
  }

  Widget _createListTile(String billName, String billDescription, double amount, int accountNumber)
  {
    return Container(
      height: 100,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        color: Color.fromRGBO(220, 224, 234, 1),
      ),
      child: Row(
        children: [
          SizedBox(
            width: 16,
          ),
          CircleAvatar(
            backgroundColor: Color.fromRGBO(36, 62, 110, 1),
            child: Icon(Icons.check),
          ),
          SizedBox(
            width: 16,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Text(billName,
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 20,
                          fontWeight: FontWeight.w500),
                      overflow: TextOverflow.ellipsis),
                  Text(
                    " $billDescription",
                    style: TextStyle(
                      color: Color.fromRGBO(99, 123, 160, 1),
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                    ),
                  )
                ],
              ),
              Text("Account number | $accountNumber",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 11,
                    fontWeight: FontWeight.bold,
                  ),
                  overflow: TextOverflow.ellipsis),
            ],
          ),
          Spacer(),
          Column(
            //directly column before it use spacer
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Due Amount",
                  style: TextStyle(
                    color: Color.fromRGBO(99, 123, 160, 1),
                    fontSize: 11,
                    fontWeight: FontWeight.bold,
                  ),
                  overflow: TextOverflow.ellipsis),
              Text("$amount JOD",
                  style: TextStyle(
                      color: Color.fromRGBO(36, 62, 110, 1),
                      fontWeight: FontWeight.bold,
                      fontSize: 17),
                  overflow: TextOverflow.ellipsis),
            ],
          ),
          SizedBox(
            width: 16,
          ),
        ],
      ),
    );
  }
}
