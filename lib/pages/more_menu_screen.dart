
import 'package:flutter/material.dart';
import 'package:payment_application/main.dart';

class MoreMenuScreen extends StatefulWidget {
  static const String id = "MORE_MENU_SCREEN";
  @override
  _MoreMenuScreenState createState() => _MoreMenuScreenState();
}

class _MoreMenuScreenState extends State<MoreMenuScreen> {

  List<MenuItem> menuItems = [
    MenuItem(text: "Profile Management", icon: Icons.info),
    MenuItem(text: "Transfers", icon: Icons.info),
    MenuItem(text: "About", icon: Icons.info)
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("More Menu"),
        backgroundColor: Color.fromRGBO(36, 62, 110, 0.85),
      ),
      body: ListView.builder(
        itemCount: menuItems.length,
        padding: EdgeInsets.only(top: 16),
        shrinkWrap: true,
        itemBuilder: (context, index){
          return _getListItem(context, menuItems[index]);
        },
      ),
    );
  }

  Widget _getListItem(BuildContext context, MenuItem item) {
    return Container(
      padding: EdgeInsets.only(top: 20, left: 20, right: 20),
      child: GestureDetector(
        onTap: () {

        },
        child: Material(
            color: Color.fromRGBO(220, 224, 234, 1),
            elevation: 6.0,
            borderRadius: BorderRadius.circular(10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.all(10),
                  child: Icon(item.icon, color: Color.fromRGBO(36, 62, 110, 1),),
                ),
                Text(
                  item.text,
                  style: TextStyle(
                      color: Color.fromRGBO(36, 62, 110, 1),
                      fontWeight: FontWeight.bold,
                      fontSize: 18
                  ),
                ),
              ],
            )
        ),
      ),
    );
  }
}

class MenuItem {
  String text;
  IconData icon;

  MenuItem({
    required this.text,
    required this.icon,
  });
}