import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:payment_application/pages/product_screen.dart';

class CartScreen extends StatefulWidget {
  CartScreen({Key? key, required this.cart}) : super(key: key);
  final CartModel cart;
  static const String id = "CART_SCREEN";

  @override
  _CartScreenState createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "My Cart"
        ),
        actions: [
          CloseButton(),
        ],
      ),
      body: ListView.builder(
        itemCount: widget.cart.products.length,
        itemBuilder: (context, index){
          return Row(
            children: [
              Container(
                width: (MediaQuery.of(context).size.width),
                height: 90,
                child: Card(
                  child: Row(
                    children: [
                      SizedBox(
                        width: 10,
                      ),
                      CircleAvatar(
                        backgroundColor: widget.cart.products[index].color,
                        radius: 25,
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            widget.cart.products[index].productName,
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                            ),
                          ),
                          Text(
                            widget.cart.products[index].productDescription,
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 15,
                                color: Colors.grey
                            ),
                          ),
                        ],
                      ),
                      Spacer(),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          CloseButton(
                            onPressed: (){
                              widget.cart.products.removeAt(index);
                              setState(() {});
                            },
                          ),
                          Spacer(),
                          Text(
                            widget.cart.products[index].productPrice.toString() + " JOD",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}

class CartModel extends ChangeNotifier{
  final List<Product> products = [];

  void add(Product item) {
    products.add(item);
    notifyListeners();
  }

  void removeAll() {
    products.clear();
    notifyListeners();
  }


}
