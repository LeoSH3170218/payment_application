import 'package:flutter/material.dart';
import 'package:payment_application/pages/more_menu_screen.dart';
import 'package:payment_application/pages/payment_confirmation.dart';
import 'package:payment_application/pages/payment_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData.light(),
      routes: {
        MyHomePage.id:(context) => MyHomePage(title: 'Home',),
        PaymentScreen.id: (context) => PaymentScreen(),
        MoreMenuScreen.id: (context) => MoreMenuScreen(),
        PaymentConfirmation.id: (context) => PaymentConfirmation()
      },
      home: MyHomePage(title: 'Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  static const String id = "HOME_SCREEN";
  MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}



class _MyHomePageState extends State<MyHomePage> {
  //Color defaultColor = const Color.fromRGBO(64, 80, 181, 1.0);
  Color defaultColor = Color.fromRGBO(36, 62, 110, 0.85);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        centerTitle: true,
        backgroundColor: Color.fromRGBO(36, 62, 110, 0.85),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CustomButton(
              callback: () {
                //print(defaultColor);
                Navigator.of(context).pushNamed(PaymentScreen.id);
              },
              text: 'Proceed to payment',
              color: Color.fromRGBO(36, 62, 110, 0.85),

            ),
            CustomButton(
                callback: () {
                  //print(defaultColor);
                  Navigator.of(context).pushNamed(MoreMenuScreen.id);
                },
                text: "Proceed to list menu",
                color: Color.fromRGBO(36, 62, 110, 0.85)
            ),
            CustomButton(
                callback: () {
                  //print(defaultColor);
                  Navigator.of(context).pushNamed(PaymentConfirmation.id);
                },
                text: "Proceed to confirmation",
                color: Color.fromRGBO(36, 62, 110, 0.85)
            ),
          ],
        ),
      ),

    );
  }
}

class CustomButton extends StatelessWidget{
  final VoidCallback callback;
  final String text;
  final Color color;

  const CustomButton({Key? key, required this.callback, required this.text, required this.color}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(bottom: 20),
      child: Material(
        color: color,
        elevation: 6.0,
        borderRadius: BorderRadius.circular(15.0),
        child: MaterialButton(
          onPressed: callback,
          minWidth: 200.0,
          height: 45,
          child: Text(
            text,
            style: TextStyle(
                color: Colors.white,
                //fontWeight: FontWeight.bold,
                fontSize: 18
            ),
          ),
        ),
      ),
    );
  }
}

